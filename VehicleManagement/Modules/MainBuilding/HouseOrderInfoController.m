//
//  HouseOrderInfoController.m
//  VehicleManagement
//
//  Created by ZQWFMac on 2018/7/27.
//  Copyright © 2018年 ZQWFMac. All rights reserved.
//

#import "HouseOrderInfoController.h"
#import "SendCarController.h"

@interface HouseOrderInfoController ()
- (IBAction)sendCarBtnAction:(UIButton *)sender;

@end

@implementation HouseOrderInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"安排看房";
    
    
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

- (IBAction)sendCarBtnAction:(UIButton *)sender {
    SendCarController *vc = [[SendCarController alloc] initWithNibName:@"SendCarController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
