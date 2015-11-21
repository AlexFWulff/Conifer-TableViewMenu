//
//  TableViewMenu.m
//  ConiferTableViewMenu
//
//  Created by Alex Wulff on 11/20/15.
//  Copyright © 2015 Conifer Apps. All rights reserved.
//

#import "TableViewMenu.h"

@implementation TableViewMenu

-(void)openTableView: (UITableView *)tableView withOptions:(NSMutableArray *)options withDuration:(float)duration {
    
    //x,y,w,h - set center and initial size (measures from top left corner of view)
    tableView.frame = CGRectMake(self.tableViewSuperView.frame.size.width/2, self.tableViewSuperView.frame.size.height/2, 10, 10);
    
    tableView.backgroundColor = [UIColor redColor];
    
    tableView.hidden = false;
    
    [self.tableViewSuperView addSubview:tableView];
        
    [UIView animateWithDuration:duration animations:^{
        tableView.frame = CGRectMake(0, 0, self.tableViewSuperView.frame.size.width, self.tableViewSuperView.frame.size.height);
    }];

}

@end
