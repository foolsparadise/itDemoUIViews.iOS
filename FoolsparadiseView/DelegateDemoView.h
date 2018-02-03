//
//  DelegateDemoView.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 02/02/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DelegateDemoViewDelegate <NSObject>

@optional
- (void)DelegateDemoViewDelegate:(BOOL)isOK withViewTag:(NSInteger)ViewTag;

@end

@interface DelegateDemoView : UIView

@property (nonatomic, weak) id <DelegateDemoViewDelegate> delegate;

@end

