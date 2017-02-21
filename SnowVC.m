//
//  SnowVC.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/15.
//  Copyright © 2016年 student. All rights reserved.
//

#import "SnowVC.h"

#define kMainW [UIScreen mainScreen].bounds.size.width
#define kMainH [UIScreen mainScreen].bounds.size.height

@implementation SnowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self snowing];
}




#pragma mark 雪花下落
- (void)snowing {
    
    //粒子单元
    CAEmitterCell *snow = [CAEmitterCell emitterCell];
    
    //每秒钟创建粒子的个数
    snow.birthRate     = 2;
    
    //粒子的存活时间
    snow.lifetime      = 120.0;
    
    //    粒子存活时间的容差
    //    snow.lifetimeRange
    
    
    //粒子的运动速度和运动速度的平均值
    snow.velocity      = 10;
    //粒子速度的容差
    snow.velocityRange = 10;
    
    //粒子的加速度
    snow.yAcceleration = 2;
    
    //    粒子xy平面的发射角度
    //    snow.emissionLongitude =
    //发射角度的容差
    snow.emissionRange = 0.5 * M_PI;
    
    //    粒子缩放大小，缩放容差，缩放速度
    //    snow.scale;
    //    snow.scaleRange;
    //    snow.scaleSpeed
    
    //    粒子的旋转容差
    snow.spinRange     = 0.25 * M_PI;
    
    //    渲染粒子，可以设置图片
    snow.contents      = (id)[[UIImage imageNamed:@"DazFlake"] CGImage];
    
    //    粒子颜色
    snow.color         = [[UIColor colorWithRed:0.6 green:0.658 blue:0.743 alpha:1.0] CGColor];
    
    
    //    粒子在RGB三个色相的容差
    //    snow.redRange
    //    snow.greenRange
    //    snow.blueRange
    //    snow.alphaRange
    
    //    粒子在RGB三个色相的变化速度
    //    @property float redSpeed;
    //    @property float greenSpeed;
    //    @property float blueSpeed;
    //    @property float alphaSpeed;
    
    
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 1000, 2)];
    //    label.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:label];
    
    //粒子发射器
    CAEmitterLayer *snowLayer = [CAEmitterLayer layer];
    
    //粒子发射器在xy平面的中心位置
    snowLayer.emitterPosition = CGPointMake(self.view.bounds.size.width/2.0, -30);
    
    //粒子发射器的尺寸大小
    snowLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 2, 0.0);
    
    //发射器的发射模式
    snowLayer.emitterMode = kCAEmitterLayerOutline;
    //  kCAEmitterLayerPoints  从发射器中发出，
    //  kCAEmitterLayerOutline 从发射器边缘发出
    //  kCAEmitterLayerSurface 从发射器表面发出
    //  kCAEmitterLayerVolume  从发射器重点发出
    
    //发射器的发射形状
    snowLayer.emitterShape = kCAEmitterLayerLine;
    //kCAEmitterLayerPoint      点的形状，粒子从一个点发出
    //kCAEmitterLayerLine       线的形状，粒子从一条线发出
    //kCAEmitterLayerRectangle  矩形形状，粒子从一个矩形中发出
    //kCAEmitterLayerCuboid     立方体形状，会影响圆形范围发射
    //kCAEmitterLayerCircle     圆形，粒子会在圆形范围发射
    //kCAEmitterLayerSphere     球型
    
    
    //    父类CALayer的一些属性
    snowLayer.shadowOpacity  = 1.0;
    snowLayer.shadowRadius = 0.0;
    snowLayer.shadowOffset = CGSizeMake(0.0, 1.0);
    snowLayer.shadowColor = [UIColor whiteColor].CGColor;
    
    //    粒子的单元数组
    snowLayer.emitterCells = [NSArray arrayWithObject:snow];
    
    [self.view.layer insertSublayer:snowLayer atIndex:0];
}



@end
