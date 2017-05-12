//
//  JYCViewController.m
//  JYCCommentStarView
//
//  Created by jiayuanchao on 05/12/2017.
//  Copyright (c) 2017 jiayuanchao. All rights reserved.
//

#import "JYCViewController.h"
#import "JYCCommentStarView.h"

@interface JYCViewController ()

@property (nonatomic, strong) JYCCommentStarView *starView;

@end

@implementation JYCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.starView = [[JYCCommentStarView alloc] initWithFrame:CGRectMake(0, 100, 150, 17) starValue:0 starMargin:3];
    self.starView.canClick = YES;
    [self.view addSubview:self.starView];
    NSLog(@"self.starView.currentStarValue = %f",self.starView.currentStarValue);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
