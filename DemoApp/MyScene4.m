//
//  MyScene4.m
//  ZombieConga
//
//  Created by Adrian's Laptop on 4/1/14.
//  Copyright (c) 2014 Adrian's Laptop. All rights reserved.
//

#import "MyScene4.h"
#import "GameOverScene.h"

@import AVFoundation;

static inline CGPoint CGPointAdd(const CGPoint a,
                                 const CGPoint b)
{
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint CGPointSubtract(const CGPoint a,
                                      const CGPoint b)
{
    return CGPointMake(a.x - b.x, a.y - b.y);
}

static inline CGPoint CGPointMultiplyScalar(const CGPoint a,
                                            const CGFloat b)
{
    return CGPointMake(a.x * b, a.y * b);
}

static inline CGFloat CGPointLength(const CGPoint a)
{
    return sqrtf(a.x * a.x + a.y * a.y);
}

static inline CGPoint CGPointNormalize(const CGPoint a)
{
    CGFloat length = CGPointLength(a);
    return CGPointMake(a.x / length, a.y / length);
}

static inline CGFloat CGPointToAngle(const CGPoint a)
{
    return atan2f(a.y, a.x);
}

static inline CGFloat ScalarSign(CGFloat a)
{
    return a >= 0 ? 1 : -1;
}

// Returns shortest angle between two angles,
// between -M_PI and M_PI
static inline CGFloat ScalarShortestAngleBetween(
                                                 const CGFloat a, const CGFloat b)
{
    CGFloat difference = b - a;
    CGFloat angle = fmodf(difference, M_PI * 2);
    if (angle >= M_PI) {
        angle -= M_PI * 2;
    }
    return angle;
}

#define ARC4RANDOM_MAX      0x100000000
static inline CGFloat ScalarRandomRange(CGFloat min,
                                        CGFloat max)
{
    return floorf(((double)arc4random() / ARC4RANDOM_MAX) *
                  (max - min) + min);
}

static const float ZOMBIE_MOVE_POINTS_PER_SEC = 120.0;
static const float ZOMBIE_ROTATE_RADIANS_PER_SEC = 4 * M_PI;
static const float CAT_MOVE_POINTS_PER_SEC = 120.0;
static const float BG_POINTS_PER_SEC = 50;

@implementation MyScene4
{
    SKSpriteNode *_playButton;
    SKSpriteNode *_pauseButton;
    SKSpriteNode *_zombie;
    NSTimeInterval _lastUpdateTime;
    NSTimeInterval _dt;
    CGPoint _velocity;
    CGPoint _lastTouchLocation;
    SKAction *_zombieAnimation;
    SKAction *_catCollisionSound;
    SKAction *_enemyCollisionSound;
    BOOL _invincible;
    int _lives;
    BOOL _gameOver;
    AVAudioPlayer *_backgroundMusicPlayer;
    SKNode *_bgLayer;
    SKLabelNode *_livesLabel;
    int _currentLevel;
    
    BOOL _showPauseButton;
    BOOL _pauseButtonPressed;
    BOOL _showPlayButton;
    BOOL _playButtonPressed;
}

- (void)spawnEnemy
{
    SKSpriteNode *enemy3 =
    [SKSpriteNode spriteNodeWithImageNamed:@"enemy3"];
    enemy3.name = @"enemy3";
    CGPoint enemyScenePos = CGPointMake(
                                        self.size.width + enemy3.size.width/2,
                                        ScalarRandomRange(enemy3.size.height/2,
                                                          self.size.height-enemy3.size.height/2));
    enemy3.position = [self convertPoint:enemyScenePos toNode:_bgLayer];
    [_bgLayer addChild:enemy3];
    
    SKAction *actionMove =
    [SKAction moveByX:-self.size.width + enemy3.size.width y:0 duration:2.0];
    SKAction *actionRemove = [SKAction removeFromParent];
    [enemy3 runAction:
     [SKAction sequence:@[actionMove, actionRemove]]];
    
}

- (void)initLivesLabel {
    _livesLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    _livesLabel.text = [NSString stringWithFormat:@"%d Lives", _lives];
    _livesLabel.fontSize = 20.0;
    _livesLabel.position = CGPointMake(200, 300);
    [self addChild:_livesLabel];
}

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
        _bgLayer = [SKNode node];
        [self addChild:_bgLayer];
        
        self.backgroundColor = [SKColor whiteColor];
        [self playBackgroundMusic:@"bgMusic.mp3"];
        
        _lives = 7;
        _gameOver = NO;
        [self initLivesLabel];
        for (int i = 0; i < 2; i++) {
            SKSpriteNode * bg =
            [SKSpriteNode spriteNodeWithImageNamed:@"background"];
            bg.anchorPoint = CGPointZero;
            bg.position = CGPointMake(i * bg.size.width, 0);
            bg.name = @"bg";
            [_bgLayer addChild:bg];
        }
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
        
        myLabel.text = @"Level 5";
        myLabel.fontSize = 20;
        myLabel.position = CGPointMake(50, 300);
        
        [self addChild:myLabel];
        
        CGPoint position = CGPointMake(530,280);
        //background.position = position;
        //[self addChild:background];
        _pauseButton = [SKSpriteNode spriteNodeWithImageNamed:@"pausebutton"];
        _pauseButton.position = position;
        [self addChild:_pauseButton];
        
        CGPoint position1 = CGPointMake(460,280);
        //background.position = position;
        //[self addChild:background];
        _playButton = [SKSpriteNode spriteNodeWithImageNamed:@"playButton"];
        _playButton.position = position1;
        [self addChild:_playButton];
        
        //CGSize mySize = bg.size;
        //NSLog(@"Size: %@", NSStringFromCGSize(mySize));
        
        _zombie = [SKSpriteNode spriteNodeWithImageNamed:@"zombie1"];
        _zombie.position = CGPointMake(100, 100);
        _zombie.zPosition = 100;
        
        [_bgLayer addChild:_zombie];
        
        // 1
        NSMutableArray *textures =
        [NSMutableArray arrayWithCapacity:10];
        // 2
        for (int i = 1; i < 4; i++) {
            NSString *textureName =
            [NSString stringWithFormat:@"zombie%d", i];
            SKTexture *texture =
            [SKTexture textureWithImageNamed:textureName];
            [textures addObject:texture];
        }
        // 3
        for (int i = 4; i > 1; i--) {
            NSString *textureName =
            [NSString stringWithFormat:@"zombie%d", i];
            SKTexture *texture =
            [SKTexture textureWithImageNamed:textureName];
            [textures addObject:texture];
        }
        // 4
        _zombieAnimation =
        [SKAction animateWithTextures:textures timePerFrame:0.1];
        // 5
        //[_zombie runAction:
        // [SKAction repeatActionForever:_zombieAnimation]];
        
        //[_zombie setScale:0.75]; // SKNode method
        
        [self runAction:[SKAction repeatActionForever:
                         [SKAction sequence:@[
                                              [SKAction performSelector:@selector(spawnEnemy)
                                                               onTarget:self],
                                              [SKAction waitForDuration:2.0]]]]];
        
        [self runAction:[SKAction repeatActionForever:
                         [SKAction sequence:@[
                                              [SKAction performSelector:@selector(spawnCat)
                                                               onTarget:self],
                                              [SKAction waitForDuration:1.0]]]]];
        
        _catCollisionSound = [SKAction playSoundFileNamed:@"hitCat.wav"
                                        waitForCompletion:NO];
        _enemyCollisionSound =
        [SKAction playSoundFileNamed:@"hitCatLady.wav"
                   waitForCompletion:NO];
        
        _currentLevel = 5;
        
    }
    return self;
}

