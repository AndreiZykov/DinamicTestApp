//
//  ViewController.h
//  DynamicTableTest
//
//  Created by Max Soiferman on 12.02.16.
//  Copyright © 2016 Max Soiferman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView * tableView;


@end

