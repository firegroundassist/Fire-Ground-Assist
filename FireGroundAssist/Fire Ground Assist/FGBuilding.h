//
//  FGBuilding.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"



@interface FGBuilding : NSObject{
    
    
    // Protection Info
    NSString *sprinklerInfo;
    NSString *fdcLoc;
    NSString *standLoc;
    NSString *standDesc;
    NSString *gasLoc;
    NSString *electLoc;
    NSString *waterLoc;
    
}
@property (retain) NSString* buildingName;
@property (retain) NSString* address;
@property (retain) NSDictionary* accessInfo; 
@property (retain) NSDictionary* constructionInfo;
@property (retain) NSDictionary* protectionInfo; 

- (FGBuilding*) initWithJSONData: (NSDictionary *)data;

- (NSDictionary*) parseArrayForDictionary: (NSArray*)data; 



@end

