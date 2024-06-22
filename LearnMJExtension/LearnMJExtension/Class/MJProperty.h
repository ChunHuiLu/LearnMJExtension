//
//  MJProperty.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN
@class  MJPropertyType;

@interface MJProperty : NSObject

/** 成员属性的名字 */
@property (nonatomic, readonly) NSString *name;
/** 成员属性的类型 */
@property (nonatomic, readonly) MJPropertyType *type;

+ (instancetype)propertyWithProperty:(objc_property_t)property;
@end

NS_ASSUME_NONNULL_END
