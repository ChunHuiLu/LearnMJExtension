//
//  NSObject+Property.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>
#import "MJProperty.h"
#import "MJPropertyType.h"

@implementation NSObject (Property)

+ (NSArray * )properties {
    
    // 1.获得所有的属性
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:outCount];
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
//        NSLog(@"name:%s -- attributes:%s",property_getName(property),property_getAttributes(property));
        MJProperty *propertyObj = [MJProperty propertyWithProperty:property];
        NSLog(@"%@:%@",propertyObj.type.typeClass,propertyObj.name);
    }
    
    return propertiesArray;
}



@end
