//
//  TestBVC.m
//  ZLTestProject
//
//  Created by line0 on 15/8/27.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import "TestBVC.h"
#import "Header.h"

@interface TestBVC ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_table;
}

@end

@implementation TestBVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TestB";
    self.view.backgroundColor = [UIColor lightGrayColor];
        //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _table = [UITableView new];
    _table.backgroundColor = [UIColor whiteColor];
    _table.delegate = self;
    _table.dataSource = self;
        //    _table.rowHeight = 240;
    [self.view addSubview:_table];
    _table.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
            //        UIView *navi = (id)self.topLayoutGuide;
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
    }];
    
}

- (void)ggoNextVC
{
    TestBVC *ttestvc = [TestBVC new];
    [self.navigationController pushViewController:ttestvc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCCell = @"kkkllcell";
    TTestBCell *cell = [tableView dequeueReusableCellWithIdentifier:myCCell];
    if (!cell) {
        cell = [[TTestBCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCCell];
    }
        //    cell.textLabel.text = @(indexPath.row).stringValue;
//    cell.type = indexPath.row%6;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;//[TestBCell getHeightByType:indexPath.row%6];
}

@end

@interface TTestBCell ()
{
    UIImageView *_image;
    UILabel     *_name;
    UILabel     *_title;
    UILabel     *_detail;
    UIButton    *_endBtn;
}

@end

@implementation TTestBCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [UIImageView new];
        _image.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_image];
        
        _name = [UILabel new];
        _name.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_name];
        _title = [UILabel new];
        _title.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_title];
        _detail = [UILabel new];
        _detail.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_detail];
        
        _endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _endBtn.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_endBtn];
        
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView).offset(2);
//            make.left.equalTo(self.contentView).offset(15);
            
            make.top.left.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(2, 15, 2, 0));
            make.width.equalTo(@40);
//            make.height.equalTo(@40);
        }];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.mas_top).offset(-1);
            make.left.equalTo(_image.mas_right).offset(8);
                //            make.width.equalTo(@40);
            make.height.equalTo(@[_title, _detail]);
            make.right.equalTo(_endBtn.mas_left).offset(-8);
            make.bottom.equalTo(_title.mas_top).offset(-2);
        }];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_name.mas_bottom).offset(2);
            make.left.equalTo(_name.mas_left).offset(-3);
            make.width.equalTo(@[_detail]);
            make.height.equalTo(@[_name, _detail]);
            make.bottom.equalTo(self.contentView).offset(-1);
        }];
        [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_title.mas_top).offset(0);
            make.left.equalTo(_title.mas_right).offset(6);
            make.width.equalTo(@[_title]);
            make.right.equalTo(_endBtn.mas_left).offset(-5);
            make.height.equalTo(@[_name, _title]);
        }];
        [_endBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView).offset(2);
            make.right.equalTo(self.contentView).offset(-15);
            make.width.equalTo(@45);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(2);
            make.height.equalTo(self.contentView).with.multipliedBy(.8f);
        }];
    }
    return self;
}

@end