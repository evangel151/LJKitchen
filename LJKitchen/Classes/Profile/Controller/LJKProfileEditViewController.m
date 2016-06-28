//
//  LJKProfileEditViewController.m
//  LJKitchen
//
//  Created by  a on 16/6/28.
//  Copyright © 2016年 ycdsq. All rights reserved.
//

#import "LJKProfileEditViewController.h"
#import "LJKProfileEditHeader.h"
#import "LJKEditGenderAndBirthdayCell.h"
#import "LJKEditBasicCell.h"

#import "LJKMyInfo.h"
#import "LJKAuthorDetail.h"

@interface LJKProfileEditViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) LJKAuthorDetail *authorDetail;
@property (nonatomic, strong) LJKProfileEditHeader *header;

@property (nonatomic, assign) CGFloat headerHeight;
@end

@implementation LJKProfileEditViewController

static NSString *nickNameIdentifier          = @"nickNameCell";
static NSString *birthdayAndGenderIdentifier = @"birthdayAndGenderCell";
static NSString *homeTownIdentifier          = @"homeTownCell";
static NSString *residentIdentifier          = @"residentCell";


- (LJKAuthorDetail *)authorDetail {
    if (!_authorDetail) {
//        _authorDetail = [[LJKAuthorDetail alloc] init];
        _authorDetail = [LJKMyInfo info];
    }
    return _authorDetail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupTalbeViewHeader];
    [self setupTableView];
}

- (void)setupNavigationBar {
    self.view.backgroundColor = Color_BackGround;
    self.title = @"编辑个人资料";
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"保存"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(saveProfileInfo)];
    self.navigationItem.rightBarButtonItem.tintColor = Color_ThemeColor;
}

- (void)setupTableView {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LJKEditBasicCell class] forCellReuseIdentifier:nickNameIdentifier];
    [self.tableView registerClass:[LJKEditGenderAndBirthdayCell class] forCellReuseIdentifier:birthdayAndGenderIdentifier];
    
}

- (void)setupTalbeViewHeader {
    self.headerHeight = LJKAuthorIcon2CellTop * 4 + LJKAuthorIconsWH + 30;
    _header = [[LJKProfileEditHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.headerHeight)];
    _header.displayIcon = [UIImage imageNamed:self.authorDetail.photo160];
    
    UIImagePickerController *headerPicker = [[UIImagePickerController alloc] init];
    headerPicker.videoQuality = UIImagePickerControllerQualityTypeLow;
    headerPicker.delegate = self;
    headerPicker.allowsEditing = YES;
    
    WeakSelf;
    _header.uploadIconBlock = ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择头像图片的来源"
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        
        // 相机
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"通过拍照上传"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
               

               if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                   headerPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                   [weakSelf presentViewController:headerPicker animated:YES completion:nil];
               } else {
                   [UILabel showMessage:@"模拟器无法开启相机" atNavController:weakSelf.navigationController];
               }

        }];
        
        // 相册
        UIAlertAction *album = [UIAlertAction actionWithTitle:@"从本地图库选择"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
              if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                  headerPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                  [weakSelf presentViewController:headerPicker animated:YES completion:nil];
              }
                                                          
        }];
        
        // 取消
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                         style:UIAlertActionStyleCancel
                                                       handler:nil];
        
        [alert addAction:camera];
        [alert addAction:album];
        [alert addAction:cancel];
        
        [weakSelf presentViewController:alert animated:YES completion:nil];
    };
    
    self.tableView.tableHeaderView = _header;
}



#pragma mark - TableView 数据源 & 代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeakSelf;
    if (indexPath.row == 0) {
        LJKEditBasicCell *nickNameCell = [tableView dequeueReusableCellWithIdentifier:nickNameIdentifier];
        nickNameCell.currentName = self.authorDetail.name;
        nickNameCell.editingTextBlock = ^(NSString *name) {
            weakSelf.authorDetail.name = name;
        };
        
        return  nickNameCell;
        
    } else if (indexPath.row == 1) {
        LJKEditGenderAndBirthdayCell *birthdayCell = [tableView dequeueReusableCellWithIdentifier:birthdayAndGenderIdentifier];
        birthdayCell.displayGender = self.authorDetail.gender;
        birthdayCell.displayBirthday = self.authorDetail.birthday;
        
        return  birthdayCell;
    }
    return nil;

}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    self.header.displayIcon = info[UIImagePickerControllerEditedImage];
    [self.tableView reloadData];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - scrollView delegate 
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.tableView endEditing:YES];
}

#pragma mark - 点击事件
- (void)saveProfileInfo {
     NSLog(@"保存个人信息——————");
}


@end
