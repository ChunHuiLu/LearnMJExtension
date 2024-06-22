//
//  MJPropertyType.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 包装一种类型
@interface MJPropertyType : NSObject
/** 是否为id类型 */
@property (nonatomic, readonly, getter=isIdType) BOOL idType;
/** 是否为基本数字类型，int、float等 */
@property (nonatomic, readonly, getter=isNumberType) BOOL numberType;
/** 是否为BOOL类型 */
@property (nonatomic, readonly, getter=isBoolType) BOOL boolType;
/** 对象类型，如果是基本数据类型，此值为nil */
@property (nonatomic, readonly) Class typeClass;

+ (instancetype)propertyTypeWithAttributeString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
