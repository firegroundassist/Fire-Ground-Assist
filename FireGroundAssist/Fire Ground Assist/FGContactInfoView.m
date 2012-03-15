//
//  FGContactInfoView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGContactInfoView.h"

@implementation FGContactInfoView

@synthesize contactsScrollArea;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		super.titleLabel.text = @"Contact Info";
		
		FGContactView* contactOne = [[FGContactView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-20, 50)];
		contactOne.tag = 1111;
		contactOne.position.text = @"Contact One";
		[self addSubview:contactOne];
		
//		contactsScrollArea = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 40, self.frame.size.width-20, self.frame.size.height-50)];
//		contactsScrollArea.backgroundColor = [UIColor whiteColor];
//		
//		NSInteger contentHeight = 60;
//		UIView* contactsHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contactsScrollArea.frame.size.width, contentHeight)];
//		
//		FGContactView* contactOne = [[FGContactView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-20, 50)];
//		contactOne.tag = 1111;
//		contactOne.position.text = @"Contact One";
//		[contactsHolder addSubview:contactOne];
//
//		for (int i=60; i<600; i+=60) {
//			FGContactView* contact = [[FGContactView alloc] initWithFrame:CGRectMake(0, i, self.frame.size.width-20, 50)];
//			[contactsHolder addSubview:contact];
//			contentHeight += 60;
//		}
//		
//		contactsHolder.frame = CGRectMake(0, 0, contactsScrollArea.frame.size.width, contentHeight);
//		contactsHolder.backgroundColor = [UIColor blueColor];
//		contactsHolder.tag = 2222;
//		[contactsScrollArea addSubview:contactsHolder];
//		
//				
//		contactsScrollArea.contentSize = CGSizeMake(self.frame.size.width-20, contentHeight);
//		[self addSubview:contactsScrollArea];
//		[self addSubview:contactsHolder];
		
		
    }
    return self;
}

- (void)updateData:(NSDictionary *)data
{
	
	
}

- (void)clearData
{
	

}

- (void)dealloc
{
	
	[super dealloc];
}

#pragma mark - UITouchResponders
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan:");
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved:");
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
    UIView *touchView = [touch view];
    NSLog(@"touchesEnded: %d", touchView.tag);
    if (touchView.tag==1111){
		FGContactView *contactOne = (FGContactView *)touchView;
		[contactOne expandOrCollapseView];

        
    }
    
    
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled:");
    
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
