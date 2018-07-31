
#import "MainBuildingContainer.h"
#import "LeftSideViewBuilding.h"
#import "MainBuildingController.h"
#import "UserInfoBuilding.h"
#import "MessageBuilding.h"
#import "CacheTool.h"

@interface MainBuildingContainer ()
@property (nonatomic ,strong) LeftSideViewBuilding *vc1;
@property (nonatomic ,strong) UINavigationController *vc2;
@property (nonatomic ,strong) UIButton *backButton;
@property (nonatomic ,assign) CGFloat leftSideViewWidth;
@end

@implementation MainBuildingContainer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:self.vc2];
    [self addChildViewController:self.vc1];
    
    self.view.backgroundColor = WhiteColor;
    [self.view addSubview:self.vc2.view];
    [self.view addSubview:self.vc1.view];
    
    [self didMoveToParentViewController:self.vc2];
    
    [self.vc2.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    
    [self.vc1.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(-self.leftSideViewWidth);
        make.width.equalTo(@(self.leftSideViewWidth));
        make.top.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    
//    [self performSelector:@selector(getVersion) withObject:self afterDelay:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ui
-(void)hiddenLeftSide {
    [self.vc1.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(-self.leftSideViewWidth);
    }];
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
        self.backButton.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self.backButton removeFromSuperview];
        self.backButton = nil;
    }];
}

-(void)showLeftSide {
    
    [self.view insertSubview:self.backButton belowSubview:self.vc1.view];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    
    [self.view layoutIfNeeded];
    
    [self.vc1.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
    }];
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
        self.backButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.45];
    } completion:^(BOOL finished) {

    }];
}

#pragma mark event response
-(void)backAction {
    [self hiddenLeftSide];
}

#pragma mark setter getter
-(LeftSideViewBuilding *)vc1 {
    if (!_vc1) {
        __weak MainBuildingContainer *weekSelf = self;;
        _vc1 = [LeftSideViewBuilding new];
        _vc1.clickAvtion = ^(NSInteger index) {
            NSLog(@"LeftSideViewBuilding button tag index :%ld",index);
            [weekSelf hiddenLeftSide];
            dispatch_async(dispatch_get_main_queue(), ^{
                switch (index) {
                    case -1:
                    {
                        UserInfoBuilding *vc = [UserInfoBuilding new];
                        [weekSelf.vc2 pushViewController:vc animated:YES];
                    }
                        break;
//                    case 0:
//                    {
//                        ScheduleListBuilding *vc = [ScheduleListBuilding new];
//                        [weekSelf.vc2 pushViewController:vc animated:YES];
//                    }
//                        break;
//                    case 1:
//                    {
//                      RefuelBuilding *vc = [[RefuelBuilding alloc] initWithNibName:@"RefuelBuilding" bundle:nil];
//                        [weekSelf.vc2 pushViewController:vc animated:YES];
//                    }
//                        break;
//                    case 2:
//                    {
//                        WalletBuilding *vc = [WalletBuilding new];
//                        [weekSelf.vc2 pushViewController:vc animated:YES];
//                    }
//                        break;
//                    case 3:
//                    {
//                        MessageBuilding *vc = [MessageBuilding new];
//                        [weekSelf.vc2 pushViewController:vc animated:YES];
//                    }
//                        break;
//                    case 4:
//                    {
//                        SettingBuilding *vc = [SettingBuilding new];
//                        [weekSelf.vc2 pushViewController:vc animated:YES];
//
//                    }
//                        break;
                    default:
                        break;
                }
            });
        };
    }
    return _vc1;
}

-(UINavigationController *)vc2 {
    if (!_vc2) {
        _vc2 = [[UINavigationController alloc] initWithRootViewController:[MainBuildingController new]];
    }
    return _vc2;
}

-(UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton new];
        _backButton.backgroundColor = [UIColor clearColor];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

-(CGFloat)leftSideViewWidth {
    return LNScreenWidth*.8;
}

//获取APP版本
- (void)getVersion{

    PostManNormalWithNORootParematers *postman = [PostManNormalWithNORootParematers new];
    postman.path = UserGetVersion;
    postman.params = @{@"type":@"ios"};
    [postman POST:^(id response) {

        if ([response isKindOfClass:[NSDictionary class]]) {
            NSString *getVersion = response[@"versionName"];
            if ([self containsAppVersion:getVersion]) {
                LNDLog(@"提示更新");
                [self showUptateViewWithGetVersion:response];
            }
        }
    } Faliure:^(NSString *errorStr) {

    }];
}

- (void)showUptateViewWithGetVersion:(NSDictionary*)verDic{
    
    NSString *forcedUpdate = verDic[@"forcedUpdate"];
    NSString *updateExplain = verDic[@"updateExplain"];
    NSString *updateUrl = verDic[@"updateUrl"];
    LNDLog(@"当前APP版本：forcedUpdate:%@   updateExplain:%@",forcedUpdate,updateExplain);
    
//    VersionView *verView = [[[NSBundle mainBundle] loadNibNamed:@"VersionView" owner:self options:nil] firstObject];
//    verView.frame = self.view.frame;
//    [verView showViewWithAbility:forcedUpdate updateExplain:updateExplain url:updateUrl];
//    __weak __typeof(verView)sverView = verView;
//    verView.updateVersion = ^(NSString *url) {
//        if ([url hasPrefix:@"http"]) {
//            LNApplicationHttpURL(url);
////            [sverView removeFromSuperview];
//        }else{
//            [sverView removeFromSuperview];
//        }
//    };
//    [LNApplicationWindows addSubview:verView];
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

@end
