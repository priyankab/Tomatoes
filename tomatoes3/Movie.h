//
//  Movie.h
//  tomatoes3
//
//  Created by Priyanka Bhalerao on 1/11/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *cast;
@property (strong,nonatomic) NSString *posterUrl;
@property (strong, nonatomic) NSString *summary;
- (id) initWithDictionary: (NSDictionary *) dictionary;

@end
