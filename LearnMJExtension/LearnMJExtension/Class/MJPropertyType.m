//
//  MJPropertyType.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "MJPropertyType.h"
#import "MJExtensionConst.h"
#import "NSObject+Property.h"


@implementation MJPropertyType
+ (instancetype)propertyTypeWithAttributeString:(NSString *)string {
    return [[MJPropertyType alloc] initWithAttributeString:string];
}

-(instancetype)initWithAttributeString:(NSString *)attributes {
    if (self = [super init]) {
        // 截取属性的类型
        NSUInteger loc = 1;
        NSUInteger len = [attributes rangeOfString:@","].location - loc;
        NSString *typeCode = [attributes substringWithRange:NSMakeRange(loc, len)];
//        NSLog(@"%@",typeCode);
        // 处理typeCode，根据typeCode推断出属性类型
        [self getTypeCode:typeCode];
    }
    return self;
}

- (void)getTypeCode:(NSString *)code {
    if ([code isEqualToString:MJPropertyTypeId]) {
        _idType = YES;
    } else if (code.length > 3  && [code hasPrefix:@"@\""]) {
        // 去掉@" 和" 截取中间的类型名称
        _code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
        _typeClass = NSClassFromString(_code);
        _numberType = (_typeClass == [NSNumber class] || [_typeClass isSubclassOfClass:[NSNumber class]]);
        // 判断是否是模型类
        _fromFoundation = [NSObject isClassFromFoundation:_typeClass];
    }
    
    // 是否是数字类型
    NSString *lowerCode = code.lowercaseString;
    NSArray *numberTypes = @[MJPropertyTypeInt,MJPropertyTypeFloat,MJPropertyTypeShort,MJPropertyTypeBOOL1,MJPropertyTypeBOOL2,MJPropertyTypeDouble,MJPropertyTypeChar,MJPropertyTypeLong];
    if ([numberTypes containsObject:lowerCode]) {
        _numberType = YES;
        if ([lowerCode isEqualToString:MJPropertyTypeBOOL1] || [lowerCode isEqualToString:MJPropertyTypeBOOL2]) {
            _boolType = YES;
        }
    }
}

@end
