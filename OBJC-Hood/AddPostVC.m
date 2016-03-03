//
//  AddPostVC.m
//  OBJC-Hood
//
//  Created by Chris Augg on 3/2/16.
//  Copyright © 2016 Auggie Doggie iOSware. All rights reserved.
//

#import "AddPostVC.h"

@interface AddPostVC ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIImageView *postImg;
@property (weak, nonatomic) IBOutlet UITextField *descField;

@end


@implementation AddPostVC

UIImagePickerController *imagePicker;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    myDataService = [DataService sharedInstance];
    
    int frameSize = _postImg.frame.size.width / 2;
    [[_postImg layer] setCornerRadius:frameSize];
    _postImg.clipsToBounds = YES;
    
    imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    
}

- (IBAction)addPicBtnPressed:(id)sender {
    
    [sender setTitle:@"" forState:normal];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)makeBtnPressed:(id)sender {
    
    NSString *title = _titleField.text;
    NSString *desc = _descField.text;
    UIImage *img = _postImg.image;
    
    if (title) {
        
        if (img) {
                        
            NSString *imgPath = [myDataService saveImageAndCreatePath:img];
            Post *post = [[Post alloc]initWithImagePath:imgPath title:title description:desc];
            [myDataService addPost:post];
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
    }
}

- (IBAction)cancelBtnPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    _postImg.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

@end
