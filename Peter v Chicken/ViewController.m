//
//  ViewController.m
//  Peter v Chicken
//
//  Created by Dustin M on 9/2/15.
//  Copyright (c) 2015 Vento. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"
#import "Character.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Factory *factory = [[Factory alloc] init];
    self.character = [factory character];
    self.boss = [factory boss];
    self.tiles = [factory tiles];
    self.currentPoint = CGPointMake(1,0);
    //NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    //[self updateCharacterImage];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15){
        self.boss.health = self.boss.health - self.character.damage;
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    if(self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died, restart the game" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    else if (self.boss.health <=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Absolute Victory" message:@"The chicken has been defeated" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateTile];
    if (self.currentPoint.x == 3 && self.currentPoint.y == 2){
        self.actionButton.hidden = NO;
    }
    else {
        self.actionButton.hidden = YES;
    }
}


- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1);
    [self updateButtons];
    [self updateTile];
    self.actionButton.hidden = NO;
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    self.actionButton.hidden = NO;
    
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
    self.actionButton.hidden = NO;


}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    self.actionButton.hidden = NO;


}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];

}


//helper Methods
- (void)updateTile
{
    Tile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyText.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    if (self.character.health > 70){
            self.characterImage.image = [UIImage imageNamed:@"peter101.jpeg"];
    }
    else {
        
    self.characterImage.image = [UIImage imageNamed:@"peter_bloody2.jpg"];
    }
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];

    
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y -1)];
                              
}

-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(Armor *)armor withWeapons:(Weapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health  - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
        
    }
}

//-(void)updateCharacterImage
//{
//    //Character *health = int currentHealth;
//    self.characterImage.image = [UIImage imageNamed:@"peter101.jpeg"];
//    [self updateTile];
//}


@end
