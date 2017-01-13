//
//  TestViewController.m
//  Test
//
//  Created by logic_august.xie on 11-4-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestViewController.h"
#import <QuartzCore/QuartzCore.h>
  #define kDropCompressAmount 0.1
static int count = 1;
@implementation TestViewController
@synthesize customView,imageView,imageView2,imageView3;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view addSubview:self.customView];
	[self AnimationView];
	//self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 320, 480)];
//	[self.imageView setImage:[UIImage imageNamed:@"2.jpg"]];
//	self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 320, 480)];
//	[self.imageView2 setImage:[UIImage imageNamed:@"3.jpg"]];
//	self.imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 320, 480)];
//	[self.imageView3 setImage:[UIImage imageNamed:@"3.jpg"]];
	
}


-(IBAction)pageCurl:(id)sender{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.imageView cache:YES];
	[UIView setAnimationDuration:0.8];
	
	
	switch (count) {
		case 1:
			[self.view addSubview:self.imageView];
			break;
		case 2:
			[self.view addSubview:self.imageView2];
			break;
		case 3:
			[self.view addSubview:self.imageView3];
			break;
		default:
			break;
	}
	[UIView commitAnimations];
	count++;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.imageView = nil;
}


- (void)dealloc {
	[imageView release];
    [super dealloc];
}

-(void)AnimationView{
	
    self.customView.frame = CGRectMake(123,768,29,29);
	[UIView beginAnimations:nil context:NULL];
	self.customView.transform = CGAffineTransformMakeScale(3,3);
	
	[UIView setAnimationDuration:0.9];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	self.customView.frame = CGRectMake(123,134,29,29);
	self.customView.transform = CGAffineTransformMakeScale(1,1);
	self.customView.alpha = 1.0;
	[UIView commitAnimations];
}

#pragma mark ---
- (void)didMoveToSuperview {
	
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
	animation.duration = 0.4;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, -400, 0)];
	animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
	
	CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform"];
	animation2.duration = 0.10;
	animation2.beginTime = animation.duration;
	animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	animation2.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DMakeTranslation(0, self.view.layer.frame.size.height*kDropCompressAmount, 0), 1.0, 1.0-kDropCompressAmount, 1.0)];
	animation2.fillMode = kCAFillModeForwards;
	
	CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform"];
	animation3.duration = 0.15;
	animation3.beginTime = animation.duration+animation2.duration;
	animation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	animation3.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
	animation3.fillMode = kCAFillModeForwards;
	
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithObjects:animation, nil];
	group.duration = animation.duration;+animation2.duration+animation3.duration;
	group.fillMode = kCAFillModeForwards;
	
	[self.view.layer addAnimation:group forKey:nil];
}

@end
