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
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    }
    return self;
}

//判断是否隐藏
- (BOOL)viewHiddenWithBtn:(UIButton*)btn{
    
    if (!self) {
        return NO;
    }
    if (self.frame.origin.y == btn.frame.origin.y + btn.frame.size.height) {
        self.hidden = !self.hidden;
        
        if (!self.hidden) {
            return YES;
        }else{
            return NO;
        }
    }
    
    return YES;
}

- (void)updataUIWithBtn:(UIButton *)btn withDataArray:(NSArray *)array{
    
//    if ( self && self.frame.origin.y == btn.frame.origin.y + btn.frame.size.height) {
//        self.hidden = !self.hidden;
//    }else{
    
    if ([self viewHiddenWithBtn:btn]) {
        
        if (self.isHidden) {
            self.hidden = NO;
        }
        self.itemHeight = btn.frame.size.height;
        self.itemWidth = btn.frame.size.width;
        btnRect = btn.frame;
        [self addSubview:self.tbView];
        [btn.superview addSubview:self];
        
        self.dataArray = [array mutableCopy];
        self.KDataArray = [array mutableCopy];
        
        [self updataTableViewDataWithString:@""];
    }
}

- (void) updataTableViewDataWithString:(NSString *)text{
    
    if (text.length > 0) {
        
        [self.KDataArray removeAllObjects];
        for (int i = 0; i < self.dataArray.count; i++) {

            if ([self.dataArray[i] rangeOfString:text].location != NSNotFound) {
                [self.KDataArray addObject:self.dataArray[i]];
            }
        }
    }else{
        self.KDataArray = [self.dataArray mutableCopy];
    }
    
    NSInteger numCell = self.KDataArray.count>=6?6:self.KDataArray.count;
    numCell = numCell<6?6:numCell;
    self.tbView.frame = CGRectMake(0,0, self.itemWidth, self.itemHeight * numCell);
    self.frame = CGRectMake(btnRect.origin.x, btnRect.origin.y + btnRect.size.height, self.itemWidth, self.itemHeight * numCell);
    
    [self.tbView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.KDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *slCell = @"slCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:slCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:slCell];
        cell.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    cell.textLabel.text = self.KDataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.itemHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = self.KDataArray[indexPath.row];
    if (self.selectObj) {
        self.selectObj(str);
    }
    self.hidden = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self updataTableViewDataWithString:searchText];
}

- (UISearchBar *)searchBarView{
    if (!_searchBarView) {
        _searchBarView = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        _searchBarView.placeholder = @"搜索内容";
//        _searchBarView.backgroundImage = [UIImage imageNamed:@"clearImage"];
        _searchBarView.delegate = self;
        //光标颜色
//        _searchBarView.tintColor = UIColorFromRGB(0x595959);
        UITextField *searchTextField = [_searchBarView valueForKey:@"_searchField"];
        searchTextField.font = [UIFont systemFontOfSize:15];
        searchTextField.textColor = [UIColor blackColor];
        //输入框背景颜色
//        searchTextField.backgroundColor = [UIColor redColor];
    }
    return _searchBarView;
}

-(UITableView *)tbView{
    if (!_tbView) {
        _tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tbView.backgroundColor = [UIColor clearColor];
        _tbView.delegate = self;
        _tbView.dataSource = self;
        _tbView.tableHeaderView = self.searchBarView;
    }
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
