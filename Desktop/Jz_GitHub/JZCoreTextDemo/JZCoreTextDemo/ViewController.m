//
//  ViewController.m
//  JZCoreTextDemo
//
//  Created by jiong23 on 2017/4/21.
//  Copyright © 2017年 Chenjz. All rights reserved.
//

#import "ViewController.h"
#import "JZTextLabel.h"
#import "JZTextLabel2.h"
#import "JZCoreTextView.h"
#import "JZCoreTextLabel.h"
#import "JZCoreTextColumnarView.h"
#import "JZCTLineBreakingView.h"
#import "JZParagraphStyleView.h"
#import "JZNonrectangularRegionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self paragraphStyleView];
    
}

- (void)nonrectangularRegionView {
    
    JZNonrectangularRegionView *view = [[JZNonrectangularRegionView alloc] initWithFrame:CGRectMake(10, 50, [UIScreen mainScreen].bounds.size.width - 20, 300)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
}

- (void)paragraphStyleView {
    JZParagraphStyleView *view = [[JZParagraphStyleView alloc] initWithFrame:CGRectMake(10, 50, [UIScreen mainScreen].bounds.size.width - 20, 300)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

- (void)lineBreakingView {
    JZCTLineBreakingView *view = [[JZCTLineBreakingView alloc] initWithFrame:CGRectMake(0, 50, 400, 300)];
    view.backgroundColor = [UIColor yellowColor];
    view.attrSring = @"虎扑篮球5月3日讯 在今天的比赛中，凯尔特人129-119战胜奇才，系列赛2-0领先。凯尔特人球星以赛亚-托马斯本场比赛出场45分钟，33投18中，三分12投5中罚球12罚12中。砍下53分4篮板4助攻。这也是他的季后赛生涯单场得分新高。他之前的纪录是在北京时间去年4月23日对阵老鹰时拿下的42分。同时他也超越了雷霆球星拉塞尔-威斯布鲁克创下的今年季后赛最高得分纪录51分。他也成为凯尔特人队史季后赛单场得分第二高，第一名是约翰-哈夫里切克的54分。53分也是NBA季后赛单场得分榜的第12名。小托马斯今年季后赛场均上场36.5分钟，得到28.0分3.8篮板5.9助攻。附上小托马斯本场比赛的投篮热图";
    [self.view addSubview:view];
}

- (void)columarView {
    
    JZCoreTextColumnarView *view = [[JZCoreTextColumnarView alloc] initWithFrame:CGRectMake(0, 50, 500, 300)];
    view.backgroundColor = [UIColor yellowColor];
    view.attrSring = @"虎扑篮球5月3日讯 在今天的比赛中，凯尔特人129-119战胜奇才，系列赛2-0领先。凯尔特人球星以赛亚-托马斯本场比赛出场45分钟，33投18中，三分12投5中罚球12罚12中。砍下53分4篮板4助攻。这也是他的季后赛生涯单场得分新高。他之前的纪录是在北京时间去年4月23日对阵老鹰时拿下的42分。同时他也超越了雷霆球星拉塞尔-威斯布鲁克创下的今年季后赛最高得分纪录51分。他也成为凯尔特人队史季后赛单场得分第二高，第一名是约翰-哈夫里切克的54分。53分也是NBA季后赛单场得分榜的第12名。小托马斯今年季后赛场均上场36.5分钟，得到28.0分3.8篮板5.9助攻。附上小托马斯本场比赛的投篮热图";
    [self.view addSubview:view];
}

- (void)coretextLabel {
    
    JZCoreTextLabel *view = [[JZCoreTextLabel alloc] initWithFrame:CGRectMake(0, 50, 500, 300)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

- (void)coretextView {
    
    JZCoreTextView *view = [[JZCoreTextView alloc] initWithFrame:CGRectMake(0, 50, 200, 300)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

- (void)coreTextLayout {
    
    JZTextLabel2 *textLabel = [[JZTextLabel2 alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    textLabel.backgroundColor = [UIColor yellowColor];
    textLabel.userInteractionEnabled = YES;
    textLabel.text = @"abcdefefeflefjlejfelfjelfj1121240000000gegegegegldladkflasdkjfladadk;fasdkf;ld;flkasd=======kkkk<Image:width=30,height=60> {Image:width=30,height=60}";
    textLabel.numberOfLines = 0;
    [self.view addSubview:textLabel];
}

- (void)normalLayout {
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 320)];
    textLabel.backgroundColor = [UIColor yellowColor];
    textLabel.userInteractionEnabled = YES;
    textLabel.text = @"abcdefefeflefjlejfelfjelfj1121240000000gegegegegldladkflasdkjfladadk;fasdkf;ld;flkasd=======kkkk<Image:width=30,height=60> {Image:width=30,height=60}";
    textLabel.numberOfLines = 0;
    [self.view addSubview:textLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
