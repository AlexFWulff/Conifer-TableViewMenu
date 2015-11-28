# UITableView Menu

This class provides a simple, objective-c method for displaying an interactive menu on iOS devices. It features a very nice grow and shrink animation, as well as a dead-simple callback-based structure with one method.

![](https://i.imgflip.com/uvqjo.gif)

Implementation
--------------
1. First, import the class files `#import "TableViewMenu.h"`

2. Next, create an instance of the TableViewMenu class: `    TableViewMenu *menu = [[TableViewMenu alloc] init];`

3. Initialize an array of options to present to the user: `NSMutableArray *options = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four", nil];`

4. Lastly, just call this method in an action or in the event of some other user-interaction:
````
[menu openTableViewWithOptions:options withDuration:0.5 superView:self.view completion:^(int indexOfSelection) {
        //Do something will the selected index
        NSLog(@"Selected: %@",[options objectAtIndex:indexOfSelection]);
    }];
````

<b>Superview</b> is the view in which the TableView should be displayed. Anything other than the main root view has not been tested at the moment. <b>Duration</b> is how long the animation should last. Here's the code in full:

````
TableViewMenu *menu = [[TableViewMenu alloc] init];

NSMutableArray *options = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four", nil];

[menu openTableViewWithOptions:options withDuration:0.5 superView:self.view completion:^(int indexOfSelection) {
    NSLog(@"%@",[options objectAtIndex:indexOfSelection]);
}];

````

Customizability
---------------
UITableView Menu supports extensive customizability. In the implementation file of the class, you can find the following comment: `//Initialize tableView user interface (blurred backgorund and insets for status bar). Customize the tableview here if desired`. After this comment the TableView is created, and you can edit some of the default code to customize the UITableView however you desire. You can also customize the TableView cells in the delegate methods, like we did to get white text in the promo video.
