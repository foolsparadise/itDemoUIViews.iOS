//
//  AlertWith2ButtonView.m
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/9/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "AlertWith2ButtonView.h"

@interface AlertWith2ButtonView ()

@property (nonatomic, strong) UIButton *alertButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation AlertWith2ButtonView

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
    self.layer.cornerRadius = 0;
    self.layer.borderWidth = 1;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
    self.backgroundColor = RGBCOLOR(240, 242, 246);
    
    [self addSubview:self.alertButton];
    [self.alertButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(35);
        //make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.width, 14.5));
        make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        
    }];
    
    [self addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(69);
        //make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.width*0.5-40, 44));
        make.right.mas_equalTo(self.mas_centerX).mas_offset(-20);
        
    }];
    
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(69);
        //make.left.mas_equalTo(self.left).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(self.width*0.5-40, 44));
        make.left.mas_equalTo(self.mas_centerX).mas_offset(20);
    }];

    
}

- (void)setTitleAlertString:(NSString *)titleAlertString
{
    [self.alertButton setTitle:NSLocalizedStringFromTable(titleAlertString, @"InfoPlist", nil) forState:UIControlStateNormal];
    self.alertButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.alertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)setLeftButtonString:(NSString *)leftButtonString
{
    [self.leftButton setTitle:NSLocalizedStringFromTable(leftButtonString, @"InfoPlist", nil) forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (void)setRightButtonString:(NSString *)rightButtonString
{
    [self.rightButton setTitle:NSLocalizedStringFromTable(rightButtonString, @"InfoPlist", nil) forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
- (UIButton *)alertButton
{
    if (!_alertButton) {
        _alertButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _alertButton.backgroundColor = [UIColor clearColor];
        //[_alertButton setTitle:@"SomeTitle" forState:UIControlStateNormal];
        //_alertButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_alertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //_alertButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        //_alertButton.layer.borderWidth = 1;
        _alertButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _alertButton.layer.borderWidth = 0;
        [_alertButton.layer setMasksToBounds:YES];
        [_alertButton.layer setCornerRadius:12.0];
        _alertButton.tag = 0; //为零，就不响应了
        [_alertButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _alertButton;
}
- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor whiteColor];
        //[_leftButton setTitle:@"SomeTitle" forState:UIControlStateNormal];
        //_leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        _leftButton.layer.borderWidth = 1;
        _leftButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _leftButton.layer.borderWidth = 0;
        [_leftButton.layer setMasksToBounds:YES];
        [_leftButton.layer setCornerRadius:12.0];
        _leftButton.tag = 1; //为零，就不响应了
        [_leftButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _leftButton;
}
- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor whiteColor];
        //[_rightButton setTitle:@"SomeTitle" forState:UIControlStateNormal];
        //_rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightButton.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
        _rightButton.layer.borderWidth = 1;
        _rightButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _rightButton.layer.borderWidth = 0;
        [_rightButton.layer setMasksToBounds:YES];
        [_rightButton.layer setCornerRadius:12.0];
        _rightButton.tag = 2; //为零，就不响应了
        [_rightButton addTarget:self action:@selector(click_Button:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightButton;
}
- (void)click_Button:(UIButton *)btn
{
    NSInteger tagg = (long)btn.tag;
    //NSLog(@"click_leftButton %ld", tagg);
    if(tagg>0)
    {
        [self.delegate AlertWith2ButtonViewDelegate:self.tag withButtonTag:tagg];
    }
}
@end
