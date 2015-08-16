//
//  UIGifTests.m
//  UIGifTests
//
//  Created by Salvador Guerrero on 8/15/15.
//  Copyright (c) 2015 ByteApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UIGifImage.h"

@interface UIGifImageTests : XCTestCase

@end

@implementation UIGifImageTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUIGif
{
    NSString *testGifPath = [[[NSBundle bundleForClass:self.class] resourcePath] stringByAppendingPathComponent:@"test.gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:testGifPath];

    // test 1

    UIGifImage *gif = [[UIGifImage alloc] initWithData:gifData];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:gif];
    XCTAssertNotNil(imageview, @"Cannot find gif instance");
    NSLog(@"gif size: %F", gif.size.width);

    // test 2

    UIGifImage *gif2 = [[UIGifImage alloc] initWithData:gifData scale:0.5];
    XCTAssertNotNil(gif2, @"Cannot find gif instance");
    NSLog(@"gif2 size: %F", gif2.size.width);

    // test 3

    UIGifImage *gif3 = [UIGifImage imageWithData:gifData];
    XCTAssertNotNil(gif3, @"Cannot find gif instance");
    NSLog(@"gif3 size: %F", gif3.size.width);

    // test 4

    UIGifImage *gif4 = [UIGifImage imageWithData:gifData scale:2.0];
    XCTAssertNotNil(gif4, @"Cannot find gif instance");
    NSLog(@"gif4 size: %F", gif4.size.width);

    // test 5

    UIGifImage *gif5 = [UIGifImage imageWithContentsOfFile:testGifPath];
    XCTAssertNotNil(gif5, @"Cannot find gif instance");

    // test 6

    UIGifImage *gif6 = [UIGifImage imageWithContentsOfFile:[testGifPath stringByAppendingString:@"fail!"]];
    XCTAssertNil(gif6, @"Cannot find gif instance");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
