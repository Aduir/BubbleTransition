//
//  ViewController.m
//  BubbleTransition
//
//  Created by xiayushu on 16/2/18.
//  Copyright © 2016年 xiayushu. All rights reserved.
//

#import "ViewController.h"
#import "BubbleTransition.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) BubbleTransition *transition;
@property (weak, nonatomic) IBOutlet UIButton *bubbleButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    vc.transitioningDelegate = self;
    vc.modalPresentationStyle = UIModalPresentationCustom;
}

- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC {
    
}

- (BubbleTransition *)transition {
    if (!_transition) {
        _transition = [[BubbleTransition alloc] init];
    }
    return _transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.transition.transitionMode = BubbleTransitionModePresent;
    self.transition.startPoint = self.bubbleButton.center;
    self.transition.bubbleColor = self.bubbleButton.backgroundColor;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transition.transitionMode = BubbleTransitionModeDismiss;
    self.transition.startPoint = self.bubbleButton.center;
    self.transition.bubbleColor = self.bubbleButton.backgroundColor;
    return self.transition;
}

@end
