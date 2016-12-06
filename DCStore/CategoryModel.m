//
//  CategoryModel.m
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (NSArray *)getCategories {
    
    __weak CategoryModel *weakSelf = self;
    _categoriesArray = [[NSMutableArray alloc] init];
    
    [[Moltin sharedInstance].category listingWithParameters:@{}
                                                    success:^(NSDictionary *response) {
                                                        
                                                        NSArray *categories = [response objectForKey:@"result"];
                                                        weakSelf.categoriesArray = categories;
                                                        
                                                        
    
                                                    } failure:^(NSDictionary *response, NSError *error) {
                                                        
                                                        
                                                    }];
    
    return self.categoriesArray;
    
}

-(void)getAllCategories:(void (^)(NSArray *))parsingFinished {
    
    [[Moltin sharedInstance].category listingWithParameters:@{}
                                                    success:^(NSDictionary *response) {
                                                        
                                                        NSArray *categories = [response objectForKey:@"result"];
                                                        parsingFinished([categories copy]);
                                                        
                                                        
                                                    } failure:^(NSDictionary *response, NSError *error) {
                                                        
                                                        
                                                    }];

    
}
@end
