//
//  PopupViewController.h
//  Dealz
//
//  Created by Keir SM on 2017-04-01.
//  Copyright © 2017 Keir SM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupViewController : UIViewController

-(void)navTitle:(NSString*)ti;
-(void)pageUrl:(NSString*)url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
