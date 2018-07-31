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

- (IBAction)btnsAction:(UIButton *)sender {
    
//    SelectListView *view = [[[NSBundle mainBundle] loadNibNamed:@"SelectListView" owner:self options:nil] lastObject];
    
    
//    SelectListView *slView = [[SelectListView alloc] initWithFrame:];
//    [slView updataUIWith:sender];
    [[SelectListView shareInstance] updataUIWith:sender];
}
@end
