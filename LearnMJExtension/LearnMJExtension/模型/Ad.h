//
//  Ad.h
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ad : NSObject

/** 广告图片 */
@property (copy, nonatomic) NSString *image;
/** 广告url */
@property (strong, nonatomic) NSURL *url;

@end

NS_ASSUME_NONNULL_END
