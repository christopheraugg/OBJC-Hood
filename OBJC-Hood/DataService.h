//
//  DataService.h
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 
#import "Post.h"

@interface DataService : NSObject


extern NSString * const KEY_POSTS;

+(NSString *)saveImageAndCreatePath:(UIImage *)image;
+(void)savePosts;
+(void)loadPosts;
+(UIImage *)imageForPath:(NSString *)path;
+(void)addPost:(Post *)post;
+(NSString *)documentsPathForFileName:(NSString *)name;
+(NSArray<Post *> *)posts;
+ (id)alloc;

@end
