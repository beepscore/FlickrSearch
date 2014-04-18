//
//  BSStoryboardViewControllerLoader.h
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSStoryboardViewControllerLoader : NSObject

/**
 @parameter storyboardName example @"Main_iPhone" or @"Main_iPad"
 @parameter identifier The view controller identifier in the storyboard
 **/
+ (UIViewController *)viewControllerWithStoryboardName:(NSString *)storyboardName
                                            identifier:(NSString *)identifier;
@end
