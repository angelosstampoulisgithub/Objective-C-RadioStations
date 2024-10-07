//
//  ViewModel.h
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import <Foundation/Foundation.h>
#import "Services.h"
#import "RadioStationModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
typedef void (^Completion)(NSMutableArray *dict);
@property Services *services;
-(void) makeRequest:(Completion) blockCompletion;
@end

NS_ASSUME_NONNULL_END
