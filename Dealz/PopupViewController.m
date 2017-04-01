//
//  PopupViewController.m
//  Dealz
//
//  Created by Keir SM on 2017-04-01.
//  Copyright © 2017 Keir SM. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController (){
    NSString *pageUrl;
}

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:pageUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
    NSLog(@"Happened");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)navTitle:(NSString*)ti{
    self.title = ti;
}

-(void)pageUrl:(NSString *)url{
    pageUrl = url;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
