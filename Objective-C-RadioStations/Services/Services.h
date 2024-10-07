//
//  Services.h
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import <Foundation/Foundation.h>
#import "RadioStationModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface Services : NSObject
typedef void (^Completion)(NSMutableArray *dict);
-(void) createRequest:(Completion) blockCompletion;
@property NSMutableArray *json;
@property RadioStationModel *model;

@end

NS_ASSUME_NONNULL_END
