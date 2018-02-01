//
//  ImageAndTitleLabelTableViewCell.m
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/01/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import "ImageAndTitleLabelTableViewCell.h"

@implementation ImageAndTitleLabelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self initViews];
    }
    return self;
}
- (void)initViews{
    __weak typeof(self) weakSelf = self;
    
    self.titleimageView = [UIImageView new];
    [self.contentView addSubview:self.titleimageView];
    [_titleimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(10);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(8);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];;
    self.titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.titleLabel sizeToFit];
    [self.contentView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(10+40+10);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(8);
        make.size.mas_equalTo(CGSizeMake(300, 40));
    }];
    
}
- (void)configWithTitle:(NSString *)title withTitleImageName:(NSString *)ImageName
{
    self.titleLabel.text = title;
    self.titleimageView.image =  [UIImage imageNamed:ImageName];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
