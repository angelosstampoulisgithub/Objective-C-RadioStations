//
//  ViewController.m
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import "ViewController.h"
#import "ViewCell.h"
#import "SDWebImage/SDWebImage.h"
#import "PlayerViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[ViewModel alloc] init];
    _dictionary = [NSMutableArray new];
    [self->_taableView setDelegate:self];
    [self->_taableView setDataSource:self];
    [[self navigationItem] setTitle:@"List Radio Stations"];

}
- (UIImage *)resizeImage:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 95), NO, 0.0);
    
    [image drawInRect:CGRectMake(0, 0, 100, 95)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(void) loadData{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [self->_viewModel makeRequest:^(NSMutableArray * _Nonnull dict) {
        if (self->_dictionary.count>0){
            [self->_dictionary removeAllObjects];
            [self->_dictionary addObjectsFromArray:dict];
            
        }else{
            [self->_dictionary addObjectsFromArray:dict];
        }
        dispatch_group_leave(group);
    }];
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_taableView reloadData];
    });
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self openDetailsViewController:indexPath];
}
-(void) openDetailsViewController:(NSIndexPath*) indexPath{
    RadioStationModel *dict = [self->_dictionary objectAtIndex:indexPath.row];

    UIStoryboard  *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PlayerViewController *player = [storyboard instantiateViewControllerWithIdentifier:@"PlayerViewController"];
    [player setModel:dict];
    [player setModalPresentationStyle:UIModalPresentationFullScreen];
    [[self navigationController] pushViewController:player animated:true];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self->_dictionary count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSMutableDictionary *dict = [self->_dictionary objectAtIndex:indexPath.row];
    [[cell imageView] sd_setImageWithURL:[NSURL URLWithString:[dict valueForKey:@"logo"]]
                 placeholderImage:[UIImage imageNamed:@"oldradio"]];
    UIImage *image = [self resizeImage:cell.imageView.image];
    [[cell imageView] setImage:image];
    [[cell lblRadioStationName] setText:[dict valueForKey:@"title"]];
   
    return cell;
}
@end
