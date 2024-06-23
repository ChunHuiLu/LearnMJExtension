//
//  NSObject+keyValue2object.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MJKeyValue <NSObject>

+ (NSDictionary *)objectClassInArray;

@end

@interface NSObject (keyValue2object)
+ (instancetype)objectWithKeyValues:(id)keyValues;
@end

NS_ASSUME_NONNULL_END
