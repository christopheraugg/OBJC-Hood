//
//  DataService.m
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import "DataService.h"


@implementation DataService

// found at http://www.daveoncode.com/2011/12/19/fundamental-ios-design-patterns-sharedinstance-singleton-objective-c/
+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

- (id)init {
    if (self = [super init]) {
        _loadedPosts = [[NSMutableArray alloc]init];
        [self loadPosts];
    }
    
    return self;
}

NSString * const KEY_POSTS = @"posts";


-(NSString *)saveImageAndCreatePath:(UIImage *)image {
    
    NSData *imgData = UIImagePNGRepresentation(image);
    NSString *imgPath = [NSString stringWithFormat:@"image%f.png", NSDate.timeIntervalSinceReferenceDate];
    NSString *fullPath = [self documentsPathForFileName:imgPath];
    [imgData writeToFile:fullPath atomically:YES];
    return imgPath;    
}

-(void)savePosts {
    
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:_loadedPosts];
    [[NSUserDefaults standardUserDefaults]setObject:postsData forKey:KEY_POSTS];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)loadPosts {
    
    NSData* postsData = [[NSUserDefaults standardUserDefaults]objectForKey:KEY_POSTS];
    
    if (postsData) {
        NSMutableArray<Post *> *postsArr = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
        if (postsArr) {
            _loadedPosts = postsArr;
        }
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"postsLoaded" object:nil];
}

-(UIImage *)imageForPath:(NSString *)path {
    
    NSString *fullPath = [self documentsPathForFileName:path];
    UIImage *image = [UIImage imageNamed:fullPath];
    return image;
}

-(void)addPost:(Post *)post {
    
    [_loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];    
}

-(NSString *)documentsPathForFileName:(NSString *)name {
    
    NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = [paths objectAtIndex:0];
    return [fullPath stringByAppendingPathComponent:name];
}

@end
