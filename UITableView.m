#import "ViewController.h"
#import "CMManager.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

  

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self StartTable];

    
    // Do any additional setup after loading the view.
}

 
 
-(void) StartTable {
    
    TableView = [self InitTableViewWithObjects:@[@"ABC",@"DEF",@"GHi",@"JKL",@"MNO",@"PQR",@"STU",@"VWX",@"Y&Z"] Frame:CGRectNull BackgroundColor:UIColorFromHEX(0x080808) SeparatorColor:UIColorFromHEX(0x505050) InView:self.view delegate:self];
    
    [TableView setTranslatesAutoresizingMaskIntoConstraints:false];

    [NSLayoutConstraint activateConstraints:@[
        
    [TableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
    [TableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
    [TableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    [TableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    
    ]];
}

 


UITableView *TableView;
NSArray *MutArray;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
 
    return MutArray.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   NSString *SelectedRow = MutArray[indexPath.row];
    
    NSLog(@"%@",SelectedRow);
    
    [self performSelector:@selector(Reloader) withObject:nil afterDelay:0.1f];

 }

-(void) Reloader {
    
        [TableView reloadData];
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellID = @"Cell";

    UITableViewCell *Cell;//= [tableView dequeueReusableCellWithIdentifier:CellID];
    
    //if (Cell == nil)
    Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID];
 
    Cell.backgroundColor = UIColorFromHEX(0x161616);
        
    Cell.imageView.image = [UIImage imageNamed:@"R"];
  
    Cell.textLabel.text = MutArray[indexPath.row];
    
    Cell.textLabel.textColor = UIColorFromHEX(0xFFFFFF);

    Cell.textLabel.numberOfLines = 0;
      
    Cell.detailTextLabel.numberOfLines = 0;

    Cell.imageView.layer.cornerRadius = 10;
    Cell.imageView.clipsToBounds = YES;
    
    CGSize itemSize = CGSizeMake(65, 65);
    
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [Cell.imageView.image drawInRect:imageRect];
    Cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
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
