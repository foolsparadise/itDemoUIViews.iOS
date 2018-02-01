//
//  Round5WithMultiGestureView.m
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "Round5WithMultiGestureView.h"

@interface Round5WithMultiGestureView ()

@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *middleUIButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *downButton;

@end

@implementation Round5WithMultiGestureView

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
    
    self.layer.borderWidth = 1;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.layer.cornerRadius = self.width/2.0;
    self.layer.masksToBounds = YES;

    
    [self addSubview:self.upButton];
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.top.mas_equalTo(self.top).mas_offset(0);
        
    }];
    
    [self addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.centerY.mas_equalTo(self.centerY).mas_offset(0);
        
    }];
    
    [self addSubview:self.middleUIButton];
    [self.middleUIButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
    }];
    
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.right).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.centerY.mas_equalTo(self.centerY).mas_offset(0);
    }];
    
    [self addSubview:self.downButton];
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.centerX).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.bottom.mas_equalTo(self.bottom).mas_offset(0);
    }];
    
}
- (void)setUpImageViewString:(NSString *)upImageViewString
{
    NSString *resourePath = [[NSBundle mainBundle] resourcePath];
    [self.upButton setImage:[UIImage imageWithContentsOfFile:[resourePath stringByAppendingPathComponent:upImageViewString]] forState:UIControlStateNormal];
    [self.upButton sizeToFit];
}
- (void)setLeftImageViewString:(NSString *)leftImageViewString
{
    NSString *resourePath = [[NSBundle mainBundle] resourcePath];
    [self.leftButton setImage:[UIImage imageWithContentsOfFile:[resourePath stringByAppendingPathComponent:leftImageViewString]] forState:UIControlStateNormal];
    [self.leftButton sizeToFit];
}
- (void)setMiddleLableString:(NSString *)middleLableString
{
    [self.middleUIButton setTitle:NSLocalizedStringFromTable(middleLableString, @"InfoPlist", nil) forState:UIControlStateNormal];
    self.middleUIButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.middleUIButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)setRightImageViewString:(NSString *)rightImageViewString
{
    NSString *resourePath = [[NSBundle mainBundle] resourcePath];
    [self.rightButton setImage:[UIImage imageWithContentsOfFile:[resourePath stringByAppendingPathComponent:rightImageViewString]] forState:UIControlStateNormal];
    [self.rightButton sizeToFit];
}
- (void)setDownImageViewString:(NSString *)downImageViewString
{
    NSString *resourePath = [[NSBundle mainBundle] resourcePath];
    [self.downButton setImage:[UIImage imageWithContentsOfFile:[resourePath stringByAppendingPathComponent:downImageViewString]] forState:UIControlStateNormal];
    [self.downButton sizeToFit];
}
- (UIButton *)upButton
{
    if (!_upButton) {
        _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _upButton.backgroundColor = [UIColor whiteColor];
        _upButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _upButton.layer.borderWidth = 0;
        [_upButton.layer setMasksToBounds:YES];
        [_upButton.layer setCornerRadius:12.0];
        _upButton.tag = 1;
        [_upButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _upButton;
}
- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor whiteColor];
        _leftButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _leftButton.layer.borderWidth = 0;
        [_leftButton.layer setMasksToBounds:YES];
        [_leftButton.layer setCornerRadius:12.0];
        _leftButton.tag = 2;
        [_leftButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _leftButton;
}
- (UIButton *)middleUIButton
{
    if (!_middleUIButton) {
        _middleUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _middleUIButton.backgroundColor = [UIColor whiteColor];
        _middleUIButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        _middleUIButton.layer.borderWidth = 1;
        _middleUIButton.layer.borderWidth = 1;
        _middleUIButton.backgroundColor = [UIColor whiteColor];
        _middleUIButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        _middleUIButton.contentMode = UIViewContentModeScaleAspectFit;
        _middleUIButton.layer.cornerRadius = 90/2.0;
        _middleUIButton.layer.masksToBounds = YES;
        _middleUIButton.tag = 0; // 0 not response
        [_middleUIButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _middleUIButton;
}
- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor whiteColor];
        _rightButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _rightButton.layer.borderWidth = 0;
        [_rightButton.layer setMasksToBounds:YES];
        [_rightButton.layer setCornerRadius:12.0];
        _rightButton.tag = 3;
        [_rightButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightButton;
}
- (UIButton *)downButton
{
    if (!_downButton) {
        _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _downButton.backgroundColor = [UIColor whiteColor];
        _downButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _downButton.layer.borderWidth = 0;
        [_downButton.layer setMasksToBounds:YES];
        [_downButton.layer setCornerRadius:12.0];
        _downButton.tag = 4;
        [_downButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _downButton;
}
- (void)click_Button:(UIButton *)btn
{
    NSInteger tagg = (long)btn.tag;
    //NSLog(@"click_upButton %ld", tagg);
    //if(tagg>0) // 0 not response
    {
        [self.delegate Round5WithMultiGestureViewDelegate:self.tag withButtonTag:tagg];
    }
}
@end
