//
//  SelectListView.m
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "SelectListView.h"

@implementation SelectListView

static SelectListView *_singleton = nil ;
+ (SelectListView *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleton == nil) {
            _singleton = [[SelectListView alloc] init];
        }
    });
    return (SelectListView *)_singleton;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
//        self.itemHeight = frame.size.height;
//        self.itemWidth = frame.size.width;
//        [self addSubview:self.tfView];
//        [self addSubview:self.tbView];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}


- (void)updataUIWith:(UIButton *)btn{
    
    CGFloat vy = btn.frame.origin.y + btn.frame.size.height;
    if ( self && self.frame.origin.y == vy) {
        self.hidden = !self.hidden;
    }else{
        if (self.isHidden) {
            self.hidden = NO;
        }
        self.itemHeight = btn.frame.size.height;
        self.itemWidth = btn.frame.size.width;
        [self addSubview:self.tfView];
        [self addSubview:self.tbView];
        
        self.tbView.frame = CGRectMake(0, self.itemHeight, self.itemWidth, self.itemHeight * 10);
        self.frame = CGRectMake(btn.frame.origin.x, vy, btn.frame.size.width, btn.frame.size.height * 11);
        
        [btn.superview addSubview:self];
        
        
        
        [self.tbView reloadData];
    }
}

- (void)updataUIWithBtn:(UIButton *)btn withDataArray:(NSArray *)array{
    
    CGFloat vy = btn.frame.origin.y + btn.frame.size.height;
    if ( self && self.frame.origin.y == vy) {
        self.hidden = !self.hidden;
    }else{
        if (self.isHidden) {
            self.hidden = NO;
        }
        self.itemHeight = btn.frame.size.height;
        self.itemWidth = btn.frame.size.width;
        [self addSubview:self.tfView];
        [self addSubview:self.tbView];
        self.frame = CGRectMake(btn.frame.origin.x, vy, btn.frame.size.width, self.itemHeight * 11);
        [btn.superview addSubview:self];
        
        self.tbView.frame = CGRectMake(0, self.itemHeight, self.itemWidth, self.itemHeight * 10);
        self.frame = CGRectMake(btn.frame.origin.x, vy, btn.frame.size.width, btn.frame.size.height * 11);
        
        [btn.superview addSubview:self];
        
        
        
        [self.tbView reloadData];
    }
}

- (void) updataData{
    
    if (self.tfView.text.length > 0) {
        
        [self.KDataArray removeAllObjects];
        
        
    }else{
        self.KDataArray = [self.dataArray mutableCopy];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *slCell = @"slCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:slCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:slCell];
    }
    cell.textLabel.text = self.KDataArray[indexPath.row];
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.itemHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


-(UITextField *)tfView{
    if (!_tfView) {
        _tfView = [[UITextField alloc] init];
        _tfView.backgroundColor = [UIColor orangeColor];
    }
    _tfView.frame = CGRectMake(10, 2, self.itemWidth - 20, self.itemHeight - 4);
    return _tfView;
}

-(UITableView *)tbView{
    if (!_tbView) {
        _tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tbView.backgroundColor = [UIColor blueColor];
    }
//    _tbView.frame = CGRectMake(0, self.itemHeight, self.itemWidth, self.itemHeight * 10);
    return _tbView;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

-(NSMutableArray *)KDataArray{
    if (!_KDataArray) {
        _KDataArray = [NSMutableArray new];
    }
    return _KDataArray;
}

-(CGFloat)itemHeight{
    if (!_itemHeight) {
        _itemHeight = 40;
    }
    return _itemHeight;
}

-(CGFloat)itemWidth{
    if (!_itemWidth) {
        _itemWidth = 80;
    }
    return _itemWidth;
}
@end
