//
//  ProductsModel.h
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Moltin/Moltin.h>


@interface ProductsModel : NSObject

- (void)getAllProductsWithCategoryId:(NSString *) catId :(void (^)(NSArray*))parsingFinished;

@end
