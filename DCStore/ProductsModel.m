//
//  ProductsModel.m
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "ProductsModel.h"

@implementation ProductsModel

-(void)getAllProductsWithCategoryId:(NSString *)catId :(void (^)(NSArray *))parsingFinished {
    
    [[Moltin sharedInstance].product listingWithParameters:@{@"category" : catId
                                                             } success:^(NSDictionary *response) {
                                                                 NSArray *products =[response objectForKey:@"result"];
                                                                 parsingFinished([products copy]);
                                                                 for (NSDictionary *product in products) {
                                                                     NSLog(@"%@", [product objectForKey:@"description"]);
                                                                 }
                                                                 
                                                                 
                                                             } failure:^(NSDictionary *response, NSError *error) {
                                                                 
                                                                 
                                                             }];
}

@end
