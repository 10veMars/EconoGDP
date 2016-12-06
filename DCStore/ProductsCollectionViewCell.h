//
//  ProductsCollectionViewCell.h
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
