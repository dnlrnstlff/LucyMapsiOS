//
//  MyAnnotation.m
//  LUCY MAP FRAMEWORK
//
//  Created by Daniel-Ernest Luff.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

- (void)dealloc 
{
	[super dealloc];
	self.title = nil;
	self.subtitle = nil;
}
@end