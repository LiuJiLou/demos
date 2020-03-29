//
//  ViewController.m
//  LGMainThreadBlock
//
//  Created by vampire on 2019/12/30.
//  Copyright © 2019 LGEDU. All rights reserved.
//

#import "ViewController.h"
#import "LGBlockMonitor.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[LGBlockMonitor sharedInstance] start];
}


- (IBAction)buttonAction:(id)sender {
//    NSLog(@"5秒钟的卡顿");
//    [NSThread sleepForTimeInterval:3.0];
        for(int i = 0 ; i < 100000; i++){
            UIView *v = [[UIView alloc] init];
            v.frame = CGRectMake(0, 100, 100, 100);
            v.backgroundColor = [UIColor redColor];
            [self.view addSubview:v];
        }
}


@end
