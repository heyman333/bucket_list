//
//  ChallengeViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "ChallengeViewController.h"
#import "ChallengeTableViewCell.h"

@interface ChallengeViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray *challengeArr;
@property NSMutableArray *ddayArr;
@property NSMutableArray *imgs;
@end

@implementation ChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    self.challengeArr = [[NSMutableArray alloc] initWithObjects:@"나홀로 런던 여행가기",@"앱스토어에 앱 등록하기",@"팀 프로젝트 완수",@"유럽축구 직관 여행",@"여자친구와 스페인 여행", nil];
    
    
    self.ddayArr = [[NSMutableArray alloc] initWithObjects:@"D-25",@"D-54",@"D-60",@"D-153",@"D-205", nil];

    self.imgs = [[NSMutableArray alloc] initWithObjects:@"challenge0",@"challenge1",@"challenge2",@"challenge3",@"challenge4", nil];
  
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _imgs.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChallengeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChallengeTableViewCell"];
    
    
    if(cell == nil){
        cell = [[ChallengeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChallengeTableViewCell"];
        
    }
    cell.cellImg.image = [UIImage imageNamed:self.imgs[indexPath.row]];
    cell.chTitle.text = self.challengeArr[indexPath.row];
    cell.dday.text = self.ddayArr[indexPath.row];

    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"선택");
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:NO];
    
    UIAlertController *challegeAlert = [UIAlertController alertControllerWithTitle:@"삭제" message:@"삭제할까요?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.challengeArr removeObjectAtIndex:indexPath.row];
        [self.imgs removeObjectAtIndex:indexPath.row];
        [self.ddayArr removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
        
    }];
    
    [challegeAlert addAction:yes];

    [self presentViewController:challegeAlert animated:YES completion:nil];
    
}


@end
