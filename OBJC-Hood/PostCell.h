//
//  PostCell.h
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DataService.h"

@interface PostCell : UITableViewCell {
    
    DataService *myDataService;
}

@property(nonatomic, weak) IBOutlet UIImageView *postImg;
@property(nonatomic, weak) IBOutlet UILabel *titleLbl;
@property(nonatomic, weak) IBOutlet UILabel *descLbl;

-(void)configureCell:(Post *)post;

@end
