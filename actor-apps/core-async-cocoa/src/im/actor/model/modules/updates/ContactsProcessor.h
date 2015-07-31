//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/modules/updates/ContactsProcessor.java
//

#ifndef _ImActorModelModulesUpdatesContactsProcessor_H_
#define _ImActorModelModulesUpdatesContactsProcessor_H_

#include "J2ObjC_header.h"
#include "im/actor/model/modules/BaseModule.h"

@class IOSIntArray;
@class ImActorModelModulesModules;

@interface ImActorModelModulesUpdatesContactsProcessor : ImActorModelModulesBaseModule

#pragma mark Public

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules;

- (void)onContactsAddedWithIntArray:(IOSIntArray *)uid;

- (void)onContactsRemovedWithIntArray:(IOSIntArray *)uid;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUpdatesContactsProcessor)

FOUNDATION_EXPORT void ImActorModelModulesUpdatesContactsProcessor_initWithImActorModelModulesModules_(ImActorModelModulesUpdatesContactsProcessor *self, ImActorModelModulesModules *modules);

FOUNDATION_EXPORT ImActorModelModulesUpdatesContactsProcessor *new_ImActorModelModulesUpdatesContactsProcessor_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUpdatesContactsProcessor)

#endif // _ImActorModelModulesUpdatesContactsProcessor_H_
