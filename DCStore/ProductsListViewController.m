//
//  ProductsListViewController.m
//  DCStore
//
//  Created by Eli MArshall on 12/6/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "ProductsListViewController.h"

@interface ProductsListViewController ()

@end

@implementation ProductsListViewController

static NSString * const cellReuseIdentifier = @"cell";

-(instancetype)initWithCategoryId:(NSString *)catId {
    self = [super init];
    if (self) {
        

        
        __weak ProductsListViewController *weakSelf = self;
        
        self.propArray = [[NSArray alloc]init];
        ProductsModel *prodModel = [[ProductsModel alloc] init];
        [prodModel getAllProductsWithCategoryId:catId :^(NSArray *parsedData) {
            if (parsedData) {
                
                weakSelf.propArray = parsedData;
                [self.collectionView reloadData];
                
            }
        }];
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [self rightMenuBarButtonItem];
    [self.menuContainerViewController.shadow setEnabled:NO];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ProductsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellReuseIdentifier];
    [self.view addSubview:self.collectionView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
}

- (UIBarButtonItem *)rightMenuBarButtonItem {
    return [[UIBarButtonItem alloc] initWithTitle:@"Cart" style:UIBarButtonItemStylePlain target:self action:@selector(rightSideMenuButtonPressed:)];
}

- (void)rightSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleRightSideMenuCompletion:^{
        //[self setupMenuBarButtonItems];
    }];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return self.propArray.count;
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    ProductsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
   
    NSDictionary *dict = [self.propArray objectAtIndex:indexPath.row];
    //NSLog(@"%@", [dict objectForKey:@"title"]);
    NSString *title = [dict objectForKey:@"title"];
    NSString *price = [dict valueForKeyPath:@"price.value"];
   // NSLog(@"%@", price);
    NSArray *imageArr = [dict objectForKey:@"images"];
    NSDictionary *imageDict;
    
    if (imageArr) {
        
        imageDict = [[dict objectForKey:@"images"] objectAtIndex:0];
    }
    
    NSString *imgUrl = [imageDict valueForKeyPath:@"url.https"];
    NSLog(@"%@", imgUrl);
    
    if (title && price) {
        if (imgUrl) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                NSURL *url = [NSURL URLWithString:imgUrl];
                NSData *data = [NSData dataWithContentsOfURL : url];
                UIImage *image = [UIImage imageWithData: data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.imageView.image = image;
                        cell.nameLabel.text = title;
                        cell.priceLabel.text = price;
                    });
                }
            });
        }
        
    }
    
    return cell;
 
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.view.frame.size.width / 2 - 5, 300);
    
}




@end
