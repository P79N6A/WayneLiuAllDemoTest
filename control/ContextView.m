//
//  ContextView.m
//  control
//
//  Created by didi on 16/10/14.
//  Copyright © 2016年 didi. All rights reserved.
//

#import "ContextView.h"

@implementation ContextView


- (UIImage *)createViewImage{
    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    shareView.backgroundColor = [UIColor colorWithHexString:@"#000000"];
    shareView.alpha = 0.04;
    shareView.layer.cornerRadius = 50;
    UIGraphicsBeginImageContextWithOptions(shareView.bounds.size, NO, [UIScreen mainScreen].scale);
    [shareView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (CAShapeLayer *)drawCircle :(UIButton *)button{
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    // 指定frame，只是为了设置宽度和高度
    circleLayer.frame = CGRectMake(0, 0, 100, 100);
    // 设置居中显示
    circleLayer.position = button.center;
    // 设置填充颜色
    circleLayer.fillColor = [UIColor groupTableViewBackgroundColor].CGColor;
    // 设置线宽
//    circleLayer.lineWidth = 2.0;
    // 设置线的颜色
    circleLayer.strokeColor = [UIColor redColor].CGColor;

    // 使用UIBezierPath创建路径
    CGRect frame = CGRectMake(0, 0, 100, 100);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];

    // 设置CAShapeLayer与UIBezierPath关联
    circleLayer.path = circlePath.CGPath;

//    // 将CAShaperLayer放到某个层上显示
//    [self.view.layer addSublayer:circleLayer];

    return circleLayer;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = colorComponentFrom(colorString, 0, 1);
            green = colorComponentFrom(colorString, 1, 1);
            blue  = colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = colorComponentFrom(colorString, 0, 1);
            red   = colorComponentFrom(colorString, 1, 1);
            green = colorComponentFrom(colorString, 2, 1);
            blue  = colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = colorComponentFrom(colorString, 0, 2);
            green = colorComponentFrom(colorString, 2, 2);
            blue  = colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = colorComponentFrom(colorString, 0, 2);
            red   = colorComponentFrom(colorString, 2, 2);
            green = colorComponentFrom(colorString, 4, 2);
            blue  = colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end
