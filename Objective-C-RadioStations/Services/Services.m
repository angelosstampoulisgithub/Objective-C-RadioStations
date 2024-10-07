//
//  Services.m
//  Objective-C-RadioStations
//
//  Created by Angelos Staboulis on 6/10/24.
//

#import "Services.h"
#import "RadioStationModel.h"
@implementation Services
- (instancetype)init
{
    self = [super init];
    if (self) {
        _json = [[NSMutableArray alloc] init];
         _model = [[RadioStationModel alloc] init];
    }
    return self;
}
-(void) createRequest:(Completion) blockCompletion {
        NSString  *parameter = @"https://www.3ds.gr/apptest/stations.json";
        NSURL *urlMain = [[NSURL alloc] initWithString:parameter];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlMain];
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self->_json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
            blockCompletion(self->_json);
        }];
        [dataTask resume];

}
@end
