//
//  DataCenter.m
//  Muppin_ContentTableView
//
//  Created by Hanson Jung on 2017. 3. 14..
//  Copyright © 2017년 waaoo. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance {
    
    static DataCenter *dataCenter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
    });
    
    return dataCenter;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setData];
    }
    return self;
}


- (void)setData {
    self.dataArray = @[@{@"photo":@"deadpool", @"context":@"가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아가나다라마바사아"},
                       @{@"photo":@"deadpool", @"context":@""},
                       @{@"photo":@"", @"context":@"가나다라마바사아가나다라마바사가나다라마바사아가나다라마바사"}];
}

@end
