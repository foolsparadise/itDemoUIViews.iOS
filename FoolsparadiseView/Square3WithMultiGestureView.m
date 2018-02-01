//
//  Square3WithMultiGestureView.m
//  iOSUIViewKit
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "Square3WithMultiGestureView.h"

@interface Square3WithMultiGestureView ()

@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *middleUIButton;
@property (nonatomic, strong) UIButton *downButton;

@end

@implementation Square3WithMultiGestureView

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
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
 
    [self addSubview:self.upButton];
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.width, self.width/3));
        make.top.mas_equalTo(self.top).mas_offset(0);
        
    }];
    
    [self addSubview:self.middleUIButton];
    [self.middleUIButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.width, self.width/3));
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
    }];
    
    [self addSubview:self.downButton];
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.width, self.width/3));
        make.bottom.mas_equalTo(self.bottom).mas_offset(0);
    }];
    
}
- (void)setUpImageViewString:(NSString *)upImageViewString
{
    NSString *resourePath = [[NSBundle mainBundle] resourcePath];
    [self.upButton setImage:[UIImage imageWithContentsOfFile:[resourePath stringByAppendingPathComponent:upImageViewString]] forState:UIControlStateNormal];
    [self.upButton sizeToFit];
}
- (void)setMiddleLableString:(NSString *)middleLableString
{
    [self.middleUIButton setTitle:NSLocalizedStringFromTable(middleLableString, @"InfoPlist", nil) forState:UIControlStateNormal];
    self.middleUIButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.middleUIButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
- (UIButton *)middleUIButton
{
    if (!_middleUIButton) {
        _middleUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _middleUIButton.backgroundColor = [UIColor whiteColor];
        _middleUIButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _middleUIButton.layer.borderWidth = 0;
        [_middleUIButton.layer setMasksToBounds:YES];
        [_middleUIButton.layer setCornerRadius:12.0];
        _middleUIButton.tag = 0;
        [_middleUIButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _middleUIButton;
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
        _downButton.tag = 2;
        [_downButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _downButton;
}
- (void)click_Button:(UIButton *)btn
{
    NSInteger tagg = (long)btn.tag;
    //NSLog(@"click_upButton %ld", tagg);
    if(tagg>0) // 0 not response
    {
        [self.delegate Square3WithMultiGestureViewDelegate:self.tag withButtonTag:tagg];
    }
}
@end
