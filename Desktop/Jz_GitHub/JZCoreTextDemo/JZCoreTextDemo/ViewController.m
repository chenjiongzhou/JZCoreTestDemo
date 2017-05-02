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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self coreTextLayout];
    
//    [self normalLayout];
}

- (void)coreTextLayout {
    
    JZTextLabel2 *textLabel = [[JZTextLabel2 alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 400)];
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
