//
//  FGBuilding.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGBuilding.h"

@implementation FGBuilding

@synthesize buildingName;
@synthesize address;
@synthesize accessInfo;
@synthesize constructionInfo;
@synthesize protectionInfo;

- (FGBuilding*) initWithJSONData: (NSDictionary *)data
{
    self = [super init];
    
    if(self) {
        self.buildingName = [data objectForKey:@"name"];
        NSLog(@"%@", self.buildingName);
        self.address = [data objectForKey:@"address"];
        NSLog(@"%@", self.address);
        self.accessInfo = [self parseArrayForDictionary: [data objectForKey:@"access info"]];
        NSLog(@"%@", [self.accessInfo description]);
        self.constructionInfo = [self parseArrayForDictionary: [data objectForKey:@"construction info"]];
        self.protectionInfo = [self parseArrayForDictionary: [data objectForKey:@"protection info"]];
    }
    return self;
    
}

- (NSDictionary*) parseArrayForDictionary: (NSArray*)data
{
    NSDictionary* result = [[NSDictionary alloc] init];
    for (NSString *a in data) {
        NSArray *components = [a componentsSeparatedByString:@"=="];
        NSString *paramter = [components objectAtIndex:0];
        NSString *value = [components objectAtIndex:1];
        [result setValue: value forKey:paramter];
    }
    return result;
}

- (void)dealloc {
    [buildingName release];
    [address release];
    [accessInfo release];
    [constructionInfo release];
    [super dealloc];
}
@end


