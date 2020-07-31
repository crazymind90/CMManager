

UITableView *TableView;
NSMutableArray *MutArray;
UIColor *CellBGColor;
 
 
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
 
    Cell.backgroundColor = UIColorFromHEX(0x555555);
        
    Cell.imageView.image = [UIImage imageNamed:@"sys"];
  
    Cell.textLabel.text = MutArray[indexPath.row];
 

    return Cell;
}

-(UITableView *_Nullable) InitTableViewWithObjects:(NSArray *_Nullable)Objects Frame:(CGRect)Frame BackgroundColor:(UIColor *_Nullable)BGColor SeparatorColor:(UIColor *_Nullable)SepColor InView:(UIView *_Nullable)InView delegate:(id _Nullable )delegate {
    
       MutArray = [[NSMutableArray alloc] initWithObjects:@"FF",@"RR", nil];

       TableView = [[UITableView alloc] initWithFrame:Frame];
       
       TableView.backgroundColor = BGColor;
       TableView.separatorColor = SepColor;
       TableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
       TableView.delegate = delegate;
       TableView.dataSource = delegate;
 
       [InView addSubview:TableView];
    
 
    return TableView;
    
}





-(void) StartTableView {
 
    [self InitTableViewWithObjects:@[@"GG",@"KK"] Frame:[UIScreen mainScreen].bounds BackgroundColor:UIColorFromHEX(0x303030) SeparatorColor:UIColorFromHEX(0x303030) InView:self.view delegate:self];
    
    }
    
