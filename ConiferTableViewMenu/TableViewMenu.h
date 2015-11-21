//
//  TableViewMenu.h
//  ConiferTableViewMenu
//
//  Created by Alex Wulff on 11/20/15.
//  Copyright © 2015 Conifer Apps. All rights reserved.
//

//************(Possible Additions)***********
//Option to allow user-closable before selection
//Support both default tableview which is initialized in the class, and a user-created one
//Set duration by user
//Check validity of options data (if it is nsstring)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewMenu : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIView *tableViewSuperView;

//This property should be private
@property (strong, nonatomic) NSMutableArray *tableViewData;
@property (strong, nonatomic) UITableView *tableView;
@property (copy) void (^completionHandler)(int indexOfSelection);
@property (nonatomic) float duration;

/**
 * Opens a UITableView for use as a menu with provided menu items
 * @author Alex Wulff
 *
 * @param options Takes an NSMutableArray of NSStrings to be displayed to the user
 * @param duration The duration of the grow in and shrink out animations
 * @param superView The view in which to display the tableview menu (try passing self.view)
 * @param completion A completion block that passes the index of the selected item in the passed options array (starts at 0)
 */
-(void)openTableViewWithOptions:(NSMutableArray *)options withDuration:(float)duration superView:(UIView *)superView completion:(void(^)(int indexOfSelection))handler;

@end
