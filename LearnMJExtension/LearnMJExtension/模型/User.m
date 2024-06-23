//
//  User.m
//  LearnMJExtension
//
//  Created by 卢春晖 on 2024/6/22.
//

#import "User.h"


@implementation User
- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"name=%@, icon=%@, age=%u, height=%@, money=%@, sex=%d, gay=%d", self.name, self.icon, self.age, self.height, self.money, self.sex, self.gay];
}
@end
