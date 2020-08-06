//
//  UITabBar.m
//  CMManager
//
//  Created by CrazyMind90 on 29/07/2020.
//  Copyright © 2020 ViewsTra. All rights reserved.
//

#import "AppDelegate.h"
#import "CMManager.h"


-(void) StartTabBar {
    
    float FinalResult = 0.0;
    
    if ([CMManager isIPadScreen_Small]) {
      
        NSLog(@"iPad Small Screen Detected");
        FinalResult = SCREEN_HEIGHT - 50;
        
    } else if ([CMManager isIPadScreen_12_9_inch]) {
    
        NSLog(@"iPad 12_9_inch Screen Detected");
        FinalResult = SCREEN_HEIGHT-70;
    
    } else if ([CMManager isIPhonexScreen]) {
        
        NSLog(@"iPhone X Screen");
        FinalResult = SCREEN_HEIGHT-70;
        
    } else if ([CMManager isIPhone8Screen]) {
        
         NSLog(@"iPhone 8 Screen");
        FinalResult = SCREEN_HEIGHT-49;
        
    }
        
    
    CGRect LFrame = CGRectMake(0, FinalResult, SCREEN_WIDTH, 50);

    
    UITabBar *TabBar = [[UITabBar alloc] initWithFrame:LFrame];
    
    TabBar.delegate = self;
    
    [self.view addSubview:TabBar];
    
    TabBar.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    
    NSMutableArray *BarItems = [[NSMutableArray alloc] init];

    UITabBarItem *Item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    UITabBarItem *Item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    UITabBarItem *Item3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
//  UITabBarItem *Item4 = [[UITabBarItem alloc] initWithTitle:@"ABC" image:[UIImage imageNamed:@"/var/abc.png"] tag:0];

    [BarItems addObject:Item1];
    [BarItems addObject:Item2];
    [BarItems addObject:Item3];

    TabBar.items = BarItems;
    TabBar.selectedItem = [BarItems objectAtIndex:0];
    
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger SelectedTab = tabBar.selectedItem.tag;
    NSLog(@"%lu",SelectedTab);
    
}
