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
		titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_blue.png"]]; 
		
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

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
@end
