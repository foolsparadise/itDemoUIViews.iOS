//
//  TitleLabelTopAndBottomTableViewCell.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/01/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import "TitleLabelTopAndBottomTableViewCell.h"

@implementation TitleLabelTopAndBottomTableViewCell

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
    
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];;
    self.titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.titleLabel sizeToFit];
    [self.contentView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(10);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(300, 30));
    }];
    
    
    self.subtitleLabel = [UILabel new];
    self.subtitleLabel.textAlignment = NSTextAlignmentLeft;
    self.subtitleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];;
    self.subtitleLabel.textColor = [UIColor colorWithRed:188/255.0 green:186/255.0 blue:186/255.0 alpha:1];
    [self.subtitleLabel sizeToFit];
    [self.contentView addSubview:self.subtitleLabel];
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.mas_left).mas_offset(10);
        make.top.mas_equalTo(weakSelf.mas_top).mas_offset(30);
        make.size.mas_equalTo(CGSizeMake(300, 26));
    }];
    
    
}
- (void)configWithTitle:(NSString *)title withSubTitle:(NSString *)subtitle
{
    self.titleLabel.text = title;
    self.subtitleLabel.text = [subtitle stringByReplacingOccurrencesOfString:@"\n" withString:@""];
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
