//
//  CartViewController.h
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartTableViewCell.h"

@interface CartViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end
