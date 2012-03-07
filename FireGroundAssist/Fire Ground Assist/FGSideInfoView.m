//
//  FGSideInfoView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGSideInfoView.h"

@implementation FGSideInfoView

@synthesize titleLabel;
@synthesize dataLabelOne;
@synthesize dataTextOne;

- (id) initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self){
		titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
		titleLabel.backgroundColor = [UIColor greenColor];
		[self addSubview:titleLabel];
		
		dataLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 80, 20)];
		dataLabelOne.backgroundColor = [UIColor blueColor];
		[self addSubview:dataLabelOne];
		
		dataTextOne = [[UITextField alloc] initWithFrame:CGRectMake(100, 30, 80, 20)];
		dataTextOne.backgroundColor = [UIColor blueColor];
		[self addSubview:dataTextOne];
		
	}
	return self;
}

- (void) dealloc
{
	[titleLabel release];
	[dataLabelOne release];
	[dataTextOne release];
	[super dealloc];
}
						  
@end
