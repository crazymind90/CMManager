//
//  NSTableView.m
//  @CrazyMind90
//
//  Created by CrazyMind90 on 23/09/2020.
//  Copyright © 2020 Seacher. All rights reserved.
//

#import <Foundation/Foundation.h>


#define RGBA(r,g,b,a) [NSColor colorWithCalibratedRed:r/255.f green:g/255.f blue:b/255.f alpha:a/255.f]

#define NSColorFromHex(rgbValue) [NSColor colorWithCalibratedRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



-(void) StartTable {
    
    [self InitTableViewWithObjects:@[@"ABC",@"DEF",@"GHi",@"JKL",@"MNO",@"PQR",@"STU",@"VWX",@"Y&Z"] Frame:NSScreen.mainScreen.frame BackgroundColor:NSColor.darkGrayColor SeparatorColor:NSColor.whiteColor InView:self.view delegate:self];
    
}




NSTableView *TableView;
NSArray *MutArray;


-(NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    
    return MutArray.count;
}

 
 

- (void)tableViewClicked:(id)sender {
 
    NSLog(@"tableView.clickedRow = %@", MutArray[TableView.clickedRow]);

    [self performSelector:@selector(Reloader) withObject:nil afterDelay:0.1f];
}
 

-(void) Reloader {
    
    [TableView reloadData];
}

 


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
   

    NSTextField *TextField = [[NSTextField alloc] init];
    
    TextField.identifier = [tableView identifier];
    
    TextField.stringValue = MutArray[row];
    
    TextField.backgroundColor = NSColorFromHex(0x202020);
    
    TextField.editable = NO;
        
    TextField.alignment = NSTextAlignmentCenter;
    
    
    return TextField;
    
}




- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    
    return 38;
}





-(NSTableView *_Nullable) InitTableViewWithObjects:(NSArray *_Nullable)Objects Frame:(CGRect)Frame BackgroundColor:(NSColor *_Nullable)BGColor SeparatorColor:(NSColor *_Nullable)SepColor InView:(NSView *_Nullable)InView delegate:(id _Nullable )delegate {
    
    
        MutArray = Objects;

        TableView = [[NSTableView alloc] initWithFrame:Frame];

        NSScrollView * tableContainer = [[NSScrollView alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)];


        NSTableColumn * column = [[NSTableColumn alloc] initWithIdentifier:@"Col1"];

        [column setWidth:self.view.frame.size.width];


        [column.headerCell setTitle:@"Header Title"];

        [TableView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [TableView addTableColumn:column];
        [TableView setDelegate:delegate];
        [TableView setDataSource:delegate];
        TableView.backgroundColor = BGColor;

        TableView.target = self;
        TableView.action = @selector(tableViewClicked:);

        [TableView reloadData];

        [tableContainer setDocumentView:TableView];
        [tableContainer setHasVerticalScroller:YES];
    
        [InView addSubview:tableContainer];

        return TableView;

}




