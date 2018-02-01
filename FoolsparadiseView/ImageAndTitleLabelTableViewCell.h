//
//  ImageAndTitleLabelTableViewCell.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 19/01/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageAndTitleLabelTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *titleimageView;
@property(nonatomic,strong)UILabel *titleLabel;
- (void)configWithTitle:(NSString *)title withTitleImageName:(NSString *)ImageName;
@end
