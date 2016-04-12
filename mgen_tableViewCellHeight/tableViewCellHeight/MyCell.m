//
//  MyCell.m
//  tableViewCellHeight
//
//  Created by MgenLiu on 13-12-23.
//  Copyright (c) 2013年 Mgen. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    [[GlobalCounter getInstance] add:@"create cell"];
    return [super initWithCoder:coder];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
