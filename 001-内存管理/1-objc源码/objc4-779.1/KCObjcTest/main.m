//
//  main.m
//  KCObjcTest
//
//  Created by Cooci on 2020/3/5.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSObject *objc = [NSObject alloc]; // 0
        NSLog(@"%ld",objc.retainCount); // 1
        NSLog(@"%ld",objc.retainCount); // 2

    }
    return 0;
}
