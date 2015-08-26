//
//  Header.h
//  ZLTestProject
//
//  Created by line0 on 15/8/26.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#ifndef ZLTestProject_Header_h
#define ZLTestProject_Header_h

    //加入这句宏   可以不用使用mas_前缀
#define MAS_SHORTHAND
#import "Masonry.h"

    //屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
    //屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


    //自动适配宽度,width为原始iphone4/5的宽度
#define AUTO_MATE_WIDTH(width) ((width) * SCREEN_WIDTH / 320.0)

    //自动适配宽度,width为原始iphone4/5的高度
#define AUTO_MATE_HEIGHT(height) ((height) * SCREEN_HEIGHT / 568.0)

#endif
