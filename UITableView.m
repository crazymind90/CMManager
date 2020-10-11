#import "ViewController.h"
#import "CMManager.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

  

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self Navigation];
    [self StartTable];

    
    // Do any additional setup after loading the view.
}

 
UINavigationController *navigations;

-(void) StartTable {
    
    TableView = [self InitTableViewWithObjects:@[@"ABC",@"DEF",@"GHi",@"JKL",@"MNO",@"PQR",@"STU",@"VWX",@"Y&Z"] Frame:CGRectNull BackgroundColor:UIColorFromHEX(0x222222) SeparatorColor:UIColorFromHEX(0x505050) InView:self.view delegate:self];
    
    [TableView setTranslatesAutoresizingMaskIntoConstraints:false];

    [NSLayoutConstraint activateConstraints:@[
        
    [TableView.topAnchor constraintEqualToAnchor:navigations.view.topAnchor constant:navigations.view.bounds.size.height/10.2],
    [TableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
    [TableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    [TableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    
    ]];
}

-(void) Navigation {
    
    
    navigations = [CMManager InitNavigationControllerWithTitle:@"Hola" TitleColor:UIColor.whiteColor RightButtonItem:UIBarButtonSystemItemAdd RightButtonAction:@selector(R) LeftButtonTitle:@"Optioins" LeftButtonAction:@selector(L) ButtonsColor:nil BackgroundColor:UIColorFromHEX(0x121212) Target:self InView:self.view];
    
 
}

-(void) R {
    
    NSLog(@"Add Button tapped");
}

-(void) L {
    
    NSLog(@"Options Button tapped");
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
 
    Cell.backgroundColor = UIColorFromHEX(0x303030);
        
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
