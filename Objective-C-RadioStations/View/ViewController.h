//
//  ViewController.h
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
#import "Services.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property ViewModel *viewModel;
@property NSMutableArray *dictionary;
@property (weak, nonatomic) IBOutlet UITableView *taableView;
- (UIImage *)resizeImage:(UIImage *)image;
@end

