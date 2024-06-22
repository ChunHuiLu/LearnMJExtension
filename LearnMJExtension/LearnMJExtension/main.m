//
//  main.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "NSObject+Property.h"
#import "NSObject+keyValue2object.h"

#pragma mark -- 函数声明
void extcute(void (*fun)(void));
void keyValue2object(void);
void keyValues2object1(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        extcute(keyValues2object1);
    }
    return 0;
}

void extcute(void (*fun)(void)) {
    fun();
    return;
}

#pragma mark -- 字典转模型

/// 字典转模型（最简单的情况）
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
    User *user = [User objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);
}
/**
 *  JSON字符串 -> 模型
 */
void keyValues2object1(void) {
    // 1.定义一个JSON字符串
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";

    // 2.将JSON字符串转为User模型
    User *user = [User objectWithKeyValues:jsonString];

    // 3.打印User模型的属性
    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);
}
