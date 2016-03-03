//
//  AddPostVC.h
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"
#import "Post.h"

@interface AddPostVC : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    DataService *myDataService;
}

@end
