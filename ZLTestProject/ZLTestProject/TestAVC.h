//
//  TestAVC.h
//  ZLTestProject
//
//  Created by line0 on 15/8/26.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAVC : UIViewController

@end


@interface TestACell : UITableViewCell

@end

typedef NS_ENUM(NSUInteger, TestBType) {
    TestBType1111,
    TestBType1110,
    TestBType0111,
    TestBType0011,
    TestBType0010,
    TestBType1101
};

@interface TestBCell : UITableViewCell

@property (nonatomic, assign) TestBType type;

+ (CGFloat)getHeightByType:(TestBType)type;

@end