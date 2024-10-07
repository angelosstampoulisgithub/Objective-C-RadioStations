//
//  ViewModel.m
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import "ViewModel.h"

@implementation ViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _services = [[Services alloc] init];
    }
    return self;
}
- (void)makeRequest:(Completion)blockCompletion{
    [_services createRequest:^(NSMutableArray * _Nonnull dict) {
        blockCompletion(dict);
    }];
    
}
@end
