//
//  MyCell.h
//  tableViewCellHeight
//
//  Created by MgenLiu on 13-12-23.
//  Copyright (c) 2013年 Mgen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
