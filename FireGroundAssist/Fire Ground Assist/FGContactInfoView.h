//
//  FGContactInfoView.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGSideInfoView.h"
#import "FGContactView.h"
#import <QuartzCore/QuartzCore.h>

@interface FGContactInfoView : FGSideInfoView

@property (retain, nonatomic) UIScrollView* contactsScrollArea;

@property (retain, nonatomic) FGContactView* contactTwo;

@end
