//
//  ViewController.m
//  Omikuji
//
//  Created by 岡 大輔 on 2014/07/14.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "ViewController.h"

//ユーザーインクルード
#import "AppDelegate.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *UranaiStartButton;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    if(delegate.FirstUranai == YES){
        [self.UranaiStartButton setTitle:@"今日の運勢を見る" forState:UIControlStateNormal];
        
    }else {
        [self.UranaiStartButton setTitle:@"もう一度今日の運勢を見る" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
