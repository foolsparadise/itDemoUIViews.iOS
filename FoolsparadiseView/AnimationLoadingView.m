//
//  AnimationLoadingView.m
//  iOSUIViewKit
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "AnimationLoadingView.h"

@interface AnimationLoadingView ()

@property (nonatomic,strong) UIImageView *animationImageView;
@property (nonatomic, strong) UIButton *msgButton;

@end

@implementation AnimationLoadingView

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
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 12.0;
    self.layer.borderWidth = 1;
    self.backgroundColor = [UIColor blackColor];
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
    
    [self addSubview:self.animationImageView];
    [self.animationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.mas_equalTo(self.mas_top).mas_offset(35);
        //make.left.mas_equalTo(self.left).mas_offset(20);
        make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(84, 15));
        
    }];
    
    [self addSubview:self.msgButton];
    [self.msgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(113.5);
        //make.left.mas_equalTo(self.left).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(self.width, 15));
        make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        
    }];
    
}
- (void)setMsgShowString:(NSString *)msgShowString
{
    [self.msgButton setTitle:msgShowString forState:UIControlStateNormal];
    [self.msgButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.msgButton sizeToFit];
}
- (UIImageView *)animationImageView
{
    if (!_animationImageView) {
        _animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(52, 63, 84, 15)];
        NSArray *gifArray = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"FoolsparadiseViewAnimationLoadingView_1"],
                             [UIImage imageNamed:@"FoolsparadiseViewAnimationLoadingView_2"],
                             [UIImage imageNamed:@"FoolsparadiseViewAnimationLoadingView_3"],
                             [UIImage imageNamed:@"FoolsparadiseViewAnimationLoadingView_4"],
                             nil];
        _animationImageView.animationImages = gifArray; //动画图片数组
        _animationImageView.animationDuration = 1; //执行一次完整动画所需的时长
        _animationImageView.animationRepeatCount = 0;  //动画重复次数
        [_animationImageView startAnimating];
    }
    return _animationImageView;
}
- (UIButton *)msgButton
{
    if (!_msgButton) {
        _msgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _msgButton.backgroundColor = [UIColor clearColor];
        //[_msgButton setTitle:@"Cancel" forState:UIControlStateNormal];
        //_msgButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_msgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //_msgButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        //_msgButton.layer.borderWidth = 1;
        _msgButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _msgButton.layer.borderWidth = 0;
        [_msgButton.layer setMasksToBounds:YES];
        [_msgButton.layer setCornerRadius:0];
        _msgButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_msgButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _msgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _msgButton.tag = 0;
        [_msgButton addTarget:self action:@selector(cancel_Button:) forControlEvents:UIControlEventTouchUpInside]; // click for cancel
        
    }
    return _msgButton;
}
- (void)cancel_Button:(UIButton *)btn
{
    // click for cancel
    if(self) {
        [self removeFromSuperview];
    }
}
@end
