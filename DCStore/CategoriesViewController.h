//
//  CategoriesViewController.h
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import <Moltin/Moltin.h>
#import "CategoryModel.h"
#import "ProductsListViewController.h"


@interface CategoriesViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *catArray;


@end
