//
//  Post.h
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding> {
    
    NSString *imagePath;
    NSString *title;
    NSString *postDesc;
}

@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *postDesc;

- (id)initWithImagePath:(NSString *)aImagePath title:(NSString *)aTitle description:(NSString *)aDescription;

@end
