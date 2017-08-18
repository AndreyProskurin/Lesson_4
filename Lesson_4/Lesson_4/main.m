//
//  main.m
//  Lesson_4
//
//  Created by Andrey Proskurin on 18.08.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFriend : NSObject {
    
    NSInteger _age;
    NSString *_name;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setAge:(NSInteger)age;
- (NSInteger)age;

- (void)trollSomeOne;

@end

@implementation MyFriend

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setAge:(NSInteger)age {
    _age = age;
}

-(NSInteger)age {
    return _age;
}

- (void)trollSomeOne {
    NSLog(@"%@", [self generateMem]); // инкапсуляция
}

- (NSString *)generateMem {
    return @"Generate some mem";
}

@end

@interface MyBestFriend : MyFriend {
    
}

@end

@implementation MyBestFriend

- (void) trollSomeOne {
    [super trollSomeOne];
    NSLog(@"Съесть све мемы без генерации!");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // Выделение памяти
        
//        MyFriend *friend = [MyFriend new]; // the same
        MyFriend *friend = [[MyFriend alloc] init];
        MyBestFriend *bestFriend = [MyBestFriend new];
        
        
        
//        friend.name = @"Alex"; // the same
//        friend.age = 22;       // the same
        [friend setName:@"Alex"];
        [friend setAge:22];
        [bestFriend setName:@"Vitya"]; // наследование (свойств и методов от суперкласса (реализация и интерфейс класса потомка - пустые)
        [bestFriend setAge:24];        // наследование (--||--||--)
        
        NSLog(@"name = %@, age = %lu", friend.name, friend.age);
        
        [friend trollSomeOne];      // полиморфизм
        [bestFriend trollSomeOne];  // полиморфизм
        
    }
    return 0;
}
