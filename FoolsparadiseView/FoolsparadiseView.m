//
//  FoolsparadiseView.m
//  FoolsparadiseView
//
//  Created by foolsparadise on 2018/1/30.
//  Copyright © 2018 github.com/foolsparadise All rights reserved.
//

#import "FoolsparadiseView.m"

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

