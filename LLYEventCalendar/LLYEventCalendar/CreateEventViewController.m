//
//  CreateEventViewController.m
//  LLYEventCalendar
//
//  Created by SK_15 on 2019/5/14.
//  Copyright © 2019 SK.com. All rights reserved.
//

#import "CreateEventViewController.h"
#import "EventCalendar.h"



#define  kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define  kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kGetColor(r,g,b) [UIColor colorWithRed:(r)/ 255.0 green:(g)/ 255.0 blue:(b)/ 255.0 alpha:1]


@interface CreateEventViewController ()<UITextFieldDelegate>


@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * addressLabel;
@property (nonatomic, strong) UILabel * allDayLabel;
@property (nonatomic, strong) UILabel * startLabel;
@property (nonatomic, strong) UILabel * endLabel;
@property (nonatomic, strong) UILabel * alarmLabel;


@property (nonatomic, strong) UITextField * titleText;
@property (nonatomic, strong) UITextField * addressText;
@property (nonatomic, strong) UISwitch *switchBtn;
@property (nonatomic, strong) UITextField * startText;
@property (nonatomic, strong) UITextField * endText;
@property (nonatomic, strong) UITextField * alarmText;

@end


@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
    [self setRightCreateBtn];
    
}

- (void)setupUI
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    
    //TODO:-标题
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.frame = CGRectMake(20, 0, 80, 50);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont systemFontOfSize:15.f];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.text = @"事件标题:";
    [self.scrollView addSubview:self.titleLabel];
    
    self.titleText = [[UITextField alloc]init];
    self.titleText.backgroundColor = [UIColor whiteColor];
    self.titleText.delegate = self;
    self.titleText.placeholder = @"请输入事件标题";
    [self.titleText setValue:[UIFont boldSystemFontOfSize:15.f] forKeyPath:@"_placeholderLabel.font"];
    self.titleText.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame), 0, kScreenWidth - 20 - 80 - 20, 50);
    [self.scrollView addSubview:self.titleText];
    
    UIView *line1 = [[UIView alloc]init];
    line1.frame = CGRectMake(0,49.5, kScreenWidth, 0.5);
    line1.backgroundColor = kGetColor(220,220,220);
    [self.scrollView addSubview:line1];
    
    
    //TODO:-地址
    self.addressLabel = [[UILabel alloc]init];
    self.addressLabel.backgroundColor = [UIColor whiteColor];
    self.addressLabel.frame = CGRectMake(20, 50, 80, 50);
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    self.addressLabel.font = [UIFont systemFontOfSize:15.f];
    self.addressLabel.textColor = [UIColor blackColor];
    self.addressLabel.text = @"事件位置:";
    [self.scrollView addSubview:self.addressLabel];
    
    self.addressText = [[UITextField alloc]init];
    self.addressText.backgroundColor = [UIColor whiteColor];
    self.addressText.delegate = self;
    self.addressText.placeholder = @"请输入事件位置";
    [self.addressText setValue:[UIFont boldSystemFontOfSize:15.f] forKeyPath:@"_placeholderLabel.font"];
    self.addressText.frame = CGRectMake(CGRectGetMaxX(self.addressLabel.frame), CGRectGetMinY(self.addressLabel.frame), kScreenWidth - 20 - 80 - 20, 50);
    [self.scrollView addSubview:self.addressText];
    
    UIView *line2 = [[UIView alloc]init];
    line2.frame = CGRectMake(0,49.5 + 50, kScreenWidth, 0.5);
    line2.backgroundColor =  kGetColor(220,220,220);
    [self.scrollView addSubview:line2];
    
    
    //TODO:-allDay
    self.allDayLabel = [[UILabel alloc]init];
    self.allDayLabel.backgroundColor = [UIColor whiteColor];
    self.allDayLabel.frame = CGRectMake(20, 2*50, 80, 50);
    self.allDayLabel.textAlignment = NSTextAlignmentLeft;
    self.allDayLabel.font = [UIFont systemFontOfSize:15.f];
    self.allDayLabel.textColor = [UIColor blackColor];
    self.allDayLabel.text = @"全     天";
    [self.scrollView addSubview:self.allDayLabel];
    
    self.switchBtn = [[UISwitch alloc]initWithFrame:CGRectMake(kScreenWidth - 60 - 20,CGRectGetMinY(self.allDayLabel.frame) + 10, 60, 50)];

