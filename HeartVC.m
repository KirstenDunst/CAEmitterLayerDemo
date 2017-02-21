//
//  HeartVC.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/15.
//  Copyright © 2016年 student. All rights reserved.
//

#import "HeartVC.h"

#define kMainW [UIScreen mainScreen].bounds.size.width
#define kMainH [UIScreen mainScreen].bounds.size.height

@interface HeartVC ()
@property (nonatomic, strong) CAEmitterLayer *heartsLayer;
@end


@implementation HeartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hearting];
}


#pragma mark 心
- (void)hearting {
    
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    button.frame = CGRectMake(kMainW/2 - 50, kMainH - 380, 100, 80);
    //    button.backgroundColor = [UIColor redColor];
    //    [button addTarget:self action:@selector(heartButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    ////    [self.view addSubview:button];
    
    
    CAEmitterCell *heart = [CAEmitterCell emitterCell];
    heart.name = @"heart";
    //发射角度
    heart.emissionLongitude = M_PI/2.0;
    //发射角度偏移量
    heart.emissionRange = 2 * M_PI;
    
    //每秒创建个数
    heart.birthRate = 10;
    //离开时间
    heart.lifetime = 10.0;
    
    //初速度，矢量
    heart.velocity = 100;
    //速度偏移量
    heart.velocityRange = 60;
    
    //y轴加速度,矢量
    heart.yAcceleration = 10;
    
    //内容，一般为CGImage
    heart.contents = (id)[[UIImage imageNamed:@"DazHeart"] CGImage];
    
    //颜色
    heart.color = [UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:0.5].CGColor;
    heart.redRange = 0.3;
    heart.blueRange = 0.3;
    heart.alphaSpeed = - 0.5 / heart.lifetime;
    
    //大小
    heart.scale = 0.15;
    
    //大小偏移量
    heart.scaleSpeed = 0.5;
    
    //旋转偏移量
    heart.spinRange = 2.0 *M_PI;
    
    
    self.heartsLayer = [CAEmitterLayer layer];
    self.heartsLayer.emitterPosition = self.view.center;
    self.heartsLayer.emitterSize = CGSizeMake(50, 50);
    
    //发射角度
    self.heartsLayer.emitterMode = kCAEmitterLayerPoints;
    
    //发射形状
    self.heartsLayer.emitterShape = kCAEmitterLayerCircle;
    
    //粒子混合效果 （混合）
    self.heartsLayer.renderMode = kCAEmitterLayerAdditive;
    
    
    self.heartsLayer.emitterCells = [NSArray arrayWithObject:heart];
    
    [self.view.layer addSublayer:self.heartsLayer];
}


- (void)heartButtonClick:(UIButton *)sender {
    
    CABasicAnimation *heartsBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.heart.birthRate"];
    heartsBurst.fromValue   = [NSNumber numberWithFloat:150.0];
    heartsBurst.toValue     = [NSNumber numberWithFloat:  0.0];
    heartsBurst.duration    = 5.0;
    heartsBurst.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.heartsLayer addAnimation:heartsBurst forKey:@"heartsBurst"];
    
    
    
}



@end
