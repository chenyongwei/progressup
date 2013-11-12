//
//  CurveView.m
//  ProgressUp
//
//  Created by Yongwei on 12/11/13.
//  Copyright (c) 2013 Yongwei. All rights reserved.
//

#import "CurveView.h"

@implementation CurveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    
    CGPoint point1 = CGPointMake(0, self.bounds.size.height);
    CGPoint point2 = CGPointMake(self.bounds.size.width, self.bounds.size.height / 2);

    CGPoint controlPoint1 = CGPointMake(self.bounds.size.width / 3, self.bounds.size.height / 10 * 9);
    CGPoint controlPoint2 = CGPointMake(self.bounds.size.width / 3 * 2, self.bounds.size.height / 5 * 4);

    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 setLineWidth:3.0];
    [path1 moveToPoint:point1];
    [path1 addCurveToPoint:point2 controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [[UIColor grayColor] set];
    [path1 stroke];
}

@end
