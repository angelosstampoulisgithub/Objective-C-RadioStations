//
//  PlayerViewController.m
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 7/10/24.
//

#import "PlayerViewController.h"
#import "AVFoundation/AVFoundation.h"
@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialViewController];

    // Do any additional setup after loading the view.
}
-(void) initialViewController{
    [_btnPlay setBackgroundColor:[UIColor redColor]];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    [_btnPlay setFrame:CGRectMake((bounds.size.width / 2.0)-45, (bounds.size.height / 2.0)+200, 80, 75)];
    [[_btnPlay layer] setCornerRadius:22];
    NSURL *playerURL = [NSURL URLWithString:[_model valueForKey:@"streaming_url"]];
    _player = [[AVPlayer alloc] initWithURL:playerURL];
    [_lblRadioStation setText:[_model valueForKey:@"title"]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPlay:(id)sender {
    _isClicked = !_isClicked;
    if (_isClicked){
        [_player play];
        [_btnPlay setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        [_mainImageView setImage:[UIImage imageNamed:@"onair"]];
    }else{
        [_player pause];
        [_btnPlay setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [_mainImageView setImage:[UIImage imageNamed:@"oldradio"]];
    }
}
@end
