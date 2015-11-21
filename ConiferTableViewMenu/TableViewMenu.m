//
//  TableViewMenu.m
//  ConiferTableViewMenu
//
//  Created by Alex Wulff on 11/20/15.
//  Copyright © 2015 Conifer Apps. All rights reserved.
//

#import "TableViewMenu.h"

@implementation TableViewMenu

-(void)openTableViewWithOptions:(NSMutableArray *)options withDuration:(float)duration superView:(UIView *)superView completion:(void(^)(int indexOfSelection))handler {
    
    //Initialize Class Properties (Private)
    self.tableViewSuperView = superView;
    self.completionHandler = [handler copy];
    self.duration = duration;
    self.tableView = [[UITableView alloc] init];
    self.tableViewData = [[NSMutableArray alloc] init];
    self.tableViewData = options;
    
    //Set tableView delegate and DataSource
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //Initialize tableView user interface (blurred backgorund and insets for status bar). Customize the tableview here if desired
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = self.tableView.bounds;
    blurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = blurView;
    [self.tableView setContentInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    
    //x,y,w,h - set center and initial size (measures from top left corner of view)
    self.tableView.frame = CGRectMake(self.tableViewSuperView.frame.size.width/2, self.tableViewSuperView.frame.size.height/2, 10, 10);
    
    //Finally add the tableView
    [self.tableViewSuperView addSubview:self.tableView];
    
    //Not sure why this needs to be done (calling the reload method doesn't work?)
    float timerTime = 30000000000000;
    
    NSTimer *timer = [[NSTimer alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:timerTime
                                     target:self
                                   selector:@selector(forTimerReload)
                                   userInfo:nil
                                    repeats:NO];
    
    [UIView animateWithDuration:duration animations:^{
        self.tableView.frame = CGRectMake(0, 0, self.tableViewSuperView.frame.size.width, self.tableViewSuperView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];

}

-(void)hideTableView {
    
    [UIView animateWithDuration:self.duration animations:^{
        //Set frame to 0 width and 0 height
        self.tableView.frame = CGRectMake(self.tableViewSuperView.frame.size.width/2, self.tableViewSuperView.frame.size.height/2, 0, 0);
    } completion:^(BOOL finished) {
        //Clean up the view
        [self.tableView removeFromSuperview];
        self.tableView = nil;
    }];
}

-(void)forTimerReload {
    [self.tableView reloadData];
}

//TableView delegate and data source methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int indexOfSelection = (int)indexPath.row;
    
    //Send data back to the completion block
    self.completionHandler(indexOfSelection);
    
    [self hideTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableViewData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text = [self.tableViewData objectAtIndex:indexPath.row];
    return cell;
}
@end
