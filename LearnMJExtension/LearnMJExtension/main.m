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
#import "Status.h"
#import "StatusResult.h"
#import "Ad.h"
#import "IDAndDescription.h"

#pragma mark -- 函数声明
void extcute(void (*fun)(void));
void keyValue2object(void);
void keyValues2object1(void);
void keyValues2object2(void);
void keyValues2object3(void);
void keyValues2object4(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        extcute(keyValue2object);
        extcute(keyValues2object1);
        extcute(keyValues2object2);
        extcute(keyValues2object3);
        extcute(keyValues2object4);
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
//    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);
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
//    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);
}
/*
 * 复杂的字典转模型
 */
void keyValues2object2(void) {
    NSDictionary *dict = @{
                               @"text" : @"是啊，今天天气确实不错！",

                               @"user" : @{
                                       @"name" : @"Jack",
                                       @"icon" : @"lufy.png"
                                       },

                               @"retweetedStatus" : @{
                                       @"text" : @"今天天气真不错！",

                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       }
                               };
    Status * status = [Status objectWithKeyValues:dict];
//    NSLog(@"%@",status.description);
    
}

void keyValues2object3(void) {
    NSDictionary *dict = @{
                               @"statuses" : @[
                                       @{
                                           @"text" : @"今天天气真不错！",

                                           @"user" : @{
                                                   @"name" : @"Rose",
                                                   @"icon" : @"nami.png"
                                                   }
                                           },

                                       @{
                                           @"text" : @"明天去旅游了",

                                           @"user" : @{
                                                   @"name" : @"Jack",
                                                   @"icon" : @"lufy.png"
                                                   }
                                           }

                                       ],

                               @"ads" : @[
                                       @{
                                           @"image" : @"ad01.png",
                                           @"url" : @"http://www.小码哥ad01.com"
                                           },
                                       @{
                                           @"image" : @"ad02.png",
                                           @"url" : @"http://www.小码哥ad02.com"
                                           }
                                       ],

                               @"totalNumber" : @"2014",
                               @"previousCursor" : @"13476589",
                               @"nextCursor" : @"13476599"
                               };
    StatusResult * result = [StatusResult objectWithKeyValues:dict];
    // 3.打印StatusResult模型的简单属性
//    NSLog(@"totalNumber=%@, previousCursor=%lld, nextCursor=%lld", result.totalNumber, result.previousCursor, result.nextCursor);
    // 4.打印statuses数组中的模型属性
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
//        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    }
    
    // 5.打印ads数组中的模型属性
    for (Ad *ad in result.ads) {
//        NSLog(@"image=%@, url=%@", ad.image, ad.url);
    }
    
}

void keyValues2object4(void){
    
    NSDictionary *dict = @{
                           @"id" : @"Jack",
                           @"description" : @"lufy.png",
                           };

    IDAndDescription *result = [IDAndDescription objectWithKeyValues:dict];
    
//    NSLog(@"%@,%@",result.ID,result.Description);
    
}
