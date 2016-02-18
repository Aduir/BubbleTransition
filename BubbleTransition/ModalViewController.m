//
//  ModalViewController.m
//  BubbleTransition
//
//  Created by xiayushu on 16/2/18.
//  Copyright © 2016年 xiayushu. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.closeButton.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
