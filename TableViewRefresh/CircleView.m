//
//  CircleView.m
//  TableViewRefresh
//
//  Created by Zilu.Ma on 2017/3/23.
//  Copyright © 2017年 oc. All rights reserved.
//

#import "CircleView.h"

#define BIG_RADIUS 25
#define SMALL_RADIUS 5
#define WIDTH 50
@implementation CircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = CGRectMake(0, 0, BIG_RADIUS * 2, BIG_RADIUS * 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:BIG_RADIUS];

        UIBezierPath *path1 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(BIG_RADIUS / 2.0, BIG_RADIUS / 2.0, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
        [path appendPath:path1];

        UIBezierPath *path2 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(WIDTH - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, BIG_RADIUS / 2.0, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
        [path appendPath:path2];

        UIBezierPath *path3 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(BIG_RADIUS / 2.0, WIDTH - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
        [path appendPath:path3];

        UIBezierPath *path4 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(WIDTH - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, WIDTH - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
        [path appendPath:path4];

        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.fillColor = [UIColor whiteColor].CGColor;
        [self.layer addSublayer:layer];
    }
    
    return self;
}

/*
 - (id)initWithFrame:(CGRect)frame{
     self = [super initWithFrame:frame];
     if (self) {
//         CGRect rect = CGRectMake(CGRectGetWidth(frame) / 2.0 - BIG_RADIUS, CGRectGetHeight(frame) / 2.0  - BIG_RADIUS, BIG_RADIUS * 2, BIG_RADIUS * 2);
//         NSLog(@"%@",NSStringFromCGRect(frame));
         CGRect rect = CGRectMake(0, 0, BIG_RADIUS * 2, BIG_RADIUS * 2);
         UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:BIG_RADIUS];

         UIBezierPath *path1 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(BIG_RADIUS / 2.0, BIG_RADIUS / 2.0, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
         [path appendPath:path1];

         UIBezierPath *path2 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(frame) - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, BIG_RADIUS / 2.0, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
         [path appendPath:path2];

         UIBezierPath *path3 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(BIG_RADIUS / 2.0, CGRectGetHeight(frame) - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
         [path appendPath:path3];

         UIBezierPath *path4 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetWidth(frame) - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, CGRectGetHeight(frame) - BIG_RADIUS / 2.0 - SMALL_RADIUS * 2, 10, 10) cornerRadius:SMALL_RADIUS] bezierPathByReversingPath];
         [path appendPath:path4];


         CAShapeLayer *layer = [CAShapeLayer layer];
         layer.path = path.CGPath;
         layer.fillColor = [UIColor whiteColor].CGColor;
         layer.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
 //        layer.anchorPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
         [self.layer addSublayer:layer];
     }

     return self;
 }
 */

@end
