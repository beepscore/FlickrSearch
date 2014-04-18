//
//  FlickrPhotoCell.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import "FlickrPhoto.h"

@implementation FlickrPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setPhoto:(FlickrPhoto *)photo
{
    if(_photo != photo) {
        _photo = photo;
    }
    self.imageView.image = _photo.thumbnail;
}

@end
