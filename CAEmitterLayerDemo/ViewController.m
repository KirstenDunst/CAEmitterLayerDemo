//
//  ViewController.m
//  CAEmitterLayerDemo
//
//  Created by student on 16/3/14.
//  Copyright © 2016年 student. All rights reserved.
//

#import "ViewController.h"


#define kMainW [UIScreen mainScreen].bounds.size.width
#define kMainH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) CAEmitterLayer *heartsLayer;

@property (strong) CAEmitterLayer *fireEmitter;
@property (strong) CAEmitterLayer *smokeEmitter;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [self snowing];
    
//    [self hearting];
    
//    [self fireAndSmoke];
    
    [self fireworks];
    
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
    rocket.lifetime         = 1.55;
    
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
    burst.birthRate         = 1/1.5;
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