//// Gesture recognizer example
//// Uncomment this, and comment the touchesBegan/Moved/Ended methods to test
//- (void)didMoveToView:(SKView *)view
//{
//  UITapGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//  [self.view addGestureRecognizer:tapRecognizer];
//}
//
//- (void)handleTap:(UITapGestureRecognizer *)recognizer {
//  CGPoint touchLocation = [recognizer locationInView:self.view];
//  touchLocation = [self convertPointFromView:touchLocation];
//  [self moveZombieToward:touchLocation];
//}

- (void)update:(NSTimeInterval)currentTime
{
    if (_lastUpdateTime) {
        _dt = currentTime - _lastUpdateTime;
    } else {
        _dt = 0;
    }
    _lastUpdateTime = currentTime;
    
    if (_pauseButtonPressed) {
        _lastUpdateTime = 0;
        return;
    }
    //NSLog(@"%0.2f milliseconds since last update", _dt * 1000);
    
    //CGPoint offset = CGPointSubtract(_lastTouchLocation, _zombie.position);
    //float distance = CGPointLength(offset);
    /*if (distance < ZOMBIE_MOVE_POINTS_PER_SEC * _dt) {
     _zombie.position = _lastTouchLocation;
     _velocity = CGPointZero;
     [self stopZombieAnimation];
     } else {*/
    [self moveSprite:_zombie velocity:_velocity];
    [self boundsCheckPlayer];
    [self rotateSprite:_zombie toFace:_velocity rotateRadiansPerSec:ZOMBIE_ROTATE_RADIANS_PER_SEC];
    //}
    
    [self moveTrain];
    [self moveBg];
    //[self checkCollisions];
    
    if (_lives <= 0 && !_gameOver) {
        _gameOver = YES;
        NSLog(@"You lose!");
        [_backgroundMusicPlayer stop];
        // 1
        SKScene * gameOverScene =
        [[GameOverScene alloc] initWithSize:self.size won4:NO];
        // 2
        SKTransition *reveal =
        [SKTransition flipHorizontalWithDuration:0.5];
        // 3
        [self.view presentScene:gameOverScene transition:reveal];
        
    }
    
}

