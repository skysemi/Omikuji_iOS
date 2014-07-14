//
//  ResultPlotViewController.m
//  Omikuji
//
//  Created by 岡 大輔 on 2014/07/14.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "ResultPlotViewController.h"

//ユーザーインクルード
#import "AppDelegate.h"

@interface ResultPlotViewController ()
- (IBAction)RetryUranai:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *ResultPlotLabel;

@end

@implementation ResultPlotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)RewriteResultPlotLabel
{
    NSArray *UranaiResultKouho = @[@"大吉",@"中吉",@"小吉",@"末吉",@"凶",@"大凶"];
    self.ResultPlotLabel.text =UranaiResultKouho[(arc4random()%UranaiResultKouho.count)];
    

    //self.ResultPlotLabel.text = @"これはあくまでも占いです";
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self RewriteResultPlotLabel];
    
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    delegate.FirstUranai = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self RewriteResultPlotLabel];
    CATransition *fadeAnim = [CATransition animation];
    fadeAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [fadeAnim setType:kCATransitionFade];
    [fadeAnim setDuration:3.0f];
    [self.ResultPlotLabel.layer addAnimation:fadeAnim forKey:nil];
    [self.view.layer addAnimation:fadeAnim forKey:nil];
    
    self.ResultPlotLabel.textColor = [UIColor redColor];
    if([self.ResultPlotLabel.text isEqualToString:@"凶"]
            ||[self.ResultPlotLabel.text isEqualToString:@"大凶"]){
        self.view.backgroundColor = [UIColor blackColor];
    }
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)RetryUranai:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
