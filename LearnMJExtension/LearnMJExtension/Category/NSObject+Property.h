//
//  NSObject+Property.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Property)
+ (NSArray * )properties;
+ (BOOL)isClassFromFoundation:(Class)c;
@end

NS_ASSUME_NONNULL_END
