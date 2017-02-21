//
//  FYBackBtn.m
//  PerfectBuyText
//
//  Created by FonChY on 16/8/10.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import "FYBackBtn.h"

@implementation FYBackBtn

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.frame =CGRectMake(0, 0, 20, 25);
        [self setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        self.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    }
    return self;
}
@end
