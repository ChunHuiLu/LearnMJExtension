//
//  NSObject+keyValue2object.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "NSObject+keyValue2object.h"
#import "NSObject+Property.h"
#import "MJProperty.h"
#import "MJPropertyType.h"

@implementation NSObject (keyValue2object)
+ (instancetype)objectWithKeyValues:(id)keyValues {
    if (!keyValues) {return nil;}
    return  [[self alloc] setKeyValues:keyValues];
}

- (instancetype)setKeyValues:(id)keyValues {
    // 1.取出属性列表
    NSArray *propertiesArray = [self.class properties];
    for (MJProperty * property in propertiesArray) {
        MJPropertyType *type = property.type;
        Class typeClass = type.typeClass;
//        if (type.isBoolType) {
//            NSLog(@"Bool");
//        } else if(type.isIdType) {
//            NSLog(@"ID");
//        } else if (type.isNumberType) {
//            NSLog(@"Number");
//        } else {
//            NSLog(@"%@",typeClass);
//        }
        // 2. 用该属性名作为键去字典中寻找对应的值
        id value = [keyValues valueForKey:property.name];
        if (!value) {continue;}
        // 3.拿到值后将值的类型转换为属性对应的数据类型.
        if (type.isNumberType) {
            NSString *oldValue = value;
            // 字符串转数字
            if ([value isKindOfClass:[NSString class]]) {
                value = [[[NSNumberFormatter alloc] init] numberFromString:value];
                if (type.isBoolType) {
                    NSString *lower = oldValue.lowercaseString;
                    if ([lower isEqualToString:@"yer"] || [lower isEqualToString:@"true"]) {
                        value = @YES;
                    } else if ([lower isEqualToString:@"no"] || [lower isEqualToString:@"false"]) {
                        value = @NO;
                    }
                }
            }
        } else {
            if (type.typeClass == [NSString class]) { // 属性类型是NSString
                if ([value isKindOfClass:[NSNumber class]]) { // 值是NSNumber
                    // NSNumber -> NSString
                    value = [value description];
                } else if ([value isKindOfClass:[NSURL class]]) { // 值是URL
                    // URL - NSString
                    value = [value absoluteString];
                }
            }
        }
        // 4.最后进行赋值
        [self setValue:value forKey:property.name];
    }
    return self;
}
@end
