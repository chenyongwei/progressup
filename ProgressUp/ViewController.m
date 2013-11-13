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
UIImageView *daylightBG;
CurveView *curve;


- (void)viewWillLayoutSubviews
{
    [self layoutBackgroundImage];
    [self layoutBalloon];
    [self layoutCurve];
}

- (void)layoutBalloon {
    balloon.frame = CGRectMake(
                               0 + balloon.bounds.size.width,
                               self.view.bounds.size.height * 0.8 - balloon.bounds.size.height,
                               balloon.bounds.size.width,
                               balloon.bounds.size.height);

    [UIView animateWithDuration:2 delay:7 options:UIViewAnimationOptionCurveLinear animations:^{
        int y = self.view.bounds.size.height * 0.5 - balloon.bounds.size.height - 100;
        if (y < 0) {
            y = balloon.bounds.size.height + 10;
        }
        balloon.frame = CGRectMake(
                                   self.view.bounds.size.width * 0.9,
                                   y,
                                   balloon.bounds.size.width,
                                   balloon.bounds.size.height);
    } completion:^(BOOL finished){}];

#if DEBUG_VIEW
    [balloon setBackgroundColor:[UIColor redColor]];
#endif
    [self.view addSubview:balloon];
}

- (void)layoutCurve {
    [curve removeFromSuperview];
    curve = [[CurveView alloc]
                        initWithFrame:CGRectMake(
                                                 self.view.bounds.size.width * 0.1,
                                                 self.view.bounds.size.height * 0.1,
                                                 self.view.bounds.size.width * 0.8,
                                                 self.view.bounds.size.height * 0.8)
                        ];
    [curve setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];

#if DEBUG_VIEW
    [curve setBackgroundColor:[UIColor yellowColor]];
#endif
    [self.view addSubview:curve];
}

- (void)layoutBackgroundImage {
    [daylightBG removeFromSuperview];

    daylightBG.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:daylightBG];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    balloon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"balloon"]];
    daylightBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daylight-background"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
