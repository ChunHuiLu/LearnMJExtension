//
//  MJProperty.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "MJProperty.h"
#import "MJPropertyType.h"

@implementation MJProperty
+ (instancetype)propertyWithProperty:(objc_property_t)property {
    return [[MJProperty alloc] initWithProperty:property];
}

- (instancetype)initWithProperty:(objc_property_t)property {
    if (self = [super init]) {
        _name = @(property_getName(property));
        _type = [MJPropertyType propertyTypeWithAttributeString:@(property_getAttributes(property))];
    }
    return self;
}

@end
