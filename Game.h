//
//  Game.h
//  Space Invaders
//
//  Created by Oliver Staton on 8/14/14.
//  Copyright (c) 2014 OllieStat. All rights reserved.
//

#import <UIKit/UIKit.h>

int ShipMovement;
int BulletMovement;
int BulletsOnScreen;
int MonstersKilled;
bool Monster1Hit;
bool Monster2Hit;
bool Monster3Hit;
bool Monster4Hit;
bool Monster5Hit;
bool Monster6Hit;
bool Monster7Hit;
bool Monster8Hit;
bool Monster9Hit;
bool Monster10Hit;
int MonsterMovement;
int MonsterShooterStart;

@interface Game : UIViewController
{
    IBOutlet UIButton *Start;
    IBOutlet UIButton *Exit;
    IBOutlet UIButton *Shoot;
    
    IBOutlet UIImageView *Ship;
    IBOutlet UIImageView *Bullet;
    
    IBOutlet UIImageView *Monster1;
    IBOutlet UIImageView *Monster2;
    IBOutlet UIImageView *Monster3;
    IBOutlet UIImageView *Monster4;
    IBOutlet UIImageView *Monster5;
    IBOutlet UIImageView *Monster6;
    IBOutlet UIImageView *Monster7;
    IBOutlet UIImageView *Monster8;
    IBOutlet UIImageView *Monster9;
    IBOutlet UIImageView *Monster10;
    
    IBOutlet UIImageView *MonsterBullet1;
    IBOutlet UIImageView *MonsterBullet2;
    IBOutlet UIImageView *MonsterBullet3;
    
    IBOutlet UILabel *WinOrLose;

    NSTimer *MovementTimer;
}

-(IBAction)Start:(id)sender;
-(IBAction)Exit:(id)sender;
-(IBAction)Shoot:(id)sender;
-(void)Collision;
-(void)MonsterKilled;
-(void)MonsterMoveDown;
-(void)GameOver;

@end