- (void)didEvaluateActions {
    [self checkCollisions];
}

- (void)moveSprite:(SKSpriteNode *)sprite
          velocity:(CGPoint)velocity
{
    // 1
    CGPoint amountToMove = CGPointMultiplyScalar(velocity, _dt);
    //NSLog(@"Amount to move: %@",
    //      NSStringFromCGPoint(amountToMove));
    
    // 2
    sprite.position = CGPointAdd(sprite.position, amountToMove);
}

- (void)moveZombieToward:(CGPoint)location
{
    [self startZombieAnimation];
    _lastTouchLocation = location;
    CGPoint offset = CGPointSubtract(location, _zombie.position);
    
    CGPoint direction = CGPointNormalize(offset);
    _velocity = CGPointMultiplyScalar(direction, ZOMBIE_MOVE_POINTS_PER_SEC);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:_bgLayer];
    [self moveZombieToward:touchLocation];
    
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if (node == _pauseButton) {
        [_pauseButton setTexture:[SKTexture textureWithImageNamed:@"pausebutton"]];
        _pauseButtonPressed = YES;
        _playButtonPressed = NO;
        [_backgroundMusicPlayer stop];
        self.scene.paused = YES;
    }
    
    if (node == _playButton) {
        [_playButton setTexture:[SKTexture textureWithImageNamed:@"playButton"]];
        _playButtonPressed = YES;
        _pauseButtonPressed = NO;
        [_backgroundMusicPlayer play];
        self.scene.paused = NO;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:_bgLayer];
    [self moveZombieToward:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:_bgLayer];
    [self moveZombieToward:touchLocation];
}

- (id)initWithSize:(CGSize)size showPauseButton:(BOOL)display {
    _pauseButtonPressed = display;
    return [self initWithSize:size];
}

- (id)initWithSize:(CGSize)size showPlayButton:(BOOL)display {
    _playButtonPressed = display;
    return [self initWithSize:size];
}

- (void)boundsCheckPlayer
{
    // 1
    CGPoint newPosition = _zombie.position;
    CGPoint newVelocity = _velocity;
    
    // 2
    CGPoint bottomLeft =
    [_bgLayer convertPoint:CGPointZero fromNode:self];
    CGPoint topRight =
    [_bgLayer convertPoint:CGPointMake(self.size.width,
                                       self.size.height)
                  fromNode:self];
    
    // 3
    if (newPosition.x <= bottomLeft.x) {
        newPosition.x = bottomLeft.x;
        newVelocity.x = -newVelocity.x;
    }
    if (newPosition.x >= topRight.x) {
        newPosition.x = topRight.x;
        newVelocity.x = -newVelocity.x;
    }
    if (newPosition.y <= bottomLeft.y) {
        newPosition.y = bottomLeft.y;
        newVelocity.y = -newVelocity.y;
    }
    if (newPosition.y >= topRight.y) {
        newPosition.y = topRight.y;
        newVelocity.y = -newVelocity.y;
    }
    
    // 4
    _zombie.position = newPosition;
    _velocity = newVelocity;
}

