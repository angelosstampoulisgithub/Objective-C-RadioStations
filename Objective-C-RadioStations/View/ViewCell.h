//
//  ViewCell.h
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 7/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblRadioStationName;

@end

NS_ASSUME_NONNULL_END
