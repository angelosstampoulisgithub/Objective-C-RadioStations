//
//  PlayerViewController.h
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 7/10/24.
//

#import <UIKit/UIKit.h>
#import "RadioStationModel.h"
#import "AVFoundation/AVFoundation.h"
NS_ASSUME_NONNULL_BEGIN

@interface PlayerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
- (IBAction)btnPlay:(id)sender;
@property bool isClicked;
@property RadioStationModel *model;
@property AVPlayer *player;
@property (weak, nonatomic) IBOutlet UILabel *lblRadioStation;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end

NS_ASSUME_NONNULL_END
