//
//  WorldPathConfigure.h
//  Camper
//
//  Created by JobNewMac1 on 16/9/23.
//  Copyright © 2016年 ning. All rights reserved.
//


#pragma mark 服务器地址

//#define RequestPrefix        @"http://121.43.38.86:8080/houseTaxi";//正式环境老平台
//#define RequestPrefix        @"http://112.74.165.118:9082/houseTaxiService";//正式环新平台 （上线）
//#define RequestPrefix        @"http://192.168.101.121:9082/houseTaxiAppService";//开发环境 192.168.101.121AdministratorNaliwan2017$
#define RequestPrefix        @"http://192.168.101.115/houseTaxiAppServer";//测试环境
//#define RequestPrefix       @"http://192.168.101.115//houseTaxiAppServer";//高露
//#define RequestPrefix       @"http://192.168.101.136:8080/houseTaxiAppServer";
//#define RequestPrefix       @"http://192.168.101.189:8081/houseTaxiAppServer";
//#define RequestPrefix       @"http://192.168.101.109:8081/houseTaxiAppServer";
//#define RequestPrefix       @"http://192.168.101.133:8090/houseTaxiAppServer";//旺

#ifndef WorldPathConfigure_h
#define WorldPathConfigure_h

//登录 司机
#define DriverLogin_Path                @"/driver/login"

//ChannelId
#define SalesLoginChannelId             @"/sales/setChannelId"
// 获取司机信息
#define UserGetUserOrDriverInfo_Path    @"/user/getUserOrDriverInfo"

//修改司机或销售用户信息
#define UserUpdateUserOrDriver          @"/user/updateUserOrDriver"

// 获取司机状态
#define DriverOrderDriverStatus         @"/driver/order/driverStatus"

//获取销售顾问或司机信息
#define NoticeList                      @"/notice/list"

//读通知后
#define NoticeReadNotice                @"/notice/readNotice"

//意见反馈/ 旧版
//#define OpinionSubmit                   @"/opinion/submit"
//意见反馈/新版
//#define DriverOrderOpinionFeedback      @"/driver/order/opinionFeedback"

//司机的行程 首页使用的,得到的全是可以抢到订单/
//#define DriverOrderList                 @"/driver/order/list"

//司机的行程 订单详情
//#define DriverOrderFindTakeOrder        @"/driver/order/findTakeOrder"

//已抢订单 行程页面使用的
//#define DriverOrderNowList              @"/driver/order/nowList"

//更新车辆位置，改版后废弃，已不再使用
//#define UserRefreshCarLocal             @"/user/refreshCarLocal"

//回传车辆位置
//#define SynchronReshCarLocal            @"/synchron/refreshCarLocal"

//抢单
//#define DriverOrderRobOrder             @"/driver/order/robOrder"

//行程开始
//#define DriverOrderStart                @"/driver/order/start"

//行程结束
//#define DriverOrderFinish               @"/driver/order/finish"

//司机还车
//#define UserGiveBack                    @"/user/giveBack"

//司机设置回程
//#define UserSetUpBack                   @"/user/setUpBack"

//账单
//#define BillMonth                       @"/bill/month"

//司机签到
//#define DriverOrderSign                 @"/driver/order/sign"

//司机总价
//#define DriverGetTotalRefuelCost        @"/driver/order/getTotalRefuelCost"

//司机加油
//#define DriverOrderRefuel               @"/driver/order/refuel"

//司机加油列表
//#define DriverOrderGetRefuelList        @"/driver/order/getRefuelList"

//版本
#define UserGetVersion                  @"/user/getVersion"

//司机打卡
//#define DriverOrderClockIn              @"/driver/order/clockIn"

//司机评价
//#define DriverOrderReview               @"/driver/order/review"

//司机上传图片（加油/开始出车/结束出车）
//#define DriverOrderHandleFile           @"/driver/order/handleFile"

//获取加油余额
//#define DriverOrderBackDate             @"/driver/order/backDate"










#endif /* WorldPathConfigure_h */
