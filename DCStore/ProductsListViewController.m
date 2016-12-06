//
//  ProductsListViewController.m
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "ProductsListViewController.h"

@interface ProductsListViewController ()

@end

@implementation ProductsListViewController
-(instancetype)initWithCategoryId:(NSString *)catId {
    self = [super init];
    if (self) {
        
        //NSLog(@"INIT ID: %@", catId);
        [self loadProductsWithCategoryId:catId];
        
    }
    return self;
}

- (void)loadProductsWithCategoryId:(NSString *)catId {
    
    [[Moltin sharedInstance].product listingWithParameters:@{@"category" : catId
                                                             } success:^(NSDictionary *response) {
                                                                 
                                                                 NSLog(@"%@", response);
                                                                 
                                                             } failure:^(NSDictionary *response, NSError *error) {
                                                                 
                                                                 
                                                             }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
