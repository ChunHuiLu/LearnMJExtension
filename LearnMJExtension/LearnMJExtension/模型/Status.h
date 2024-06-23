//
//  Status.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/23.
//

#import <Foundation/Foundation.h>


@class User;
NS_ASSUME_NONNULL_BEGIN

@interface Status : NSObject
// 微博正文
@property (nonatomic, copy) NSString *text;
// 微博作者
@property (nonatomic, strong) User *user;
// 转发的微博
@property (nonatomic, strong) Status *retweetedStatus;
@end

NS_ASSUME_NONNULL_END
