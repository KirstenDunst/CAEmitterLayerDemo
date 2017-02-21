//
//  FireVC.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/15.
//  Copyright © 2016年 student. All rights reserved.
//

#import "FireVC.h"

#define kMainW [UIScreen mainScreen].bounds.size.width
#define kMainH [UIScreen mainScreen].bounds.size.height

@interface FireVC ()
@property (strong) CAEmitterLayer *fireEmitter;
@property (strong) CAEmitterLayer *smokeEmitter;

@end

@implementation FireVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fireAndSmoke];
}

#pragma mark 火
- (void)fireAndSmoke {
    
    self.view.backgroundColor = [UIColor blackColor];
    //火
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    [fire setName:@"fire"];
    
    //出生速度
    fire.birthRate          = 100;
    //存活时间
    fire.lifetime           = 50;
    fire.lifetimeRange      = 50 * 0.35;
    
    
    //xy平面上的发射角度
    fire.emissionLongitude  = M_PI;
    //发射角度偏移量
    fire.emissionRange      = 1.1;
    
    //发射初速度
    fire.velocity           = -80;
    
    //发射加速度
    fire.yAcceleration      = -200;
    fire.scaleSpeed         = 0.3;
    
    //颜色以及内容
    fire.color              = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fire.contents           = (id)[[UIImage imageNamed:@"DazFire"] CGImage];
    
    
    
    //烟
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    smoke.name = @"smoke";
    //出生速度
    smoke.birthRate         = 11;
    //xy平面上的发射角度
    smoke.emissionLongitude = - M_PI_2;
    smoke.emissionRange     = M_PI_4;
    
    //存活时间
    smoke.lifetime          = 10;
    //初速度
    smoke.velocity          = -40;
    smoke.velocityRange     = 20;
    
    //旋转速度以及偏移量
    smoke.spin              = 1;
    smoke.spinRange         = 6;
    
    smoke.yAcceleration     = -160;
    smoke.contents          = (id)[[UIImage imageNamed:@"DazSmoke"] CGImage];
    smoke.scale             = 0.1;
    smoke.alphaSpeed        = -0.12;
    smoke.scaleSpeed        = 0.7;
    
    
    self.fireEmitter    = [CAEmitterLayer layer];
    self.smokeEmitter   = [CAEmitterLayer layer];
    
    self.fireEmitter.emitterPosition = CGPointMake(kMainW/2, kMainH - 60);
    self.fireEmitter.emitterSize     = CGSizeMake(kMainW/2, 0);
    self.fireEmitter.emitterMode     = kCAEmitterLayerOutline;
    self.fireEmitter.emitterShape    = kCAEmitterLayerLine;
    self.fireEmitter.renderMode      = kCAEmitterLayerAdditive;
    
    
    self.smokeEmitter.emitterPosition = CGPointMake(kMainW/2, kMainH - 60);
    self.smokeEmitter.emitterMode     = kCAEmitterLayerPoints;
    
    
    self.smokeEmitter.emitterCells  = @[smoke];
    self.fireEmitter.emitterCells   = @[fire];
    [self.view.layer addSublayer:self.smokeEmitter];
    [self.view.layer addSublayer:self.fireEmitter];
    
    [self setFireAmount:0.9];
    
}


- (void)setFireAmount:(float)zeorToOne {
    
    [self.fireEmitter setValue:[NSNumber numberWithInt:zeorToOne * 500]
                    forKeyPath:@"emitterCells.fire.birthRate"];
    
    [self.fireEmitter setValue:[NSNumber numberWithFloat:zeorToOne]
                    forKeyPath:@"emitterCells.fire.lifetime"];
    
    [self.fireEmitter setValue:[NSNumber numberWithFloat:zeorToOne * 0.35]
                    forKeyPath:@"emitterCells.fire.lifetimeRange"];
    
    self.fireEmitter.emitterSize = CGSizeMake(50 * zeorToOne, 0);
    
    [self.smokeEmitter setValue:[NSNumber numberWithInt:zeorToOne * 4]
                     forKeyPath:@"emitterCells.smoke.lifetime"];
    
    [self.smokeEmitter setValue:(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:zeorToOne * 0.3] CGColor]
                     forKeyPath:@"emitterCells.smoke.color"];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self controlFireHeight:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self controlFireHeight:event];
}

- (void)controlFireHeight:(UIEvent *)event {
    
    UITouch *touches = [event.allTouches anyObject];
    
    CGPoint touch = [touches locationInView:self.view];
    
    float distanceToBottom = kMainH - touch.y;
    
    float percentage = distanceToBottom / kMainH;
    
    percentage = MAX(MIN(percentage, 1.0), 0.1);
    
    [self setFireAmount:2 * percentage];
}


@end