- (void)rotateSprite:(SKSpriteNode *)sprite
              toFace:(CGPoint)velocity
 rotateRadiansPerSec:(CGFloat)rotateRadiansPerSec
{
    float targetAngle = CGPointToAngle(velocity);
    float shortest = ScalarShortestAngleBetween(sprite.zRotation, targetAngle);
    float amtToRotate = rotateRadiansPerSec * _dt;
    if (ABS(shortest) < amtToRotate) {
        amtToRotate = ABS(shortest);
    }
    sprite.zRotation += ScalarSign(shortest) * amtToRotate;
}

- (void)startZombieAnimation
{
    if (![_zombie actionForKey:@"animation"]) {
        [_zombie runAction:
         [SKAction repeatActionForever:_zombieAnimation]
                   withKey:@"animation"];
    }
}

- (void)stopZombieAnimation
{
    [_zombie removeActionForKey:@"animation"];
}

- (void)spawnCat
{
    // 1
    SKSpriteNode *cat =
    [SKSpriteNode spriteNodeWithImageNamed:@"cat"];
    cat.name = @"cat";
    CGPoint catScenePos = CGPointMake(
                                      ScalarRandomRange(0, self.size.width),
                                      ScalarRandomRange(0, self.size.height));
    cat.position = [self convertPoint:catScenePos toNode:_bgLayer];
    cat.xScale = 0;
    cat.yScale = 0;
    [cat setScale:0.3];
    [_bgLayer addChild:cat];
    
    // 2
    cat.zRotation = -M_PI / 16;
    
    SKAction *appear = [SKAction scaleTo:1.0 duration:0.5];
    
    SKAction *leftWiggle = [SKAction rotateByAngle:M_PI / 8
                                          duration:0.5];
    SKAction *rightWiggle = [leftWiggle reversedAction];
    SKAction *fullWiggle =[SKAction sequence:
                           @[leftWiggle, rightWiggle]];
    //SKAction *wiggleWait =
    //  [SKAction repeatAction:fullWiggle count:10];
    //SKAction *wait = [SKAction waitForDuration:10.0];
    
    SKAction *scaleUp = [SKAction scaleBy:1.2 duration:0.25];
    SKAction *scaleDown = [scaleUp reversedAction];
    SKAction *fullScale = [SKAction sequence:
                           @[scaleUp, scaleDown, scaleUp, scaleDown]];
    
    SKAction *group = [SKAction group:@[fullScale, fullWiggle]];
    SKAction *groupWait = [SKAction repeatAction:group count:10];
    
    SKAction *disappear = [SKAction scaleTo:0.0 duration:0.5];
    SKAction *removeFromParent = [SKAction removeFromParent];
    [cat runAction:
     [SKAction sequence:@[appear, groupWait, disappear,
                          removeFromParent]]];
}

- (void)checkCollisions
{
    [_bgLayer enumerateChildNodesWithName:@"cat"
                               usingBlock:^(SKNode *node, BOOL *stop){
                                   SKSpriteNode *cat = (SKSpriteNode *)node;
                                   if (CGRectIntersectsRect(cat.frame, _zombie.frame)) {
                                       //[cat removeFromParent];
                                       [self runAction:_catCollisionSound];
                                       cat.name = @"train";
                                       [cat removeAllActions];
                                       [cat setScale:1];
                                       cat.zRotation = 0;
                                       [cat runAction:[SKAction colorizeWithColor:[SKColor greenColor] colorBlendFactor:1.0 duration:0.2]];
                                   }
                               }];
    
    if (_invincible) return;
    
    [_bgLayer enumerateChildNodesWithName:@"enemy3"
                               usingBlock:^(SKNode *node, BOOL *stop){
                                   SKSpriteNode *enemy3 = (SKSpriteNode *)node;
                                   CGRect smallerFrame = CGRectInset(enemy3.frame, 20, 20);
                                   if (CGRectIntersectsRect(smallerFrame, _zombie.frame)) {
                                       //[enemy removeFromParent];
                                       [self runAction:_enemyCollisionSound];
                                       [self loseCats];
                                       _lives--;
                                       _livesLabel.text = [NSString stringWithFormat:@"%d Lives", _lives];
                                       _invincible = YES;
                                       float blinkTimes = 10;
                                       float blinkDuration = 3.0;
                                       SKAction *blinkAction =
                                       [SKAction customActionWithDuration:blinkDuration
                                                              actionBlock:
                                        ^(SKNode *node, CGFloat elapsedTime) {
                                            float slice = blinkDuration / blinkTimes;
                                            float remainder = fmodf(elapsedTime, slice);
                                            node.hidden = remainder > slice / 2;
                                        }];
                                       SKAction *sequence = [SKAction sequence:@[blinkAction, [SKAction runBlock:^{
                                           _zombie.hidden = NO;
                                           _invincible = NO;
                                       }]]];
                                       [_zombie runAction:sequence];
                                   }
                               }];
}

