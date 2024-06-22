//
//  MJPropertyType.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "MJPropertyType.h"

@implementation MJPropertyType
+ (instancetype)propertyTypeWithAttributeString:(NSString *)string {
    return [[MJPropertyType alloc] initWithAttributeString:string];
}

-(instancetype)initWithAttributeString:(NSString *)attributes {
    if (self = [super init]) {
        // 截取属性的类型
        NSUInteger loc = 1;
        NSUInteger len = [attributes rangeOfString:@","].location - loc;
        NSString *type = [attributes substringWithRange:NSMakeRange(loc, len)];
        NSLog(@"%@",type);
    }
    return self;
}
@end
