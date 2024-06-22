//
//  main.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "NSObject+Property.h"

#pragma mark -- 函数声明
void extcute(void (*fun)(void));
void keyValue2object(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        extcute(keyValue2object);
    }
    return 0;
}

void extcute(void (*fun)(void)) {
    fun();
    return;
}

#pragma mark -- 字典转模型
void keyValue2object(void) {
    NSDictionary *dict = @{
        @"name":@"Jack",
        @"icon":@"lufy.png",
        @"age":@"20",
        @"height":@1.55,
        @"money":@"100.9",
        @"sex":@(SexFemale),
        @"gay":@"1"
    };
    NSArray *propertyArray = [User properties];
}
