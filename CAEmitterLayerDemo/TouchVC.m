//
//  TouchVC.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/15.
//  Copyright © 2016年 student. All rights reserved.
//

#import "TouchVC.h"


#define kMainW [UIScreen mainScreen].bounds.size.width
#define kMainH ([UIScreen mainScreen].bounds.size.height - 108)

@interface TouchVC ()

@property (strong) CAEmitterLayer *ringEmitter;

@end

@implementation TouchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self touchLayer];
}


- (void)touchLayer {
    
    self.ringEmitter = [CAEmitterLayer layer];
    
    
    self.ringEmitter.emitterPosition    = CGPointMake(kMainW/2, kMainH/2);
    self.ringEmitter.emitterSize        = CGSizeMake(50, 0);
    
    self.ringEmitter.emitterMode        = kCAEmitterLayerOutline;
    self.ringEmitter.emitterShape       = kCAEmitterLayerCircle;
    self.ringEmitter.renderMode         = kCAEmitterLayerBackToFront;
    
    
    CAEmitterCell *ring = [CAEmitterCell emitterCell];
    [ring setName:@"ring"];
    
    ring.birthRate      = 0;
    ring.velocity       = 250;
    ring.scale          = 0.5;
    ring.scaleSpeed     =- 0.2;
    ring.greenSpeed     =- 0.2;
    ring.redSpeed       =- 0.5;
    ring.blueSpeed      =- 0.5;
    ring.lifetime       =  2;
    
    ring.color          = [UIColor whiteColor].CGColor;
    ring.contents       = (id)[UIImage imageNamed:@"DazTriangle"].CGImage;
    
    
    
    CAEmitterCell *circle   =[CAEmitterCell emitterCell];
    [circle setName:@"circle"];
    
    circle.birthRate            = 10;
    circle.emissionLongitude    = M_PI * 0.5;
    circle.velocity             = 50;
    circle.scale                = 0.5;
    circle.scaleSpeed           =- 0.2;
    circle.greenSpeed           =- 0.1;
    circle.redSpeed             =- 0.2;
    circle.blueSpeed            =  0.1;
    circle.alphaSpeed           =- 0.2;
    circle.lifetime             =  4;
    circle.color                = [UIColor whiteColor].CGColor;
    circle.contents             = (id)[UIImage imageNamed:@"DazRing"].CGImage;
    
    
    CAEmitterCell *star         = [CAEmitterCell emitterCell];
    [star setName:@"star"];
    
    star.birthRate              = 10;
    star.velocity               = 100;
    star.zAcceleration          = -1;
    star.emissionLongitude      = -M_PI;
    star.scale                  = 0.5;
    star.scaleSpeed             =- 0.2;
    star.greenSpeed             =- 0.1;
    star.redSpeed               = 0.4;
    star.blueSpeed              =- 0.1;
    star.alphaSpeed             =- 0.2;
    star.lifetime               = 2;
    
    star.color = [[UIColor whiteColor] CGColor];
    star.contents = (id) [[UIImage imageNamed:@"DazStarOutline"] CGImage];
    
    self.ringEmitter.emitterCells = @[ring];
    ring.emitterCells   = @[circle,star];
    [self.view.layer addSublayer:self.ringEmitter];
    
    
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    [self touchAtPosition:touchPoint];
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    [self touchAtPosition:touchPoint];
}


- (void) touchAtPosition:(CGPoint)position
{
    
    
    CABasicAnimation *burst = [CABasicAnimation animationWithKeyPath:@"emitterCells.ring.birthRate"];
    burst.fromValue			= [NSNumber numberWithFloat: 125.0];
    burst.toValue			= [NSNumber numberWithFloat: 0.0];
    burst.duration			= 0.5;
    burst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.ringEmitter addAnimation:burst forKey:@"burst"];
    

    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    self.ringEmitter.emitterPosition	= position;
    [CATransaction commit];
}







@end
