//
//  FlickrPhotoHeaderView.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/19/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "FlickrPhotoHeaderView.h"
#import "FlickrPhotoHeaderViewPrivate.h"

@implementation FlickrPhotoHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSearchText:(NSString *)text
{
    self.searchLabel.text = text;
    UIImage *shareButtonImage = [[UIImage imageNamed:@"header_bg.png"]
                                 resizableImageWithCapInsets:
                                 UIEdgeInsetsMake(68, 68, 68, 68)];
    
    self.backgroundImageView.image = shareButtonImage;
}

@end
