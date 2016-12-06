//
//  ViewController.m
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[Moltin sharedInstance].product listingWithParameters:@{}
                                                   success:^(NSDictionary *response) {
                                                       NSArray *products = [response objectForKey:@"result"];
                                                       //NSLog(@"Got products: %@", products);
                                                       
                                                       //NSDictionary *product = [products firstObject];
                                                       //NSLog(@"Our chosen product is: %@", product);
                                                       
                                                   } failure:^(NSDictionary *response, NSError *error) {
                                                       //NSLog(@"Something went wrong: %@", error);
                                                   }];
    
    
    [[Moltin sharedInstance].category listingWithParameters:@{}
                                                    success:^(NSDictionary *response) {
        
                                                        NSArray *products = [response objectForKey:@"result"];
                                                        
                                                        NSDictionary *product = [products firstObject];
                                                        NSLog(@"%@", [product objectForKey:@"description"]);
                                                    
                                                    }
                                                    failure:^(NSDictionary *response, NSError *error) {
        
        
    }];
    
    
}


- (void)setUpViews {
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
