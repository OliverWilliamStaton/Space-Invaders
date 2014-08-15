//
//  Game.m
//  Space Invaders
//
//  Created by Oliver Staton on 8/14/14.
//  Copyright (c) 2014 OllieStat. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

// Handle the condition when the player loses the game
-(void)GameOver
{
    Exit.hidden = NO;
    WinOrLose.hidden = NO;
    WinOrLose.text = [NSString stringWithFormat:@"You Lose!"];

    // Hide everything
    [self MonstersShouldBeHidden:YES];
    [self MonsterBulletsShouldBeHidden:YES];
    Ship.hidden = YES;
    Shoot.hidden = YES;
    
    // Stop the timer
    [MovementTimer invalidate];
}

// Handler for downward movement of the monsters
-(void)MonsterMoveDown
{
    Monster1.center = CGPointMake(Monster1.center.x, Monster1.center.y + 5);
    Monster2.center = CGPointMake(Monster2.center.x, Monster2.center.y + 5);
    Monster3.center = CGPointMake(Monster3.center.x, Monster3.center.y + 5);
    Monster4.center = CGPointMake(Monster4.center.x, Monster4.center.y + 5);
    Monster5.center = CGPointMake(Monster5.center.x, Monster5.center.y + 5);
    Monster6.center = CGPointMake(Monster6.center.x, Monster6.center.y + 5);
    Monster7.center = CGPointMake(Monster7.center.x, Monster7.center.y + 5);
    Monster8.center = CGPointMake(Monster8.center.x, Monster8.center.y + 5);
    Monster9.center = CGPointMake(Monster9.center.x, Monster9.center.y + 5);
    Monster10.center = CGPointMake(Monster10.center.x, Monster10.center.y + 5);
}

// Handler for when a monster is killed
-(void)MonsterKilled
{
    // Increment the killed monster count
    MonstersKilled++;
    
    BulletsOnScreen = 0;
    Bullet.hidden = YES;
    BulletMovement = 0;
    Bullet.center = CGPointMake(200, 555);
    
    if(MonstersKilled == 10)
    {
        Exit.hidden = NO;
        WinOrLose.hidden = NO;
        WinOrLose.text = [NSString stringWithFormat:@"You Win!"];
        
        // Hide everything
        [self MonsterBulletsShouldBeHidden:YES];
        Ship.hidden = YES;
        Shoot.hidden = YES;
        
        // Stop the timer
        [MovementTimer invalidate];
    }
}

// Handler for when bullets collide with objects
-(void)Collision
{
    // Game over if a monster bullet hits the ship
    if((CGRectIntersectsRect(MonsterBullet1.frame, Ship.frame)) ||
       (CGRectIntersectsRect(MonsterBullet2.frame, Ship.frame)) ||
       (CGRectIntersectsRect(MonsterBullet3.frame, Ship.frame)))
    {
        [self GameOver];
    }
    
    // Game over if a monster hits the ship
    if(((CGRectIntersectsRect(Monster1.frame, Ship.frame)) && (Monster1Hit == NO)) ||
       ((CGRectIntersectsRect(Monster2.frame, Ship.frame)) && (Monster2Hit == NO)) ||
       ((CGRectIntersectsRect(Monster3.frame, Ship.frame)) && (Monster3Hit == NO)) ||
       ((CGRectIntersectsRect(Monster4.frame, Ship.frame)) && (Monster4Hit == NO)) ||
       ((CGRectIntersectsRect(Monster5.frame, Ship.frame)) && (Monster5Hit == NO)) ||
       ((CGRectIntersectsRect(Monster6.frame, Ship.frame)) && (Monster6Hit == NO)) ||
       ((CGRectIntersectsRect(Monster7.frame, Ship.frame)) && (Monster7Hit == NO)) ||
       ((CGRectIntersectsRect(Monster8.frame, Ship.frame)) && (Monster8Hit == NO)) ||
       ((CGRectIntersectsRect(Monster9.frame, Ship.frame)) && (Monster9Hit == NO)) ||
       ((CGRectIntersectsRect(Monster10.frame, Ship.frame)) && (Monster10Hit == NO)))
    {
        [self GameOver];
    }
    
    // If the bullet hits a monster, hide monster and show that the monster was hit
    if((CGRectIntersectsRect(Bullet.frame, Monster1.frame)) && (Monster1Hit == NO))
    {
        Monster1.hidden = YES;
        Monster1Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster2.frame)) && (Monster2Hit == NO))
    {
        Monster2.hidden = YES;
        Monster2Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster3.frame)) && (Monster3Hit == NO))
    {
        Monster3.hidden = YES;
        Monster3Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster4.frame)) && (Monster4Hit == NO))
    {
        Monster4.hidden = YES;
        Monster4Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster5.frame)) && (Monster5Hit == NO))
    {
        Monster5.hidden = YES;
        Monster5Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster6.frame)) && (Monster6Hit == NO))
    {
        Monster6.hidden = YES;
        Monster6Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster7.frame)) && (Monster7Hit == NO))
    {
        Monster7.hidden = YES;
        Monster7Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster8.frame)) && (Monster8Hit == NO))
    {
        Monster8.hidden = YES;
        Monster8Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster9.frame)) && (Monster9Hit == NO))
    {
        Monster9.hidden = YES;
        Monster9Hit = YES;
        [self MonsterKilled];
    }
    
    if((CGRectIntersectsRect(Bullet.frame, Monster10.frame)) && (Monster10Hit == NO))
    {
        Monster10.hidden = YES;
        Monster10Hit = YES;
        [self MonsterKilled];
    }
}

