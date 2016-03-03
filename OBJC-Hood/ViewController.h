//
//  ViewController.h
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCell.h"
#import "Post.h"
#import "DataService.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
    DataService *myDataService;
}



@end

