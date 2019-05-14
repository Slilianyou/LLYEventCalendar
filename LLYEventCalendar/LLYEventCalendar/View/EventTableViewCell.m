//
//  EventTableViewCell.m
//  LLYEventCalendar
//
//  Created by SK_15 on 2019/5/14.
//  Copyright © 2019 SK.com. All rights reserved.
//

#import "EventTableViewCell.h"

@interface EventTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *line;

@end

@implementation EventTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:15.f];
        self.titleLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.line];
    }
    
    return self;
}
- (void)setCellData:(NSString *)eventStr
{

    self.titleLabel.text = eventStr;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
     self.titleLabel.frame = CGRectMake(20, 0, self.contentView.bounds.size.width - 20 -20, self.contentView.bounds.size.height);
    
    self.line.frame = CGRectMake(0, self.contentView.bounds.size.height - 0.5, self.contentView.bounds.size.width, 0.5);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
