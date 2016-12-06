//
//  CategoriesViewController.m
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import "CategoriesViewController.h"

@interface CategoriesViewController ()



@end

@implementation CategoriesViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.title = @"Categories";
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:22/255.0
                                                          green:160/255.0
                                                           blue:133/255.0
                                                          alpha:1.0];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.catArray = [[NSArray alloc]init];
    
    CategoryModel *catModel = [[CategoryModel alloc] init];
    
    __block NSArray *array;
    __weak CategoriesViewController *weakSelf = self;
    [catModel getAllCategories:^(NSArray * parsedData) {
        if (parsedData) {
            
            array = parsedData;
            
            //NSLog(@"%@", array);
            weakSelf.catArray = parsedData;
            [weakSelf.collectionView reloadData];
            
        } else {
            [weakSelf.collectionView reloadData];
            return;
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return self.catArray.count;
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    if (cell == nil) {
        cell = [[CollectionViewCell alloc]init];
    }
        if (self.catArray) {
        
            NSDictionary *dict = [self.catArray objectAtIndex:indexPath.row];
            NSString *description = [dict objectForKey:@"title"];
            [cell setLabelTextWithString:description];
                        
            NSString *nextURL = [[dict valueForKeyPath:@"images.url.https"]objectAtIndex:0];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                
                NSURL *url = [NSURL URLWithString:nextURL];
                NSData *data = [NSData dataWithContentsOfURL : url];
                UIImage *image = [UIImage imageWithData: data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        cell.imageView.image = image;
                        
                    });
                }
            });
            
        
        } else {
        
            [cell setLabelTextWithString:@"Loading..."];
        }
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.view.frame.size.width, 200);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = [self.catArray objectAtIndex:indexPath.row];
    NSLog(@"%@", [dict objectForKey:@"title"]);
    NSString *title = [dict objectForKey:@"title"];
    NSString *catID = [dict objectForKey:@"id"];
    if (catID) {
        
        ProductsListViewController *productsVC = [[ProductsListViewController alloc]initWithCategoryId:catID];
        [self.navigationController pushViewController:productsVC animated:YES];
        if (title) {
            productsVC.title = title;
        }
    }
    
    
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
