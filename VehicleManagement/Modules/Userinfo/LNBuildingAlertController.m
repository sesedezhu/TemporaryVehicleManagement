//
//  LNBuildingAlertController.m
//  FragrantTown
//
//  Created by liu on 16/8/17.
//  Copyright © 2016年 FragrantTown. All rights reserved.
//

#import "LNBuildingAlertController.h"

@interface LNBuildingAlertController ()

@end

@implementation LNBuildingAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)showOnBuilding:(UIViewController *)vc Titles:(NSArray *)titles Done: (void (^)(NSString *done))done {
    LNBuildingAlertController *con = [LNBuildingAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString *str in titles) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            done(str);
        }];
        [con addAction:action];
    }
    
    UIAlertAction *actioncancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [con addAction:actioncancle];
    
    [vc presentViewController:con animated:YES completion:^{
        
    }];
    
}

+(void)showOnBuilding:(UIViewController *)vc Message:(NSString *)message Titles:(NSArray *)titles Done: (void (^)(NSString *done))done {
    LNBuildingAlertController *con = [LNBuildingAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString *str in titles) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            done(str);
        }];
        [con addAction:action];
    }
    
    UIAlertAction *actioncancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [con addAction:actioncancle];
    
    [vc presentViewController:con animated:YES completion:^{
        
    }];

}

@end
