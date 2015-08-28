//
//  TestAVC.m
//  ZLTestProject
//
//  Created by line0 on 15/8/26.
//  Copyright (c) 2015年 zhanglei. All rights reserved.
//

#import "TestAVC.h"
#import "Header.h"
#import "TestBVC.h"

@interface TestAVC ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_table;
}

@end

@implementation TestAVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TestA";
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
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"TestB" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, 50, 44);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(ggoNextVC) forControlEvents:UIControlEventTouchUpInside];
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
    TestBCell *cell = [tableView dequeueReusableCellWithIdentifier:myCCell];
    if (!cell) {
        cell = [[TestBCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCCell];
    }
//    cell.textLabel.text = @(indexPath.row).stringValue;
    cell.type = indexPath.row%6;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TestBCell getHeightByType:indexPath.row%6];
}

@end

@interface TestACell ()
{
    UIImageView *_image;
    UILabel     *_name;
    UILabel     *_title;
    UILabel     *_detail;
    UIButton    *_endBtn;
}

@end

@implementation TestACell

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
            make.top.equalTo(self.contentView).offset(2);
            make.left.equalTo(self.contentView).offset(15);
            make.width.equalTo(@40);
            make.height.equalTo(@40);
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
            make.top.equalTo(self.contentView).offset(2);
            make.right.equalTo(self.contentView).offset(-15);
            make.width.equalTo(@45);
            make.height.equalTo(@40);
        }];
    }
    return self;
}

@end

@interface TestBCell()
@property (nonatomic, strong) MASConstraint *cF; //constraint first row
@property (nonatomic, strong) MASConstraint *cB; //constraint blue
@property (nonatomic, strong) MASConstraint *cY; //constraint yellow
@property (nonatomic, strong) MASConstraint *cR; //constraint red
@property (nonatomic, strong) MASConstraint *cG; //constraint green
@property (nonatomic, strong) UIView *gF; //group first row
@property (nonatomic, strong) UIView *gB; //group blue
@property (nonatomic, strong) UIView *gY; //group yellow
@property (nonatomic, strong) UIView *gR; //group red
@property (nonatomic, strong) UIView *gG; //group green
@property (nonatomic, strong) UIView *vB; //view blue    height:30
@property (nonatomic, strong) UIView *vY; //view yellow  height:30
@property (nonatomic, strong) UIView *vR; //view red     height:30
@property (nonatomic, strong) UIView *vG; //view green   height:100
@end
@implementation TestBCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    if ( self ) {
        
        CGFloat spacing = 10.0f;
        
        
        self.gF = [UIView new];
        [self.contentView addSubview:self.gF];
        [self.gF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            
            self.cF = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cF deactivate];
        }];
        self.gF.clipsToBounds = YES;
        
        self.gB = [UIView new];
        [self.gF addSubview:self.gB];
        [self.gB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.gF);
            
            self.cB = make.width.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cB deactivate];
        }];
        self.gB.clipsToBounds = YES;
        
        self.gY = [UIView new];
        [self.gF addSubview:self.gY];
        [self.gY mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.gF);
            make.left.equalTo(self.gB.mas_right);
            
            self.cY = make.width.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cY deactivate];
        }];
        self.gY.clipsToBounds = YES;
        
        self.gR = [UIView new];
        [self.contentView addSubview:self.gR];
        [self.gR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.gF.mas_bottom);
            
            self.cR = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cR deactivate];
        }];
        self.gR.clipsToBounds = YES;
        
        self.gG = [UIView new];
        [self.contentView addSubview:self.gG];
        [self.gG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.gR.mas_bottom);
            
            self.cG = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cG deactivate];
        }];
        self.gG.clipsToBounds = YES;
        
        
        self.vB = [UIView new];
        [self.gB addSubview:self.vB];
        [self.vB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.gB).insets(UIEdgeInsetsMake(spacing, spacing, 0, 0)).priorityLow();
            make.height.equalTo(@30);
            make.width.equalTo(@60);
        }];
        self.vB.backgroundColor = [UIColor blueColor];
        
        
        self.vY = [UIView new];
        [self.gY addSubview:self.vY];
        [self.vY mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.gY).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        self.vY.backgroundColor = [UIColor yellowColor];
        
        self.vR = [UIView new];
        [self.gR addSubview:self.vR];
        [self.vR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.gR).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        self.vR.backgroundColor = [UIColor redColor];
        
        self.vG = [UIView new];
        [self.gG addSubview:self.vG];
        [self.vG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.gG).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@100);
        }];
        self.vG.backgroundColor = [UIColor greenColor];
        
    }
    
    return self;
}

- (void)setType:(TestBType)type {
    
    [self.cF deactivate];
    [self.cB deactivate];
    [self.cY deactivate];
    [self.cR deactivate];
    [self.cG deactivate];
    
    switch (type) {
        case TestBType1111:
        {
            break;
        }
        case TestBType0111:
        {
            [self.cB activate];
            break;
        }
        case TestBType0011:
        {
            [self.cF activate];
            break;
        }
        case TestBType1110:
        {
            [self.cG activate];
            break;
        }
        case TestBType1101:
        {
            [self.cR activate];
            break;
        }
        case TestBType0010:
        {
            [self.cF activate];
            [self.cG activate];
            break;
        }
            
        default:
            break;
    }
}
+ (CGFloat)getHeightByType:(TestBType)type {
    
    switch (type) {
        case TestBType1111:
        {
        }
        case TestBType0111:
        {
            return 10 + 30 + 10 + 30 + 10 + 100 + 10;
        }
        case TestBType1110:
        {
            return 10 + 30 + 10 + 30 + 10;
        }
        case TestBType0011:
        {
        }
        case TestBType1101:
        {
            return 10 + 30 + 10 + 100 + 10;
        }
        case TestBType0010:
        {
            return 10 + 30 + 10;
        }
            
        default:
            break;
    }
    
    return 0;
}
@end