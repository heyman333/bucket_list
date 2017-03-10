//
//  SuccessViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "SuccessViewController.h"
#import "SuccessTableViewCell.h"

@interface SuccessViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *challengeArr;
@property NSMutableArray *imgs;

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.challengeArr = [[NSMutableArray alloc] initWithObjects:@"친구들과 안면도 캠핑", @"2015 지산 락페스티벌 가기", @"2016 군항제 가기 ",@"제과제빵 자격증 취득" ,nil];
    
    self.imgs = [[NSMutableArray alloc] initWithObjects:@"complete1",@"complete2", @"complete3",@"complete4",nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.challengeArr.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",indexPath.row);
    SuccessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuccessTableViewCell"];
    
    
    if(cell == nil){
        cell = [[SuccessTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SuccessTableViewCell"];
        
    }
    cell.successCellImg.image = [UIImage imageNamed:[self.imgs objectAtIndex:indexPath.row]];
    NSLog(@"12312312%@",[self.challengeArr objectAtIndex:indexPath.row]);
    cell.chText.text = [self.challengeArr objectAtIndex:indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:NO];
    
    UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"삭제" message:@"삭제할까요?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.challengeArr removeObjectAtIndex:indexPath.row];
        [self.imgs removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
        
    }];
    
    [successAlert addAction:yes];
    

    
    [self presentViewController:successAlert animated:YES completion:nil];
    
}


@end
