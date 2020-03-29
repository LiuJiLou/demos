//
//  ViewController.m
//  LGViewRenderExplore
//
//  Created by vampire on 2020/3/10.
//  Copyright © 2020 LGEDU. All rights reserved.
//

#import "ViewController.h"
#import "LGView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet LGView *lgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //隐士动画的提交 ，标记了当前图层的改变，提交到一个全局的容器当中(修改了属性的图层)
    //[CATransaction commit]
    //before waiting
    _lgView.backgroundColor = [UIColor redColor];
    

    [self registeObserver];
    
    NSLog(@"123");
}

#pragma mark -- Observer

static void __runloop_callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
{
    NSString *str;
    switch (activity) {
        case kCFRunLoopEntry:
            str = @"Min Entry";
            break;
        case kCFRunLoopBeforeTimers:
             str = @"Min Before Timersr";
             break;
        case kCFRunLoopBeforeSources:
             str = @"Min Before Sources";
             break;
        case kCFRunLoopBeforeWaiting:
             str = @"Min Before Waiting";
             break;
        case kCFRunLoopAfterWaiting:
             str = @"Min After Waiting";
             break;
        case kCFRunLoopExit:
             str = @"Min Exit";
            break;
        case kCFRunLoopAllActivities:
             str = @"Min AllActivities";
             break;
        default:
            break;
    }
    NSLog(@"current activity:%@",str);
}

static void __runloop_before_waiting_callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
{
    NSString *str;
    switch (activity) {
        case kCFRunLoopEntry:
            str = @"Max Entry";
            break;
        case kCFRunLoopBeforeTimers:
             str = @"Max Before Timersr";
             break;
        case kCFRunLoopBeforeSources:
             str = @"Max Before Sources";
             break;
        case kCFRunLoopBeforeWaiting:
             str = @"Max Before Waiting";
             break;
        case kCFRunLoopAfterWaiting:
             str = @"Max After Waiting";
             break;
        case kCFRunLoopExit:
             str = @"Max Exit";
            break;
        case kCFRunLoopAllActivities:
             str = @"Max AllActivities";
             break;
        default:
            break;
    }
    NSLog(@"current activity:%@",str);
}

- (void)registeObserver{
    CFRunLoopObserverContext ctx = { 0, (__bridge void *)self, NULL, NULL };
           CFRunLoopObserverRef allActivitiesObserver = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, NSIntegerMin, &__runloop_callback, &ctx);
           CFRunLoopAddObserver(CFRunLoopGetCurrent(), allActivitiesObserver, kCFRunLoopCommonModes);
           
           CFRunLoopObserverRef beforeWaitingObserver = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, NSIntegerMax, &__runloop_before_waiting_callback, &ctx);
           CFRunLoopAddObserver(CFRunLoopGetCurrent(), beforeWaitingObserver, kCFRunLoopCommonModes);
}

@end
