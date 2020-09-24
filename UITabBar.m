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
    
   
    
    CGRect LFrame = CGRectMake(0, SCREEN_HEIGHT/1.1, SCREEN_WIDTH, 50);

    
    UITabBar *TabBar = [[UITabBar alloc] initWithFrame:LFrame];
    
    TabBar.delegate = self;
    
    [self.view addSubview:TabBar];
    
    TabBar.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin);
    
    NSMutableArray *BarItems = [[NSMutableArray alloc] init];

    UITabBarItem *Item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    UITabBarItem *Item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    UITabBarItem *Item3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
    
    // Set image
    UITabBarItem *Item4 = [[UITabBarItem alloc] initWithTitle:@"ABC" image:nil tag:0];
    [Item1 setImage:[[UIImage imageNamed:@"sys"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

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
