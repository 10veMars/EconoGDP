//
//  CategoryModel.h
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Moltin/Moltin.h>


@interface CategoryModel : NSObject

@property (nonatomic, strong) NSMutableArray *categoriesArray;

- (NSArray *)getCategories;

- (void)getAllCategories:(void (^)(NSArray*))parsingFinished;


@end
