//
//  DataService.m
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import "DataService.h"


@implementation DataService

NSMutableArray<Post *> *loadedPosts;


NSString * const KEY_POSTS = @"posts";

+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'DataService' cannot be instantiated!"];
    return nil;
}

+(NSString *)saveImageAndCreatePath:(UIImage *)image {
    
    NSData *imgData = UIImagePNGRepresentation(image);
    NSString *imgPath = [NSString stringWithFormat:@"image%f.png", NSDate.timeIntervalSinceReferenceDate];
    NSString *fullPath = [self documentsPathForFileName:imgPath];
    [imgData writeToFile:fullPath atomically:YES];
    return imgPath;    
}

+(void)savePosts {
    
    NSData* postsData = [NSKeyedArchiver archivedDataWithRootObject:loadedPosts];
    [[NSUserDefaults standardUserDefaults]setObject:postsData forKey:KEY_POSTS];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(void)loadPosts {
    
    NSData* postsData = [[NSUserDefaults standardUserDefaults]objectForKey:KEY_POSTS];
    
    if (postsData) {
        NSMutableArray<Post *> *postsArr = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
        if (postsArr) {
            loadedPosts = postsArr;
        }
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"postsLoaded" object:nil];
}

+(UIImage *)imageForPath:(NSString *)path {
    
    NSString *fullPath = [self documentsPathForFileName:path];
    UIImage *image = [UIImage imageNamed:fullPath];
    return image;
}

+(void)addPost:(Post *)post {
    
    [loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
}

+(NSString *)documentsPathForFileName:(NSString *)name {
    
    NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = [paths objectAtIndex:0];
    return [fullPath stringByAppendingPathComponent:name];
}

+(NSArray<Post *> *)posts {
    return loadedPosts;
}

@end
