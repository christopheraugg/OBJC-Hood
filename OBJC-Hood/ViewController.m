//
//  ViewController.m
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import "ViewController.h"
//#import "PostCell.h"
//#import "Post.h"
//#import "DataService.h"


@interface ViewController ()

@property(nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [DataService loadPosts];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(onPostsLoaded:)
                                          name:@"postsLoaded"
                                          object:nil];    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[DataService posts]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
   Post *post = [[DataService posts]objectAtIndex:indexPath.row];
   static NSString *CellIdentifier =@"PostCell";
   PostCell *cell = (PostCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell configureCell:post];
    
    return cell;
}

- (void)onPostsLoaded:(NSNotification *)note {
    [self.tableView reloadData];
}

@end
