//
//  AppDelegate.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "AppDelegate.h"
#import "SwipableViewController.h"
#import "HPFlowLayout.h"
#import "HPConfig.h"

#import "HPAllViewController.h"
#import "HPBigChestViewController.h"
#import "HPSmallBottomViewController.h"
#import "HPCharmingLegViewController.h"
#import "HPBlackStockingViewController.h"

@interface AppDelegate ()
{
    HPAllViewController           *hpAllcvc;
    HPBigChestViewController      *hpBigcvc;
    HPSmallBottomViewController   *hpSmallBottomcvc;
    
    HPCharmingLegViewController   *hpCharmingLegcvc;
    HPBlackStockingViewController *hpBlackStockingcvc;
}

@property (nonatomic, strong) UINavigationController *naviController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Set Network
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [YTKNetworkConfig sharedInstance].baseUrl = BaseURL;
    
    //Set UserAgent
    NSDictionary *userAgent = @{@"UserAgent": @"Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 Safari/600.1.4"};
    [[NSUserDefaults standardUserDefaults] registerDefaults:userAgent];
    
    
    hpAllcvc            = [[HPAllViewController alloc] init];
    hpBigcvc            = [[HPBigChestViewController alloc] init];
    hpSmallBottomcvc    = [[HPSmallBottomViewController alloc] init];
    hpCharmingLegcvc    = [[HPCharmingLegViewController alloc] init];
    hpBlackStockingcvc  = [[HPBlackStockingViewController alloc] init];
    
    SwipableViewController *svc = [[SwipableViewController alloc] initWithTitle:@"HostGirls"
                                                                   andSubTitles:@[@"所有", @"大胸", @"翘臀", @"美腿", @"黑丝"]
                                                                 andControllers:@[hpAllcvc, hpBigcvc, hpSmallBottomcvc, hpCharmingLegcvc, hpBlackStockingcvc]];
    
    _naviController = [[UINavigationController alloc] initWithRootViewController:svc];
    self.window.rootViewController = _naviController;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