// This code is run every time the screen is touched
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    // Get the coordinates of the touched location
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    // If the left side of the screen is touched, move it left
    if(point.x < Ship.center.x)
    {
        ShipMovement = -7;
    }
    // If the right side of the screen is touched, move it right
    else
    {
        ShipMovement = 7;
    }
}

// This code is run every time the screen touch is released
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    ShipMovement = 0;
}

-(void)Movement
{
    // Check for a collision
    [self Collision];
    
    // Move the ship along the X-axis (sideways)
    Ship.center = CGPointMake(Ship.center.x + ShipMovement, Ship.center.y);
    
    // Move the bullet along the Y-axis (downwards)
    Bullet.center = CGPointMake(Bullet.center.x, Bullet.center.y - BulletMovement);
    
    // Move the monsters along the X-axis
    Monster1.center = CGPointMake(Monster1.center.x + MonsterMovement, Monster1.center.y);
    Monster2.center = CGPointMake(Monster2.center.x + MonsterMovement, Monster2.center.y);
    Monster3.center = CGPointMake(Monster3.center.x + MonsterMovement, Monster3.center.y);
    Monster4.center = CGPointMake(Monster4.center.x + MonsterMovement, Monster4.center.y);
    Monster5.center = CGPointMake(Monster5.center.x + MonsterMovement, Monster5.center.y);
    Monster6.center = CGPointMake(Monster6.center.x + MonsterMovement, Monster6.center.y);
    Monster7.center = CGPointMake(Monster7.center.x + MonsterMovement, Monster7.center.y);
    Monster8.center = CGPointMake(Monster8.center.x + MonsterMovement, Monster8.center.y);
    Monster9.center = CGPointMake(Monster9.center.x + MonsterMovement, Monster9.center.y);
    Monster10.center = CGPointMake(Monster10.center.x + MonsterMovement, Monster10.center.y);
    
    // Move the monster bullets along the Y-Axis
    MonsterBullet1.center = CGPointMake(MonsterBullet1.center.x, MonsterBullet1.center.y + 10);
    MonsterBullet2.center = CGPointMake(MonsterBullet2.center.x, MonsterBullet2.center.y + 10);
    MonsterBullet3.center = CGPointMake(MonsterBullet3.center.x, MonsterBullet3.center.y + 10);

    // Reset the monster bullet when it goes off the page
    if(MonsterBullet1.center.y > 555)
    {
        MonsterShooterStart = arc4random() %315;
        MonsterBullet1.center = CGPointMake(MonsterShooterStart, 0);
    }
    if(MonsterBullet2.center.y > 555)
    {
        MonsterShooterStart = arc4random() %315;
        MonsterBullet2.center = CGPointMake(MonsterShooterStart, 0);
    }
    if(MonsterBullet3.center.y > 555)
    {
        MonsterShooterStart = arc4random() %315;
        MonsterBullet3.center = CGPointMake(MonsterShooterStart, 0);
    }
    
    // Reset bullet parameters when it leaves the screen
    if(Bullet.center.y < 0)
    {
        Bullet.hidden = YES;
        BulletsOnScreen = 0;
        BulletMovement = 0;
    }
    
    // When the most left monster hits the left wall, change their direction to right
    if((Monster1.center.x < 15) && (Monster1Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster2.center.x < 15) && (Monster2Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster3.center.x < 15) && (Monster3Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster4.center.x < 15) && (Monster4Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster5.center.x < 15) && (Monster5Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster6.center.x < 15) && (Monster6Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster7.center.x < 15) && (Monster7Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster8.center.x < 15) && (Monster8Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster9.center.x < 15) && (Monster9Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    else if((Monster10.center.x < 15) && (Monster10Hit == NO))
    {
        MonsterMovement = 5;
        [self MonsterMoveDown];
    }
    
    // When the most right monster hits the right wall, change their direction to left
    else if((Monster1.center.x > 306) && (Monster1Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster2.center.x > 306) && (Monster2Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster3.center.x > 306) && (Monster3Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster4.center.x > 306) && (Monster4Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster5.center.x > 306) && (Monster5Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster6.center.x > 306) && (Monster6Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster7.center.x > 306) && (Monster7Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster8.center.x > 306) && (Monster8Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster9.center.x > 306) && (Monster9Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
    else if((Monster10.center.x > 306) && (Monster10Hit == NO))
    {
        MonsterMovement = -5;
        [self MonsterMoveDown];
    }
}

-(void)MonstersShouldBeHidden:(bool)state
{
    Monster1.hidden = state;
    Monster2.hidden = state;
    Monster3.hidden = state;
    Monster4.hidden = state;
    Monster5.hidden = state;
    Monster6.hidden = state;
    Monster7.hidden = state;
    Monster8.hidden = state;
    Monster9.hidden = state;
    Monster10.hidden = state;
}

-(void)MonsterBulletsShouldBeHidden:(bool)state
{
    MonsterBullet1.hidden = state;
    MonsterBullet2.hidden = state;
    MonsterBullet3.hidden = state;
}

-(IBAction)Start:(id)sender
{
    Start.hidden = YES;
    Exit.hidden = YES;
    Shoot.hidden = NO;
    
    MovementTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Movement) userInfo:nil repeats:YES];
    
    [self MonstersShouldBeHidden:NO];
    [self MonsterBulletsShouldBeHidden:NO];
    
    MonsterShooterStart = arc4random() %315;
    MonsterBullet1.center = CGPointMake(MonsterShooterStart, 0);
    
    MonsterShooterStart = arc4random() %315;
    MonsterBullet2.center = CGPointMake(MonsterShooterStart, -150);
    
    MonsterShooterStart = arc4random() %315;
    MonsterBullet3.center = CGPointMake(MonsterShooterStart, -300);
}

-(IBAction)Exit:(id)sender
{

}

-(IBAction)Shoot:(id)sender
{
    if(BulletsOnScreen == 0)
    {
        // Create a bullet in front of the ship
        Bullet.hidden = NO;
        Bullet.center = CGPointMake(Ship.center.x, 487);
        
        // Show that there is a bullet
        BulletsOnScreen = 1;
        
        // Move the bullet on the screen
        BulletMovement = 7;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Initialize visible states of buttons
    Bullet.hidden = YES;
    Shoot.hidden = YES;
    WinOrLose.hidden = YES;
    
    // Initialize parameters
    Monster1Hit = NO;
    Monster2Hit = NO;
    Monster3Hit = NO;
    Monster4Hit = NO;
    Monster5Hit = NO;
    Monster6Hit = NO;
    Monster7Hit = NO;
    Monster8Hit = NO;
    Monster9Hit = NO;
    Monster10Hit = NO;
    MonsterMovement = 5;
    MonstersKilled = 0;
    
    [self MonstersShouldBeHidden:YES];
    [self MonsterBulletsShouldBeHidden:YES];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
