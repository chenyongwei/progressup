//
//  ViewController.m
//  ProgressUp
//
//  Created by Yongwei on 11/12/13.
//  Copyright (c) 2013 Yongwei. All rights reserved.
//

#import "ViewController.h"
#import "CurveView.h"

@interface ViewController ()

@end


@implementation ViewController

UIImageView *balloon;
UIView *balloonContainer;
CurveView *curve;


- (void)viewWillLayoutSubviews
{
    [balloonContainer removeFromSuperview];
    [curve removeFromSuperview];
    
    balloonContainer = [[UIImageView alloc]
                        initWithFrame:CGRectMake(
                                                 self.view.bounds.size.width/2 - balloon.bounds.size.width/2,
                                                 self.view.bounds.size.height/2 - balloon.bounds.size.height/2,
                                                 balloon.bounds.size.width,
                                                 balloon.bounds.size.width)
                        ];
//    [balloonContainer setBackgroundColor:[UIColor redColor]];
    [balloonContainer addSubview:balloon];
    
    curve = [[CurveView alloc]
                        initWithFrame:CGRectMake(
                                                 self.view.bounds.size.width * 0.1,
                                                 self.view.bounds.size.height * 0.1,
                                                 self.view.bounds.size.width * 0.8,
                                                 self.view.bounds.size.height * 0.8)
                        ];
    [curve setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:curve];
    [self.view addSubview:balloonContainer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    balloon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"balloon"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
