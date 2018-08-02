//
//  SendCarController.m
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "SendCarController.h"
#import "SelectListView.h"

@interface SendCarController ()
{
    UIButton *_selectBtn;
}

- (IBAction)btnsAction:(UIButton *)sender;


@end

@implementation SendCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"看房派车";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_selectBtn) {
        [[SelectListView shareInstance] viewHiddenWithBtn:_selectBtn];
        _selectBtn = nil;
    }
}

- (IBAction)btnsAction:(UIButton *)sender {
    NSArray *array = @[@"三亚",@"三海1",@"海33",@"三海44",@"三海444",@"海776",@"海23",@"海8785",@"海",@"海南",@"海贝",@"海哈",@"万dd",@"三海",@"名密码",@"亚海",@"三海亚亚",@"三南海",@"海科科"];
    _selectBtn = sender;
    SelectListView *sView = [SelectListView shareInstance];
    [sView updataUIWithBtn:sender withDataArray:array];
    sView.selectObj = ^(NSString *string) {
        [sender setTitle:string forState:UIControlStateNormal];
    };
}
@end
