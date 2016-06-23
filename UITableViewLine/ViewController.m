//
//  ViewController.m
//  UITableViewLine
//
//  Created by yongliangP on 16/6/23.
//  Copyright © 2016年 yongliangP. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+SeperatorLine.h"
#import "UIColor+HexString.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)UIView * snapshotView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return 20;
    
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * cellName = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell--%ld",indexPath.row];
    

    if (indexPath.row<5)
    {
        
        [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:15.0 withLineColor:[UIColor colorWithHexString:@"#e9ebf2"]];

    }
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row==5)
    {
        SecondViewController * scVC = [[SecondViewController alloc] init];
        scVC.backView =  [self.view snapshotViewAfterScreenUpdates:YES];
        [self presentViewController:scVC animated:YES completion:nil];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
