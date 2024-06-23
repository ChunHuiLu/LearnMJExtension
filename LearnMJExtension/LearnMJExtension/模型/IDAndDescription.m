//
//  IDAndDescription.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/23.
//

#import "IDAndDescription.h"



@implementation IDAndDescription
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
        @"ID":@"id",
        @"Description":@"description"
    };
}
@end
