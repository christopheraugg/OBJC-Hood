//
//  PostCell.m
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    myDataService = [DataService sharedInstance];
    
    int frameSize = _postImg.frame.size.width / 2;
    [[_postImg layer] setCornerRadius:frameSize];
    _postImg.clipsToBounds = YES;    
}

-(void)configureCell:(Post *)post {
    [_titleLbl setText:post.title];
    [_descLbl setText:post.postDesc];
    [_postImg setImage:[myDataService imageForPath:post.imagePath]];
}

@end
