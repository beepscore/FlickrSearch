//
//  ViewController.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/17/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerPrivate.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureUI];

    self.searches = [@[] mutableCopy];
    self.searchResults = [@{} mutableCopy];
    self.flickr = [[Flickr alloc] init];
    
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"FlickrCell"];
}

- (void)configureUI
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
    
    UIImage *navBarImage = [[UIImage imageNamed:@"navbar.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
    
    [self.toolbar setBackgroundImage:navBarImage
                  forToolbarPosition:UIToolbarPositionAny
                          barMetrics:UIBarMetricsDefault];
    
    UIImage *shareButtonImage = [[UIImage imageNamed:@"button.png"]
                                 resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
    [self.shareButton setBackgroundImage:shareButtonImage
                                forState:UIControlStateNormal
                              barMetrics:UIBarMetricsDefault];
    
    UIImage *textFieldImage = [[UIImage imageNamed:@"search_field.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.textField setBackground:textFieldImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButtonTapped:(id)sender {
//TODO:
}

#pragma mark - UITextFieldDelegate methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    // 1
    [self.flickr searchFlickrForTerm:textField.text
                     completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error) {
                         if(results && [results count] > 0) {
                             
                             if(![self.searches containsObject:searchTerm]) {
                                 // haven't searched for this term before
                                 NSLog(@"Found %d photos matching %@", [results count],searchTerm);
                                 [self.searches insertObject:searchTerm atIndex:0];
                                 self.searchResults[searchTerm] = results;
                             }
                             // 3
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 [self.collectionView reloadData];
                             });
                         } else {
                             NSLog(@"Error searching Flickr: %@", error.localizedDescription);
                         }
                     }];
    
    [textField resignFirstResponder];
    return YES; 
}

#pragma mark - UICollectionView Datasource
- (NSInteger)collectionView:(UICollectionView *)view
     numberOfItemsInSection:(NSInteger)section
{
    NSString *searchTerm = self.searches[section];
    return [self.searchResults[searchTerm] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.searches count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell"
                                                               forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

/*
 // returns header or footer for each section
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }
 */

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}

// only called if UICollection view allows multiple selection
- (void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *searchTerm = self.searches[indexPath.section]; FlickrPhoto *photo =
    self.searchResults[searchTerm][indexPath.row];

    // if width is 0, set a placeholder size for a thumbnail
    CGSize retval = photo.thumbnail.size.width > 0 ? photo.thumbnail.size : CGSizeMake(100, 100);

    // add space for border
    retval.height += 35;
    retval.width += 35;
    return retval;
}

// returns spacing between cells, headers, and footers
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end
