//
//  LGBlockMonitor.h
//  LGMainThreadBlock
//
//  Created by vampire on 2019/12/30.
//  Copyright © 2019 LGEDU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface LGBlockMonitor : NSObject

+ (instancetype)sharedInstance;

- (void)start;

@end

NS_ASSUME_NONNULL_END
