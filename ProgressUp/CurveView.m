//
//  CurveView.m
//  ProgressUp
//
//  Created by Yongwei on 12/11/13.
//  Copyright (c) 2013 Yongwei. All rights reserved.
//

#import "CurveView.h"
#import "ATGraphPoint.h"
#import "ATSmoothCurveAlgorithm.h"

@implementation CurveView

const int lessonCount = 6;
NSMutableArray *checkmarkViews;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    NSMutableArray *knots= [self generateLessonPoints];
    [self setupCurve:knots];
    [self setupCheckmark:knots];
}

- (NSMutableArray *)generateLessonPoints {
    NSMutableArray *knots = [[NSMutableArray alloc] init];

    int WIDTH = self.bounds.size.width;
    int HEIGHT = self.bounds.size.height;


    for (int i = 0; i < lessonCount; i++) {
        int height;
        if (i == 0) {
            height = HEIGHT;
        }
        else {
            height = HEIGHT / (lessonCount - i + 1) * (lessonCount - i);
        }
        CGPoint point = CGPointMake(WIDTH/lessonCount * i, height);

        [knots addObject:[ATGraphPoint graphPointWithCGPoint:point]];
    }
    return knots;
}

- (void)setupCurve:(NSMutableArray *)knots {
    NSMutableArray *firstControlPoints = [[NSMutableArray alloc] init];
    NSMutableArray *secondControlPoints= [[NSMutableArray alloc] init];

    [ATSmoothCurveAlgorithm getFromKnots:knots FirstControlPoints:firstControlPoints andSecondControlPoints:secondControlPoints];


    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineWidth:1.0];

    ATGraphPoint *p1 = [knots objectAtIndex:0];
    [path moveToPoint:[p1 CGPointValue]];

    for (int i=1; i<[knots count];i++) {

        ATGraphPoint *kPointValue = [knots objectAtIndex:i];

        ATGraphPoint *cPoint1Value = [firstControlPoints objectAtIndex:i-1];
        ATGraphPoint *cPoint2Value = [secondControlPoints objectAtIndex:i-1];


        UIBezierPath *ballBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake([kPointValue CGPointValue].x - 5, [kPointValue CGPointValue].y - 5, 10, 10) cornerRadius:50];
        [[UIColor whiteColor] setStroke];
        [[UIColor greenColor] setFill];
        [ballBezierPath stroke];
        [ballBezierPath fill];


        [path addCurveToPoint:[kPointValue CGPointValue] controlPoint1:[cPoint1Value CGPointValue] controlPoint2:[cPoint2Value CGPointValue]];
    }
    [[UIColor grayColor] set];

    [path stroke];
}

- (void)setupCheckmark:(NSMutableArray *)knots {
    checkmarkViews = [[NSMutableArray alloc] init];
    for (int i = 0; i < lessonCount; i++) {
        UIImageView *checkmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkmark-pass"]];
        [checkmarkViews addObject:checkmark];
    }

    for (int i = 0; i < lessonCount; i++) {
        UIImageView *checkmark = [checkmarkViews objectAtIndex:i];
        [checkmark removeFromSuperview];
        ATGraphPoint *kPointValue = [knots objectAtIndex:i];
        checkmark.alpha = 0;
        checkmark.frame = CGRectMake([kPointValue CGPointValue].x - 15, [kPointValue CGPointValue].y - 15, 30, 30);
        [self addSubview:checkmark];

        [UIView animateWithDuration:1.0f delay:i+1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            checkmark.alpha = 1.0f;
        } completion:^(BOOL finished) {
        }];
    }
}


- (id)initWithFrame:(CGRect)frame andLessonCount:(int)lessonCount
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
