//
//  User.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    SexMale,
    SexFemale
} Sex;
@interface User : NSObject
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 头像 */
@property (nonatomic, copy) NSString *icon;
/** 年龄 */
@property (nonatomic, assign) unsigned int age;
/** 身高 */
@property (nonatomic, copy) NSString *height;
/** 财富 */
@property (nonatomic, strong) NSNumber *money;
/** 性别 */
@property (nonatomic, assign) Sex sex;
/** 同性恋 */
@property (nonatomic, assign, getter=isGay) BOOL gay;

@property (nonatomic, strong) id test;
@end

NS_ASSUME_NONNULL_END
