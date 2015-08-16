//
//  UIGifImage.h
//  UIGifImage
//
//  Created by Salvador Guerrero on 8/15/15.
//  Copyright (c) 2015 ByteApps. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for UIGifImage.
FOUNDATION_EXPORT double UIGifImageVersionNumber;

//! Project version string for UIGifImage.
FOUNDATION_EXPORT const unsigned char UIGifImageVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UIGifImage/PublicHeader.h>

@interface UIGifImage : UIImage

@property (nonatomic, readonly) NSData          *data;
@property (nonatomic, readonly) NSArray         *images;
@property (nonatomic, readonly) NSTimeInterval  duration;

// init instance methods

- (instancetype)initWithData:(NSData *)data;
- (instancetype)initWithData:(NSData *)data scale:(CGFloat)scale;

// init class methods

+ (instancetype)imageWithData:(NSData *)data;
+ (instancetype)imageWithData:(NSData *)data scale:(CGFloat)scale;
+ (instancetype)imageWithContentsOfFile:(NSString *)path;

// returns YES if the given data contains a gif image

+ (BOOL)containsGifData:(NSData *)data;

@end