//
//  TestViewController.h
//  Test
//
//  Created by logic_august.xie on 11-4-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController {

	IBOutlet UIView *customView;
	UIImageView *imageView;
	UIImageView *imageView2;
	UIImageView *imageView3;
}

@property (nonatomic,retain) UIView *customView;
@property (nonatomic,retain) IBOutlet UIImageView *imageView;
@property (nonatomic,retain) IBOutlet UIImageView *imageView2;
@property (nonatomic,retain) IBOutlet UIImageView *imageView3;
-(IBAction)pageCurl:(id)sender;
@end

