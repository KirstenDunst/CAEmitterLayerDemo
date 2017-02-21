//
//  FireworksVC.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/15.
//  Copyright © 2016年 student. All rights reserved.
//

#import "FireworksVC.h"

#define kMainW [UIScreen mainScreen].bounds.size.width
#define kMainH [UIScreen mainScreen].bounds.size.height


@implementation FireworksVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fireworks];
    
}
#pragma mark 烟花
- (void)fireworks {
    self.view.backgroundColor = [UIColor blackColor];
    
    
    //发射小球
    CAEmitterCell *rocket   = [CAEmitterCell emitterCell];
    rocket.birthRate        = 5.0;
    rocket.emissionRange    = 0.25 * M_PI_2;
    rocket.velocity         = 380;
    rocket.velocityRange    = 100;
    rocket.yAcceleration    = 75;
    rocket.lifetime         = 1.45;
    
    rocket.contents         = (id)[[UIImage imageNamed:@"DazRing"] CGImage];
    rocket.scale            = 0.2;
    rocket.color            = [UIColor redColor].CGColor;
    rocket.greenRange       = 1.0;
    rocket.redRange         = 1.0;
    rocket.blueRange        = 1.0;
    
    //旋转速度偏移量
    rocket.spinRange        = M_PI;
    
    //爆炸效果
    CAEmitterCell *burst    = [CAEmitterCell emitterCell];
    burst.birthRate         = 1/1.4;
    burst.velocity          = 0;
    burst.scale             = 2.5;
    burst.redSpeed          =- 1.5;
    burst.blueSpeed         =+ 1.5;
    burst.greenSpeed        =+ 1.0;
    burst.lifetime          = 0.35;
    
    
    //烟花
    CAEmitterCell *spark    = [CAEmitterCell emitterCell];
    spark.birthRate         = 400;
    spark.velocity          = 125;
    spark.emissionRange     = 2 * M_PI;
    spark.yAcceleration     = 75;
    spark.lifetime          = 3;
    
    spark.contents          = (id)[[UIImage imageNamed:@"DazStarOutline"] CGImage];
    spark.scaleSpeed        =- 0.2;
    spark.greenSpeed        =- 0.1;
    spark.redSpeed          =  0.4;
    spark.blueSpeed         =- 0.1;
    spark.alphaSpeed        =- 0.25;
    spark.spin              = 2 * M_PI;
    spark.spinRange         = 2 * M_PI;
    
    CAEmitterLayer *fireworksEmitter    = [CAEmitterLayer layer];
    fireworksEmitter.emitterPosition    = CGPointMake(kMainW/2, kMainH);
    fireworksEmitter.emitterSize        = CGSizeMake(kMainW/2, 0.0);
    
    fireworksEmitter.emitterShape       = kCAEmitterLayerLine;
    fireworksEmitter.emitterMode        = kCAEmitterLayerOutline;
    fireworksEmitter.renderMode         = kCAEmitterLayerAdditive;
    
    fireworksEmitter.seed               = arc4random()%100 + 1;
    
    fireworksEmitter.emitterCells   = @[rocket];
    
    rocket.emitterCells             = @[burst];
    
    burst.emitterCells              = @[spark];
    
    [self.view.layer addSublayer:fireworksEmitter];
    
    
    
}




@end
