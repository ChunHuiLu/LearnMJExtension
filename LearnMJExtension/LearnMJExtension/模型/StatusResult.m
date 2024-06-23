//
//  StatusResult.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/23.
//

#import "StatusResult.h"

@implementation StatusResult
+ (NSDictionary *)objectClassInArray {
    return @{
        @"statuses":@"Status",
        @"ads":@"Ad"
    };
}

@end
