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
    
    
    
}
@property (copy, nonatomic) NSString* buildingName;
@property (copy, nonatomic) NSString* address;
@property (copy, nonatomic) NSDictionary* accessInfo; 
@property (copy, nonatomic) NSDictionary* constructionInfo;
@property (copy, nonatomic) NSDictionary* protectionInfo; 

- (FGBuilding*) initWithJSONData: (NSDictionary *)data;

- (NSDictionary*) parseArrayForDictionary: (NSArray*)data; 



@end