- (void)moveTrain
{
    __block int trainCount = 0;
    __block CGPoint targetPosition = _zombie.position;
    [_bgLayer enumerateChildNodesWithName:@"train"
                               usingBlock:^(SKNode *node, BOOL *stop){
                                   trainCount++;
                                   if (!node.hasActions) {
                                       float actionDuration = 0.3;
                                       CGPoint offset = CGPointSubtract(targetPosition, node.position);
                                       CGPoint direction = CGPointNormalize(offset);
                                       CGPoint amountToMovePerSec = CGPointMultiplyScalar(direction, CAT_MOVE_POINTS_PER_SEC);
                                       CGPoint amountToMove = CGPointMultiplyScalar(amountToMovePerSec, actionDuration);
                                       SKAction *moveAction = [SKAction moveByX:amountToMove.x y:amountToMove.y duration:actionDuration];
                                       [node runAction:moveAction];
                                   }
                                   targetPosition = node.position;
                               }];
    if (trainCount >= 9 && !_gameOver) {
        _gameOver = YES;
        //NSLog(@"You win!");
        if (_currentLevel<9){
            _currentLevel++;
        }
        if (_currentLevel>1) {
            _currentLevel--;
        }
        [_backgroundMusicPlayer stop];
        // 1
        SKScene * gameOverScene =
        [[GameOverScene alloc] initWithSize:self.size won4:YES];
        // 2
        SKTransition *reveal =
        [SKTransition flipHorizontalWithDuration:0.5];
        // 3
        [self.view presentScene:gameOverScene transition:reveal];
    }
    
}

- (void)loseCats
{
    // 1
    __block int loseCount = 0;
    [_bgLayer enumerateChildNodesWithName:@"train" usingBlock:
     ^(SKNode *node, BOOL *stop) {
         
         // 2
         CGPoint randomSpot = node.position;
         randomSpot.x += ScalarRandomRange(-100, 100);
         randomSpot.y += ScalarRandomRange(-100, 100);
         
         // 3
         node.name = @"";
         [node runAction:
          [SKAction sequence:@[[SKAction group:@[[SKAction rotateByAngle:M_PI * 4 duration:1.0], [SKAction moveTo:randomSpot duration:1.0], [SKAction scaleTo:0 duration:1.0]]], [SKAction removeFromParent]]]];
         
         // 4
         loseCount++;
         if (loseCount >= 2) {
             *stop = YES;
         }
     }];
}

- (void)playBackgroundMusic:(NSString *)filename
{
    NSError *error;
    NSURL *backgroundMusicURL =
    [[NSBundle mainBundle] URLForResource:filename
                            withExtension:nil];
    _backgroundMusicPlayer =
    [[AVAudioPlayer alloc]
     initWithContentsOfURL:backgroundMusicURL error:&error];
    _backgroundMusicPlayer.numberOfLoops = -1;
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
}

- (void)moveBg
{
    CGPoint bgVelocity = CGPointMake(-BG_POINTS_PER_SEC, 0);
    CGPoint amtToMove = CGPointMultiplyScalar(bgVelocity, _dt);
    _bgLayer.position = CGPointAdd(_bgLayer.position, amtToMove);
    
    [_bgLayer enumerateChildNodesWithName:@"bg"
                               usingBlock:^(SKNode *node, BOOL *stop){
                                   SKSpriteNode * bg = (SKSpriteNode *) node;
                                   CGPoint bgScreenPos = [_bgLayer convertPoint:bg.position
                                                                         toNode:self];
                                   if (bgScreenPos.x <= -bg.size.width) {
                                       bg.position = CGPointMake(bg.position.x+bg.size.width*2,
                                                                 bg.position.y);
                                   }
                               }];
}


@end
