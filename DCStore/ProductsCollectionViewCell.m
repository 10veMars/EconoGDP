//
//  ProductsCollectionViewCell.m
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "ProductsCollectionViewCell.h"

@implementation ProductsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.addToCartButton.layer.cornerRadius = self.addToCartButton.frame.size.width / 2;

}

@end
