//
//  ViewController.m
//  DemoPlayFabiOSObjectiveC
//
//  Created by  on 7/21/16.
//  Copyright © 2016 framgia. All rights reserved.
//

#import "ViewController.h"
#import "PlayFabSDK.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self registerAccount];
    [self login];
}

- (void)registerAccount {
    RegisterPlayFabUserRequest *registerRequest = [RegisterPlayFabUserRequest new];
    registerRequest.TitleId = PlayFabSettings.TitleId;
    registerRequest.Username = @"thieumao";
    registerRequest.Email = @"thieumao@gmail.com";
    registerRequest.Password = @"123456";
    registerRequest.DisplayName = @"Thieu Mao is here";
    
    [[PlayFabClientAPI GetInstance] RegisterPlayFabUser:registerRequest success:^(RegisterPlayFabUserResult *result, NSObject *userData) {
        NSLog(@"Register Success");
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Register Fail");
        NSLog(@"%@", error.errorMessage);
    } withUserData:nil];
}

- (void)login {
    LoginWithPlayFabRequest *loginRequest = [LoginWithPlayFabRequest new];
    loginRequest.TitleId = PlayFabSettings.TitleId;
    loginRequest.Username = @"thieumao";
    loginRequest.Password = @"123456";
    
    [[PlayFabClientAPI GetInstance] LoginWithPlayFab:loginRequest success:^(LoginResult *result, NSObject *userData) {
        NSLog(@"Login success");
//        [self getTitleData];
//        [self setPlayerDataTitle];
//        [self getPlayerDataTitle];
//        [self setPlayerDataPublisher];
        [self getPlayerDataPublisher];
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Login fail");
    } withUserData:nil];
}

- (void)getTitleData {
    GetTitleDataRequest *getTitleDataRequest = [GetTitleDataRequest new];
    
    [[PlayFabClientAPI GetInstance] GetTitleData:getTitleDataRequest success:^(GetTitleDataResult *result, NSObject *userData) {
        NSLog(@"Title Data: %@", result.Data);
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Error get title data");
    } withUserData:nil];
}

- (void)setPlayerDataTitle {
    UpdateUserDataRequest *dataRequest = [UpdateUserDataRequest new];
    dataRequest.Data = @{@"key1":@"Data 1", @"key2":@"Data 2"};
    
    [[PlayFabClientAPI GetInstance] UpdateUserData:dataRequest success:^(UpdateUserDataResult *result, NSObject *userData) {
        NSLog(@"Update data success");
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Update data faileses");
    } withUserData:nil];
}

- (void)getPlayerDataTitle {
    GetUserDataRequest *dataRequest = [GetUserDataRequest new];
    
    [[PlayFabClientAPI GetInstance] GetUserData:dataRequest success:^(GetUserDataResult *result, NSObject *userData) {
        NSLog(@"Data %@", result.Data);
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Get fail");
    } withUserData:nil];
}

- (void)setPlayerDataPublisher {
    UpdateUserDataRequest *dataRequest = [UpdateUserDataRequest new];
    dataRequest.Data = @{@"key11":@"Data 1 1", @"key22":@"Data 2 2"};
    
    [[PlayFabClientAPI GetInstance] UpdateUserPublisherData:dataRequest success:^(UpdateUserDataResult *result, NSObject *userData) {
        NSLog(@"Update user publisher data success");
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Update user publisher data fail");
    } withUserData:nil];
}

- (void)getPlayerDataPublisher {
    GetUserDataRequest *dataRequest = [GetUserDataRequest new];
    
    [[PlayFabClientAPI GetInstance] GetUserPublisherData:dataRequest success:^(GetUserDataResult *result, NSObject *userData) {
        NSLog(@"Get player data publisher success %@", result.Data);
    } failure:^(PlayFabError *error, NSObject *userData) {
        NSLog(@"Get player data publisher fail");
    } withUserData:nil];
}

@end
