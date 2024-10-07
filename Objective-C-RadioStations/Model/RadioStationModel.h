//
//  RadioStationModel.h
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RadioStationModel : NSObject
@property NSString *station_id;
@property NSString *title;
@property NSString *descriptionRadio;
@property NSString *logo;
@property NSString *streaming_url;
@property NSString *status;
@property NSString *updated;
@property NSString *ordering;
@end

NS_ASSUME_NONNULL_END
