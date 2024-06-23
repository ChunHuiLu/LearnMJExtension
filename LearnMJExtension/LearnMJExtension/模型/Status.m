//
//  Status.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/23.
//

#import "Status.h"
#import "User.h"

@implementation Status
- (NSString *)description {
    return [NSString stringWithFormat:@"text:%@\n,user:%@\n,retweetedStatus:%@",_text,_user.description,_retweetedStatus.description];
}
@end
