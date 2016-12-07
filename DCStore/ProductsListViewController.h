//
//  ProductsListViewController.h
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Moltin/Moltin.h>
#import "ProductsCollectionViewCell.h"
#import "ProductsModel.h"
#import "MFSideMenu.h"


@interface ProductsListViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic) UICollectionView *collectionView;
- (instancetype)initWithCategoryId:(NSString *) catId;
@property (strong, nonatomic) NSArray *propArray;

@end
