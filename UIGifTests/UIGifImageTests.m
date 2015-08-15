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
    UIGifImage *gif = [[UIGifImage alloc] initWithData:gifData];

    UIImageView *imageview = [[UIImageView alloc] initWithImage:gif];

    XCTAssertNotNil(imageview, @"Cannot find imageview instance");


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
