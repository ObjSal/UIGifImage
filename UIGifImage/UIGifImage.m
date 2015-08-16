//
//  UIGifImage.m
//  UIGifImage
//
//  Created by Salvador Guerrero on 8/15/15.
//  Copyright (c) 2015 ByteApps. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import "UIGifImage.h"

@implementation UIGifImage

@synthesize images = _images;
@synthesize duration = _duration;

- (NSArray *)images
{
    return _images;
}

- (NSTimeInterval)duration
{
    return _duration;
}

- (instancetype)initWithData:(NSData *)data
{
    if ((self = [super initWithData:data]))
    {
        // retain the data because UIImage doesn't provide a helper for this

        _data = data;

        if ([self.class containsGifData:data])
        {
            [self processGifData:data];
        }
    }

    return self;
}

- (instancetype)initWithData:(NSData *)data scale:(CGFloat)scale
{
    return [super initWithData:data scale:scale];
}

+ (instancetype)imageWithData:(NSData *)data
{
    return [[self alloc] initWithData:data];
}

+ (instancetype)imageWithData:(NSData *)data scale:(CGFloat)scale
{
    return [[self alloc] initWithData:data scale:scale];
}

+ (instancetype)imageWithContentsOfFile:(NSString *)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];

    return [[self alloc] initWithData:data];
}

+ (BOOL)containsGifData:(NSData *)data
{
    uint8_t *dataBytes = (uint8_t *)data.bytes;

    return (dataBytes[0] == 'G' && dataBytes[1] == 'I' && dataBytes[2] == 'F');
}

- (void)processGifData:(NSData *)data
{
    /* The code below was based on GIFLoader from the following
     * URL: https://gist.github.com/andrei512/3894888
     */

    struct CGImageSource *imageSource = CGImageSourceCreateWithData((CFDataRef)data, NULL);

    if (imageSource)
    {
        size_t imageSourceCount = CGImageSourceGetCount(imageSource);
        NSMutableArray *frames = [NSMutableArray arrayWithCapacity:imageSourceCount];
        NSTimeInterval animationTime = 0.f;

        for (size_t i = 0; i < imageSourceCount; i++)
        {
            // create frame image

            struct CGImage *frameImage = CGImageSourceCreateImageAtIndex(imageSource, i, NULL);

            if (frameImage)
            {
                // get the properties of the gif

                NSDictionary *properties = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(imageSource, i, NULL));
                NSDictionary *frameProperties = properties[(NSString *)kCGImagePropertyGIFDictionary];
                NSNumber *delayTime = frameProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];

                // increase the animation time

                animationTime += [delayTime floatValue];

                // add the frame image to the frames array

                [frames addObject:[UIImage imageWithCGImage:frameImage]];

                // release the image

                CGImageRelease(frameImage);
            }
        }
        
        CFRelease(imageSource);
        
        _images = frames;
        _duration = animationTime;
    }
}

@end