//    // 设置控件开启状态填充色
//     self.switchBtn.onTintColor = [UIColor greenColor];
//    // 设置控件关闭状态填充色
//    self.switchBtn.tintColor = [UIColor redColor];
//    // 设置控件开关按钮颜色
//    self.switchBtn.thumbTintColor = [UIColor orangeColor];
    
    [self.scrollView addSubview:self.switchBtn];
    // 当控件值变化时触发changeColor方法
    [self.switchBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    
    UIView *lineS = [[UIView alloc]init];
    lineS.frame = CGRectMake(0,49.5 + 50 *2, kScreenWidth, 0.5);
    lineS.backgroundColor =  kGetColor(220,220,220);
    [self.scrollView addSubview:lineS];
    
    
    //TODO:-开始时间
    self.startLabel = [[UILabel alloc]init];
    self.startLabel.backgroundColor = [UIColor whiteColor];
    self.startLabel.frame = CGRectMake(20, 3*50, 80, 50);
    self.startLabel.textAlignment = NSTextAlignmentLeft;
    self.startLabel.font = [UIFont systemFontOfSize:15.f];
    self.startLabel.textColor = [UIColor blackColor];
    self.startLabel.text = @"开始时间:";
    [self.scrollView addSubview:self.startLabel];
    
    self.startText = [[UITextField alloc]init];
    self.startText.backgroundColor = [UIColor whiteColor];
    self.startText.delegate = self;
    self.startText.placeholder = @"请输入事件开始时间";
    [self.startText setValue:[UIFont boldSystemFontOfSize:15.f] forKeyPath:@"_placeholderLabel.font"];
    self.startText.frame = CGRectMake(CGRectGetMaxX(self.startLabel.frame), CGRectGetMinY(self.startLabel.frame), kScreenWidth - 20 - 80 - 20, 50);
    [self.scrollView addSubview:self.startText];
    
    UIView *line3 = [[UIView alloc]init];
    line3.frame = CGRectMake(0,49.5 + 50 *3, kScreenWidth, 0.5);
    line3.backgroundColor =  kGetColor(220,220,220);
    [self.scrollView addSubview:line3];
    
    //TODO:-结束时间
    self.endLabel = [[UILabel alloc]init];
    self.endLabel.backgroundColor = [UIColor whiteColor];
    self.endLabel.frame = CGRectMake(20, 4*50, 80, 50);
    self.endLabel.textAlignment = NSTextAlignmentLeft;
    self.endLabel.font = [UIFont systemFontOfSize:15.f];
    self.endLabel.textColor = [UIColor blackColor];
    self.endLabel.text = @"结束时间:";
    [self.scrollView addSubview:self.endLabel];
    
    self.endText = [[UITextField alloc]init];
    self.endText.backgroundColor = [UIColor whiteColor];
    self.endText.delegate = self;
    self.endText.placeholder = @"请输入事件结束时间";
    [self.endText setValue:[UIFont boldSystemFontOfSize:15.f] forKeyPath:@"_placeholderLabel.font"];
    self.endText.frame = CGRectMake(CGRectGetMaxX(self.endLabel.frame), CGRectGetMinY(self.endLabel.frame), kScreenWidth - 20 - 80 - 20, 50);
    [self.scrollView addSubview:self.endText];
    
    UIView *line4 = [[UIView alloc]init];
    line4.frame = CGRectMake(0,49.5 + 50 *4, kScreenWidth, 0.5);
    line4.backgroundColor =  kGetColor(220,220,220);
    [self.scrollView addSubview:line4];
    
    //TODO:-闹钟时间
    self.alarmLabel = [[UILabel alloc]init];
    self.alarmLabel.backgroundColor = [UIColor whiteColor];
    self.alarmLabel.frame = CGRectMake(20, 5*50, 80, 50);
    self.alarmLabel.textAlignment = NSTextAlignmentLeft;
    self.alarmLabel.font = [UIFont systemFontOfSize:15.f];
    self.alarmLabel.textColor = [UIColor blackColor];
    self.alarmLabel.text = @"闹钟时间:";
    [self.scrollView addSubview:self.alarmLabel];
    
    self.alarmText = [[UITextField alloc]init];
    self.alarmText.backgroundColor = [UIColor whiteColor];
    self.alarmText.delegate = self;
    self.alarmText.placeholder = @"请输入事件闹钟时间";
    [self.alarmText setValue:[UIFont boldSystemFontOfSize:15.f] forKeyPath:@"_placeholderLabel.font"];
    self.alarmText.frame = CGRectMake(CGRectGetMaxX(self.alarmLabel.frame), CGRectGetMinY(self.alarmLabel.frame), kScreenWidth - 20 - 80 - 20, 50);
    [self.scrollView addSubview:self.alarmText];
    
    UIView *line5 = [[UIView alloc]init];
    line5.frame = CGRectMake(0,49.5 + 50 *5, kScreenWidth, 0.5);
    line5.backgroundColor =  kGetColor(220,220,220);
    [self.scrollView addSubview:line5];
}

- (void)setRightCreateBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:1 green:0.1 blue:0.1 alpha:1];
    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.height - 40, 80, 30);
    btn.layer.cornerRadius = 5;
    btn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [btn setTitle:@"同 步" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:itemBtn];
}

- (void)buttonClicked:(UIButton *)sender
{
    if (self.titleText.text.length ) {
        return;
    }
    
    EventCalendar *eventCalendar = [EventCalendar sharedEventCalendar];
    
    [eventCalendar createEventCalendarTitle:self.titleText.text location:self.addressText.text startDate:[NSDate date] endDate:[NSDate date] allDay:YES alarmArray:@[self.alarmText.text]];
}

-(void)changeColor:(UISwitch *)swi{
    if(swi.isOn){
        self.view.backgroundColor = [UIColor redColor];
    }else{
        self.view.backgroundColor = [UIColor blueColor];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}

@end
