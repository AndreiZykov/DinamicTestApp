//
//  ViewController.m
//  DynamicTableTest
//
//  Created by Max Soiferman on 12.02.16.
//  Copyright © 2016 Max Soiferman. All rights reserved.
//

#import "ViewController.h"

static NSString * identifier = @"Cell";

@interface ViewController ()

@property (strong, nonatomic) NSArray *sectionArray;

@property (strong, nonatomic) NSArray *positionArray;
@property (strong, nonatomic) NSArray *goalkeeperArray;
@property (strong, nonatomic) NSArray *defenderArray;
@property (strong, nonatomic) NSArray *midfieldersArray;
@property (strong, nonatomic) NSArray *forwardsArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
//    self.tableView.contentInset = inset;
//    self.tableView.scrollIndicatorInsets = inset;
    
   
    self.sectionArray =  [[NSArray alloc] initWithObjects:    @"Goalkeeper",
                                                              @"Defender",
                                                              @"Midfielders",
                                                              @"Forwards", nil];
    
    self.goalkeeperArray = [[NSArray alloc] initWithObjects:  @"David Ospina",
                                                              @"Petr Chech", nil];
   
    self.defenderArray = [[NSArray alloc] initWithObjects:    @"Kieran Gibbs",
                                                              @"Per Mertesacker",
                                                              @"Gabriel",
                                                              @"Laurent Koscielny",
                                                              @"Nacho Monreal",
                                                              @"Calum Chambers",
                                                              @"Hector Bellerin", nil];
  
    self.midfieldersArray = [[NSArray alloc] initWithObjects: @"Tomas Rosicky",
                                                              @"Mikel Arteta",
                                                              @"Jack Wilshere",
                                                              @"Mesut Ozil",
                                                              @"Alex Oxlade-Chamberlain",
                                                              @"Aaron Ramsey",
                                                              @"Santi Cazorla",
                                                              @"Mathieu Flamini",
                                                              @"Francis Coquelin",
                                                              @"Mohamed Elneny" , nil];
   
    self.forwardsArray = [[NSArray alloc] initWithObjects:    @"Olivier Giroud",
                                                              @"Theo Walcott",
                                                              @"Alexis",
                                                              @"Danny Welbeck",
                                                              @"Joel Campbell",
                                                              @"Alex Iwobi", nil];
                     

   self.positionArray = [NSArray arrayWithObjects:self.goalkeeperArray, self.defenderArray, self.midfieldersArray, self.forwardsArray, nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

// количество ячеек\секций в tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView");
    
    return self.sectionArray.count;
    
}

// количество рядов в ячейке\секции в tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    // you can not use %d anymore, li - long integer
    NSLog(@"numberOfRowsInSection %li", section);

    // you have to check "!= nill and <0"
    
    return [[self.positionArray objectAtIndex:section] count];
    

    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString * titleName = [self.sectionArray objectAtIndex:section];
    
    return titleName;
    
}

// возврат ячеек по indexPath, в котором содержится и ячейка\секцию и ряд
// этот метод всегда возвращает ячейку секции и ячейки по indexpath
// возвращает сначала секцию, потом номер ячейки в этой секции


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"cellForRowAtIndexPath {%li, %li}", indexPath.section, indexPath.row);
    
    // You alredy have static cell identifire :)
    //static NSString * cellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
   
        NSLog(@"cell created");
   
    } else {
        NSLog(@"cell reused");
    }

    NSString * cellTextString;
    
    cellTextString = [[self.positionArray objectAtIndex:indexPath.section]
                              objectAtIndex:indexPath.row];

    cell.textLabel.text = cellTextString;
    
    return cell;
}



@end
