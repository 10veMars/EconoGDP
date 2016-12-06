//
//  CollectionViewCell.m
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setLabelTextWithString:(NSString *)text {
    
    self.categoryNameLabel.text = text;
    
}
@end
