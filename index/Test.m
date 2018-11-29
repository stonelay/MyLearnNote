//
//  HBFancySection.m
//  HBFancyTableViewDemo
//
//  Created by tony zhou on 16/4/3.
//  Copyright (c) 2016年 tony zhou. All rights reserved.
//

#import "HBFancyRow.h"
#import "HBFancySection.h"

@interface HBFancySection ()
@property (nonatomic, strong, readwrite) NSMutableArray<__kindof HBFancyRow *> *innerRows;
@end

@implementation HBFancySection

- (instancetype)init {
    self = [super init];
    if (self) {
        _innerRows = [NSMutableArray array];
    }
    return self;
}

- (NSArray<__kindof HBFancyRow *> *)rows {
    return [self.innerRows copy];
}

- (HBFancyRow *)rowAtIdx:(NSInteger)idx {
    if (self.innerRows.count > idx) {
        return self.innerRows[idx];
    }
    return nil;
}

- (void)appendRows:(NSArray<__kindof HBFancyRow *> *)rows {

    [self.innerRows addObjectsFromArray:rows];
}

- (void)insertRows:(NSArray<__kindof HBFancyRow *> *)rows atIdx:(NSUInteger)idx {
    if (rows.count > 0) {
        NSInteger index = self.innerRows.count > idx ? idx : self.innerRows.count;
        [rows enumerateObjectsUsingBlock:^(__kindof HBFancyRow *obj, NSUInteger i, BOOL *stop) {
            [self.innerRows insertObject:obj atIndex:(index + i)];
        }];
    }
}

- (void)deleteRowsForIdxs:(NSArray<NSNumber *> *)idxs {
    NSMutableIndexSet *deleteIndexSet = [[NSMutableIndexSet alloc] init];
    [idxs enumerateObjectsUsingBlock:^(NSNumber *i, NSUInteger idx, BOOL *stop) {
        if (self.innerRows.count > i.unsignedIntegerValue) {
            [deleteIndexSet addIndex:i.unsignedIntegerValue];
        }
    }];
    [self.innerRows removeObjectsAtIndexes:deleteIndexSet];
}

- (void)deleteRowsForProtype:(NSString *)protype {

    NSMutableIndexSet *deleteIndexSet = [[NSMutableIndexSet alloc] init];
    [self.innerRows enumerateObjectsUsingBlock:^(__kindof HBFancyRow *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([protype isKindOfClass:[NSString class]] && [protype isEqualToString:obj.protoType]) {
            [deleteIndexSet addIndex:idx];
        }
    }];
    [self.innerRows removeObjectsAtIndexes:deleteIndexSet];
}

- (void)moveRowFromIdx:(NSUInteger)fromIdx toIndex:(NSUInteger)toIdx {
    if (self.innerRows.count <= fromIdx) {
        return;
    }
    if (self.innerRows.count <= toIdx) {
        return;
    }
    if (fromIdx == toIdx) {
        return;
    }
    HBFancyRow *rowData = self.innerRows[fromIdx];
    [self.innerRows removeObjectAtIndex:fromIdx];
    [self.innerRows insertObject:rowData atIndex:(fromIdx > toIdx ? toIdx : (toIdx - 1))];
}

- (void)replaceSectionWithRows:(NSArray<__kindof HBFancyRow *> *)rows {
    self.innerRows = [rows mutableCopy];
}

@end
