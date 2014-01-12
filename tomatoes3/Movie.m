//
//  Movie.m
//  tomatoes3
//
//  Created by Priyanka Bhalerao on 1/11/14.
//  Copyright (c) 2014 iOSClass. All rights reserved.
//

#import "Movie.h"

@implementation Movie
- (id) initWithDictionary: (NSDictionary *) dictionary{
    self = [super init];
    if(self){
        //Assigning the title
        
        self.title = [dictionary objectForKey:@"title"];
        
        //Assigning the cast
        NSMutableArray* actors = [NSMutableArray array];
        NSArray *castarray = [dictionary objectForKey:@"abridged_cast"];
        for (int i =0 ; i < castarray.count; i ++){
            NSDictionary* cast = [castarray objectAtIndex:i];
            NSString* character = [cast objectForKey:@"name"];
            //NSLog(@"%@",character);
            [actors addObject:character];
        }
        self.cast = [actors componentsJoinedByString:@","];
        
        
        //Assigning the poster
        NSDictionary* posters = [dictionary objectForKey:@"posters"];
        NSString* url = [posters objectForKey:@"thumbnail"];
        self.posterUrl = url;
        
        
        //Assigning the summary
        self.summary = [dictionary objectForKey:@"synopsis"];
        NSLog(@"%@ ",self.summary);
        
    }
    return self;
}

@end
