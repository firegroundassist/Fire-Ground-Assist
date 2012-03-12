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


- (id) initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self){
		titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, 20)];
		titleLabel.backgroundColor = [UIColor grayColor];
		titleLabel.textAlignment = UITextAlignmentCenter;
		
		[self addSubview:titleLabel];
		
	}
	return self;
}

- (void) dealloc
{
	[titleLabel release];
	[super dealloc];
}
	
- (void) clearData
{
	
}

- (void) updateData:(NSDictionary *)data
{
	
}
@end
