//
//  TableViewMenu.h
//  ConiferTableViewMenu
//
//  Created by Alex Wulff on 11/20/15.
//  Copyright © 2015 Conifer Apps. All rights reserved.
//

//************(Possible Additions***********
//Option to allow user-closable before selection
//Support both default tableview which is initialized in the class, and a user-created one
//Set duration by user

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewMenu : NSObject

@property (strong, nonatomic) UIView *tableViewSuperView;

//Add this as block method for callback
-(void)openTableView: (UITableView *)tableView withOptions:(NSMutableArray *)options withDuration:(float)duration;


@end
