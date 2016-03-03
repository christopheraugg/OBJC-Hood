//
//  ViewController.m
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import "ViewController.h"
#import "PostCell.h"
#import "Post.h"

@interface ViewController ()

@property(nonatomic, strong) IBOutlet UITableView *tableView;


@property (nonatomic,strong) NSArray *tempArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tempArr = [[NSArray alloc] initWithObjects:@"Red",@"Yellow",@"Green", nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tempArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    
   static NSString *CellIdentifier =@"PostCell";
   PostCell *cell = (PostCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell configureCell:[self.tempArr objectAtIndex:indexPath.row]];
    
    
    
    return cell;
}


@end
