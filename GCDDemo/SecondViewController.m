//
//  SecondViewController.m
//  GCDDemo
//
//  Created by Lewis W. Johnson on 8/24/14.
//  Copyright (c) 2014 HamiltonHoltInc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize count;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self doit];
}

- (void)doit
{
    NSArray *images = @[@"http://hamiltonholt.com/hamiltonholt/hamiltonholt/Xpedoc_files/image8.jpg",
                        @"http://hamiltonholt.com/hamiltonholt/hamiltonholt/Welcome_files/shapeimage_1.png"];
    
    dispatch_queue_t imageQueue = dispatch_queue_create("Image Queue",NULL);
    
    for (NSString *urlString in images)
    {
        dispatch_async(imageQueue, ^
        {
            
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            
            NSUInteger imageIndex = [images indexOfObject:urlString];
            NSLog(@"Image Loaded indexv=%d",imageIndex);
            
            UIImageView *targetimage = [[UIImageView alloc]initWithFrame:CGRectMake(imageIndex * 110,30,130,110)];
            [targetimage setImage:image];
            
            if (targetimage != nil && image != nil)
            {
             
            dispatch_async(dispatch_get_main_queue(), ^
            {
                [self.view addSubview:targetimage];
                targetimage.hidden = NO;
                NSLog(@"Image Loaded");
            });
                
            }
            
        }); 
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
