//
//  TitleLabelTopAndBottomTableViewCell.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/01/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleLabelTopAndBottomTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *subtitleLabel;
- (void)configWithTitle:(NSString *)title withSubTitle:(NSString *)subtitle;
@end
