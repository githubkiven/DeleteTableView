//
//  ViewController.m
//  DeleteTableView
//
//  Created by smppw_zwq on 2018/11/2.
//  Copyright © 2018年 SMPPW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * myInteractionTableView;

@property(nonatomic,strong)NSMutableArray * titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _titleArray = [NSMutableArray array];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    _titleArray =[NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
    
    
    [self.view addSubview:self.myInteractionTableView];


}
#pragma mark -------- ReuqestData
#pragma mark -------- CreatUI
#pragma mark -------- Delegate
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    
    
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        
    }
    
    cell.textLabel.text = _titleArray[indexPath.row];
    
    return cell;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    
    
    return 1;
    
    
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //只要实现这个方法，就实现了默认滑动删除！！！！！
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        // 删除数据
        
        [_titleArray removeObjectAtIndex:indexPath.row];
        
        
        [_myInteractionTableView reloadData];
        
    }
}



- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
    
}

#pragma mark - UITextFieldDelegate
#pragma mark - otherDelegate

#pragma mark -------- Private Methods
#pragma mark -------- Events
#pragma mark -------- Getters and Setters
- (UITableView *)myInteractionTableView{
    
    if (!_myInteractionTableView) {
        _myInteractionTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
        _myInteractionTableView.dataSource = self;
        _myInteractionTableView.delegate =self;
        
    }
    
    return _myInteractionTableView;
    
    
}




@end
