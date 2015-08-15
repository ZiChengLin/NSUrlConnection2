//
//  ViewController.m
//  Lesson-UI0603-2
//
//  Created by lin on 15/6/3.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "ViewController.h"

#define BaseUrl @"http://ia.topit.me/a/01/d7/1192857991bbad701ao.jpg"

@interface ViewController ()<NSURLConnectionDataDelegate>

@property (nonatomic, retain)NSMutableData *receiveData;
@property (nonatomic, assign)long long length;

@end

@implementation ViewController


- (IBAction)doAsyGET:(id)sender {
    
    NSURL *url = [NSURL URLWithString:BaseUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

#pragma -mark NSURLConnectionDataDelegate四个常用的代理方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    self.receiveData = [[NSMutableData alloc]init];
    
    self.length = response.expectedContentLength;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.receiveData appendData:data];
    
    self.progressView.progress = 1.0 * self.receiveData.length / self.length;
    
    self.imageView.image = [UIImage imageWithData:self.receiveData];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_receiveData options:NSJSONReadingMutableContainers error:nil];
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [_progressView release];
    [super dealloc];
}
@end
