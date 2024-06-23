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
    // 判断如果是JSON字符串还是NSData类型解析后转成模型
    keyValues = [keyValues JSONObject];
    // 1.取出属性列表
    NSArray *propertiesArray = [self.class properties];
    for (MJProperty * property in propertiesArray) {
        MJPropertyType *type = property.type;
        Class typeClass = type.typeClass;
        // 2. 用该属性名作为键去字典中寻找对应的值
        id value = [keyValues valueForKey:property.name];
        if (!value) {continue;}
        // 3.拿到值后将值的类型转换为属性对应的数据类型.
        if (!type.isFromFoundation && typeClass) {
            value = [typeClass objectWithKeyValues:value];
        } else
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
            if (typeClass == [NSString class]) { // 属性类型是NSString
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

- (id)JSONObject {
    id foundationObj;
    if ([self isKindOfClass:[NSString class]]) {
        foundationObj = [NSJSONSerialization JSONObjectWithData:[(NSString *)self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    } else if ([self isKindOfClass:[NSData class]]) {
        foundationObj = [NSJSONSerialization JSONObjectWithData:(NSData *)self options:kNilOptions error:nil];
    }
    return foundationObj?:self;
}
@end
