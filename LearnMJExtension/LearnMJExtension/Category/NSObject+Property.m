//
//  NSObject+Property.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

+ (NSArray * )properties {
    
    // 1.获得所有的属性
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:outCount];
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
//        NSLog(@"name:%s -- attributes:%s",property_getName(property),property_getAttributes(property));
        // 取出属性名字和类型编码,并把它们转成OC类型的字符串
        NSString *name = @(property_getName(property));
        NSString *attributes = @(property_getAttributes(property));
        // 截取属性的类型
        NSUInteger loc = 1;
        NSUInteger len = [attributes rangeOfString:@","].location - loc;
        NSString *type = [attributes substringWithRange:NSMakeRange(loc, len)];
        NSLog(@"%@",type);
    }
    
    return propertiesArray;
}

@end
