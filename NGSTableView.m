//
//  NGSTableView.m
//  NewGSLib
//
//  Created by Wilson on 2017/6/4.
//  Copyright © 2017年 NewGSLib. All rights reserved.
//

#import "NGSTableView.h"

@implementation NGSTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        switch (gestureRecognizer.state) {
                
            case UIGestureRecognizerStateBegan: {
                UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
                CGPoint velocity = [pan velocityInView:self];
                CGFloat Vx = fabs(velocity.x);
                CGFloat Vy = fabs(velocity.y);
                
                BOOL canRecognize = (Vy > Vx);
                // 该手势能否与其它手势一起被识别,YES:外层tableView滑动
                return canRecognize;
            }
                break;

            case UIGestureRecognizerStateChanged:
                return NO;
                break;
                
            default:
                break;
        }
    }
    
    return YES;
}

@end
