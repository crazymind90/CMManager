#import "TableController.h"
#import "CMManager.h"

@interface TableController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    [self StartTable];
    [self Navigation];
    

}


-(void) StartTable {
    
        [self InitTableViewWithObjects:@[@"ABC",@"DEF",@"GHi",@"JKL",@"MNO",@"PQR",@"STU",@"VWX",@"Y&Z"] Frame:[UIScreen mainScreen].bounds BackgroundColor:UIColorFromHEX(0x202020) SeparatorColor:UIColorFromHEX(0x505050) InView:self.view delegate:self];
}

-(void) Navigation {
    
    self.navigationItem.title = @"Main.TableView";
    UIBarButtonItem *Dismiss = [[UIBarButtonItem alloc] initWithTitle:@"Options" style:UIBarButtonItemStylePlain target:self action:@selector(Options)];
    self.navigationItem.leftBarButtonItem = Dismiss;
    [self.navigationController.navigationBar setBarTintColor:UIColorFromHEX(0x010101)];
}


-(void) Options {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


UITableView *TableView;
NSArray *MutArray;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
 
    return MutArray.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   NSIndexPath *Path = TableView.indexPathForSelectedRow;
   NSString *SelectedRow = MutArray[Path.row];
    
    NSLog(@"%@",SelectedRow);
    
    [self performSelector:@selector(Reloader) withObject:nil afterDelay:0.1f];

 }

-(void) Reloader {
    
        [TableView reloadData];
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellID = @"Cell";

    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (Cell == nil)
    Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
 
    Cell.backgroundColor = UIColorFromHEX(0x323232);
        
    Cell.imageView.image = [UIImage imageNamed:@"sys"];
  
    Cell.textLabel.text = MutArray[indexPath.row];
    
    
    
    
    
    // To Add icon on specific cell
    
    /*
    
    if ([Cell.textLabel.text isEqual:@"ABC"])
        Cell.imageView.image = [UIImage imageNamed:@"safe"];
    
    if ([Cell.textLabel.text isEqual:@"DEF"])
    Cell.imageView.image = [UIImage imageNamed:@"res"];
     
    */
    
    
    
    
    
    // To Add switch on specific cell
    
    /*
     
    if ([Cell.textLabel.text isEqual:@"DEF"]) {
        
     UISwitch *Switch = [CMManager InitSwitchWithFrame:CGRectNull Action:@selector(SwitchState) InView:Cell Target:self];
        
     Cell.accessoryView = Switch;
     Cell.selectionStyle = UITableViewCellSelectionStyleNone;
     
    }
     
     
     // SwitchState method
     
     BOOL isON = NO;
     -(void) SwitchState {
         
         if (!isON) {

         NSLog(@"ON");
         isON = YES;
         } else {

         NSLog(@"OFF");
         isON = NO;
         }
        
     }
     
     */

    return Cell;
}






- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

return 53;
    
}


-(UITableView *_Nullable) InitTableViewWithObjects:(NSArray *_Nullable)Objects Frame:(CGRect)Frame BackgroundColor:(UIColor *_Nullable)BGColor SeparatorColor:(UIColor *_Nullable)SepColor InView:(UIView *_Nullable)InView delegate:(id _Nullable )delegate {
    
       MutArray = Objects;

        if (@available(iOS 13.0, *)) {
        TableView = [[UITableView alloc] initWithFrame:Frame style:UITableViewStyleInsetGrouped];
        } else {
        TableView = [[UITableView alloc] initWithFrame:Frame style:UITableViewStyleGrouped];
        }

        TableView.backgroundColor = BGColor;
        TableView.separatorColor = SepColor;
        TableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        TableView.delegate = delegate;
        TableView.dataSource = delegate;

        [InView addSubview:TableView];

 
    return TableView;
    
}



 

@end

