//
//  StatusResult.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatusResult : NSObject
/** 存放着某一页微博数据（里面都是Status模型） */
@property (strong, nonatomic) NSMutableArray *statuses;
/** 存放着一堆的广告数据（里面都是Ad模型） */
@property (strong, nonatomic) NSArray *ads;
/** 总数 */
@property (strong, nonatomic) NSNumber *totalNumber;
/** 上一页的游标 */
@property (assign, nonatomic) long long previousCursor;
/** 下一页的游标 */
@property (assign, nonatomic) long long nextCursor;
@end

NS_ASSUME_NONNULL_END
