//
//  FGAccessInfoView.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGSideInfoView : UIView {
	
}

@property (retain, nonatomic) UILabel* titleLabel;

- (void) clearData;
- (void) updateData: (NSDictionary*) data; 

@end
