//
//  StoryboardViewControllerTests.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "ViewControllerPrivate.h"
#import "BSStoryboardViewControllerLoader.h"

@interface StoryboardViewControllerTests : XCTestCase
@property ViewController *vc;
@end

@implementation StoryboardViewControllerTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStoryboardViewControllerIPadCollectionView
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPad"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.collectionView);
}

- (void)testStoryboardViewControllerIPhoneCollectionView
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.collectionView);
}

- (void)testStoryboardViewControllerIPadCollectionViewDataSource
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPad"
                                 identifier:@"ViewController"];

    XCTAssertEqualObjects(self.vc, self.vc.collectionView.dataSource);
}

- (void)testStoryboardViewControllerIPhoneCollectionViewDataSource
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];

    XCTAssertEqualObjects(self.vc, self.vc.collectionView.dataSource);
}

- (void)testStoryboardViewControllerIPadShareButton
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPad"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.shareButton);
}

- (void)testStoryboardViewControllerIPhoneShareButton
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.shareButton);
}

- (void)testStoryboardViewControllerIPadTextField
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPad"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.textField);
}

- (void)testStoryboardViewControllerIPhoneTextField
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.textField);
}

- (void)testStoryboardViewControllerIPadTextFieldDelegate
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPad"
                                 identifier:@"ViewController"];

    XCTAssertEqualObjects(self.vc, self.vc.textField.delegate);
}

- (void)testStoryboardViewControllerIPhoneTextFieldDelegate
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];

    XCTAssertEqualObjects(self.vc, self.vc.textField.delegate);
}

- (void)testStoryboardViewControllerIPadToolbar
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPad"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.toolbar);
}

- (void)testStoryboardViewControllerIPhoneToolbar
{
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];

    XCTAssertNotNil(self.vc.toolbar);
}

@end
