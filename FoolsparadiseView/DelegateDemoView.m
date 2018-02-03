//
//  DelegateDemoView.m
//  FoolsparadiseView
//
//  Created by foolsparadise on 02/02/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import "DelegateDemoView.h"

@interface DelegateDemoView ()

@end

@implementation DelegateDemoView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    //[self.delegate DelegateDemoViewDelegate:YES withViewTag:self.tag];
    
}



@end
