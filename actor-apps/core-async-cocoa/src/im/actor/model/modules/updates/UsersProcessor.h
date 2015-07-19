//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/modules/updates/UsersProcessor.java
//

#ifndef _ImActorModelModulesUpdatesUsersProcessor_H_
#define _ImActorModelModulesUpdatesUsersProcessor_H_

#include "J2ObjC_header.h"
#include "im/actor/model/modules/BaseModule.h"

@class APAvatar;
@class ImActorModelModulesModules;
@protocol JavaUtilCollection;

@interface ImActorModelModulesUpdatesUsersProcessor : ImActorModelModulesBaseModule

#pragma mark Public

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger;

- (void)applyUsersWithJavaUtilCollection:(id<JavaUtilCollection>)updated
                             withBoolean:(jboolean)forced;

- (jboolean)hasUsersWithJavaUtilCollection:(id<JavaUtilCollection>)uids;

- (void)onUserAvatarChangedWithInt:(jint)uid
                      withAPAvatar:(APAvatar *)avatar;

- (void)onUserLocalNameChangedWithInt:(jint)uid
                         withNSString:(NSString *)name;

- (void)onUserNameChangedWithInt:(jint)uid
                    withNSString:(NSString *)name;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUpdatesUsersProcessor)

FOUNDATION_EXPORT void ImActorModelModulesUpdatesUsersProcessor_initWithImActorModelModulesModules_(ImActorModelModulesUpdatesUsersProcessor *self, ImActorModelModulesModules *messenger);

FOUNDATION_EXPORT ImActorModelModulesUpdatesUsersProcessor *new_ImActorModelModulesUpdatesUsersProcessor_initWithImActorModelModulesModules_(ImActorModelModulesModules *messenger) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUpdatesUsersProcessor)

#endif // _ImActorModelModulesUpdatesUsersProcessor_H_
