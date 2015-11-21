//
//  ViewController.m
//  ConiferTableViewMenu
//
//  Created by Alex Wulff on 11/20/15.
//  Copyright © 2015 Conifer Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (IBAction)buttonPress:(id)sender {
    
    TableViewMenu *menu = [[TableViewMenu alloc] init];
    menu.tableViewSuperView = self.view;
    
    NSMutableArray *options = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four", nil];
        
    [menu openTableViewWithOptions:options withDuration:0.5 superView:self.view completion:^(int indexOfSelection) {
        NSLog(@"%@",[options objectAtIndex:indexOfSelection]);
    }];
}
@end
