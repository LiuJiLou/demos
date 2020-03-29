//
//  UIImage+cornerRadious.m
//  LGInterfaceOptDemo
//
//  Created by vampire on 2019/12/25.
//  Copyright © 2019 LGEDU. All rights reserved.
//

#import "UIImage+cornerRadious.h"


@implementation UIImage (cornerRadious)

- (UIImage *)cornerRadius:(CGFloat)cornerRadius size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
