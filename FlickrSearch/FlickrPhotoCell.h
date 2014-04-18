//
//  FlickrPhotoCell.h
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import QuartzCore;
@class FlickrPhoto;

@interface FlickrPhotoCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;

@end