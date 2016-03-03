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
    
    int frameSize = _postImg.frame.size.width / 2;
    [[_postImg layer] setCornerRadius:frameSize];
    _postImg.clipsToBounds = YES;    
}

-(void)configureCell:(NSString *)post {
    [_titleLbl setText:post];
    [_descLbl setText:@"Description testing"];
    [_postImg setImage:[UIImage imageNamed:@"barrel-water-bridge"]];
}

@end
