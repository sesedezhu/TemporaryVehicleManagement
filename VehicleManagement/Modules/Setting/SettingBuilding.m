//
//  SettingBuilding.m
//  Camper
//
//  Created by JobNewMac1 on 16/9/18.
//  Copyright © 2016年 ning. All rights reserved.
//

#import "SettingBuilding.h"
//#import "BackFeedBuilding.h"
//#import "WorldProtocolBuilding.h"
#import "VersionView.h"
@interface SettingBuilding ()

@end

@implementation SettingBuilding

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSMutableArray *)LNInfoDataArray {
    NSMutableArray *temp = [NSMutableArray new];
    NSArray *tempDatas = @[
                           @[@"意见反馈"],
                           @[@"清除缓存",@"关于",@"版本"]
                           ];
    
    CGFloat cacheSize = [[SDImageCache sharedImageCache] getSize] / 1000.0 / 1000.0;
    
    NSString *cachtStr = [ NSString stringWithFormat:@"%.1fM",cacheSize];
    
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    versionStr = [@"V " stringByAppendingString:versionStr];
    
    NSArray *content = @[@[@""],@[cachtStr,@"",versionStr]];
    
    int j = 0;
    for (NSArray *array in tempDatas) {
        NSArray *contentArray = content[j];
        NSMutableArray *temps = [NSMutableArray new];
        int i = 0;
        for (NSString *str in array) {
            if (array.count-1 == i & i != 0) {
                [temps addObject:[LNInfoBuildingSimpleInfoModuel initWith:str Content:contentArray[i] Arrow:NO]];
            }else{
                [temps addObject:[LNInfoBuildingSimpleInfoModuel initWith:str Content:contentArray[i] Arrow:YES]];
            }
            i++;
        }
        [temp addObject:temps];
        j++;
    }
    return temp;
}


-(void)LNInfoBuildingSelectRow:(UITableView *)tableview Indexpath:(NSIndexPath *)indexPath Module:(LNInfoBuildingBaseModule *)module{
    if ([module.title isEqualToString:@"意见反馈"]) {
//        FeedBackBuilding *vc =[FeedBackBuilding new];
//        BackFeedBuilding *vc =[[BackFeedBuilding alloc] initWithNibName:@"BackFeedBuilding" bundle:nil];
//        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([module.title isEqualToString:@"清除缓存"]) {
        
        [[SDImageCache sharedImageCache] clearDisk];
        [self LNInfoBuildingReload];
        
        [LNMBProgressHUDSkill LNMBProgressHUDShowWord:@"清除成功!" INView:self.view];
        
        return;
    }
    if ([module.title isEqualToString:@"关于"]) {
//        WorldProtocolBuilding *vc = [WorldProtocolBuilding new];
//        vc.string = @"曾经沧海难为水，除却巫山不是云。 取次花丛懒回顾，半缘修道半缘君";
//        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    if ([module.title isEqualToString:@"版本"]) {
//        LNApplicationHttpURL(APPURL);
        [self getVersion];
    }
}

//获取APP版本
- (void)getVersion{
    
    [LNMBProgressHUDSkill LNMBProgressHUDINView:self.view];
    PostManNormalWithNORootParematers *postman = [PostManNormalWithNORootParematers new];
    postman.path = UserGetVersion;
    postman.params = @{@"type":@"ios"};
    [postman POST:^(id response) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
        if ([response isKindOfClass:[NSDictionary class]]) {
            NSString *getVersion = response[@"versionName"];
            if ([self containsAppVersion:getVersion]) {
                LNDLog(@"提示更新");
                [self showUptateViewWithGetVersion:response];
            }else{
                [LNMBProgressHUDSkill LNMBProgressHUDNoHiddenShowWord:@"当前最新版本" INView:self.view];
            }
        }
    } Faliure:^(NSString *errorStr) {
        [LNMBProgressHUDSkill LNMBProgressHUDHiddenINView:self.view];
    }];
}

- (BOOL)containsAppVersion:(NSString *)getVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    //    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    LNDLog(@"当前APP版本：appVersion:%@   Version:%@",appVersion,getVersion);
    
    NSArray *appV = [appVersion componentsSeparatedByString:@"."];
    NSArray *getV = [getVersion componentsSeparatedByString:@"."];
    
    NSUInteger n = appV.count > getV.count ? appV.count:getV.count;
    for (int i = 0 ; i < n ; i++) {
        NSInteger an = [self arrayWithInsdex:i array:appV];
        NSInteger gn = [self arrayWithInsdex:i array:getV];
        if (an > gn) {
            return NO;
        }
        if (an < gn) {
            return YES;
        }
    }
    return NO;
}

-(NSInteger)arrayWithInsdex:(int)i array:(NSArray*)array{
    if (array.count <= i) {
        return 0;
    }else{
        return [[array objectAtIndex:i] integerValue];
    }
}

- (void)showUptateViewWithGetVersion:(NSDictionary*)verDic{
    
    NSString *forcedUpdate = verDic[@"forcedUpdate"];
    NSString *updateExplain = verDic[@"updateExplain"];
    NSString *updateUrl = verDic[@"updateUrl"];
    LNDLog(@"当前APP版本：forcedUpdate:%@   updateExplain:%@",forcedUpdate,updateExplain);
    
    VersionView *verView = [[[NSBundle mainBundle] loadNibNamed:@"VersionView" owner:self options:nil] firstObject];
    verView.frame = self.view.frame;
    [verView showViewWithAbility:@"0" updateExplain:updateExplain url:updateUrl];
    __weak __typeof(verView)sverView = verView;
    verView.updateVersion = ^(NSString *url) {
        if ([url hasPrefix:@"http"]) {
            LNApplicationHttpURL(url);
            //            [sverView removeFromSuperview];
        }else{
            [sverView removeFromSuperview];
        }
    };
    [LNApplicationWindows addSubview:verView];
}

@end
