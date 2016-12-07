//
//  NavigationController.m
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor colorWithHex:@"#6FB98F"];
    self.navigationBar.titleTextAttributes = @{
                                               NSForegroundColorAttributeName :[UIColor whiteColor],
                                               NSFontAttributeName :[UIFont fontWithName:@"Avenir-Book" size:17]
                                               };

    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName :[UIColor whiteColor],
                                            NSFontAttributeName :[UIFont fontWithName:@"Avenir-Book" size:7]
                                                                     }forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName :[UIColor whiteColor],
                                                           NSFontAttributeName :[UIFont fontWithName:@"Avenir-Book" size:17]
                                                           } forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
