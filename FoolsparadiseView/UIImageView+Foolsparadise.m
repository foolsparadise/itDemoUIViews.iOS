//
//  UIImageView+Foolsparadise.h
//  FoolsparadiseView
//
//  Created by foolsparadise on 02/02/2018.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import "UIImageView+Foolsparadise.h"

@implementation UIImageView (Foolsparadise)

+ (UIImage *)imageWithNamed:(NSString *)imageName
{
    UIImage *image;
    NSString *bundleName;
    bundleName = @"FoolsparadiseView";
    NSString *path = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:imageName];
    image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
