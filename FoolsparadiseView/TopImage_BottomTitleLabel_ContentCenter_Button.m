//
//  TopImage_BottomTitleLabel_ContentCenter_Button.m
//  ContentCenterButton
//
//  Created by foolsparadise on 27/01/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import "TopImage_BottomTitleLabel_ContentCenter_Button.h"

@implementation TopImage_BottomTitleLabel_ContentCenter_Button

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
    
    //self = [UIButton buttonWithType:UIButtonTypeCustom];
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
    self.layer.borderWidth = 0;
    self.layer.borderColor = RGBCOLOR(226, 226, 226).CGColor;
    //self.backgroundColor = [UIColor orangeColor];
    //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    //self.contentMode = UIViewContentModeScaleAspectFit;
    //self.layer.cornerRadius = 68/2.0;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.layer.masksToBounds = YES;
    //self.tag = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setTitleColor:[UIColor colorWithRed:188/255.0 green:186/255.0 blue:186/255.0 alpha:1] forState:UIControlStateNormal];
    //[self setTitle:@"" forState:UIControlStateNormal];
    //[self setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
}

- (void)configureheightSpace:(CGFloat)heightSpace withTitle:(NSString *)title withImageNamed:(NSString *)imagename
{
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    
    //居中设置
    CGSize imgViewSize,titleSize,btnSize;
    UIEdgeInsets imageViewEdge,titleEdge;
    //CGFloat heightSpace = 26.0f; //(整个button大小120-其中image大小68)/2=26算出来的
    //设置按钮内边距
    imgViewSize = self.imageView.bounds.size;
    titleSize = self.titleLabel.bounds.size;
    btnSize = self.bounds.size;
    imageViewEdge = UIEdgeInsetsMake(heightSpace,heightSpace, btnSize.height -imgViewSize.height - heightSpace, - titleSize.width);
    [self setImageEdgeInsets:imageViewEdge];
    titleEdge = UIEdgeInsetsMake(imgViewSize.height +heightSpace, - imgViewSize.width, 0.0, 0.0);
    [self setTitleEdgeInsets:titleEdge];
    
}

@end
