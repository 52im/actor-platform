//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core-async/src/main/java/im/actor/model/modules/DisplayLists.java
//

#ifndef _ImActorModelModulesDisplayLists_H_
#define _ImActorModelModulesDisplayLists_H_

#include "J2ObjC_header.h"
#include "im/actor/model/modules/BaseModule.h"

@class AMBindedDisplayList;
@class AMMessengerEnvironmentEnum;
@class AMPeer;
@class ImActorModelModulesModules;

#define ImActorModelModulesDisplayLists_LOAD_GAP 5
#define ImActorModelModulesDisplayLists_LOAD_PAGE 20

@interface ImActorModelModulesDisplayLists : ImActorModelModulesBaseModule

#pragma mark Public

- (instancetype)initWithAMMessengerEnvironmentEnum:(AMMessengerEnvironmentEnum *)environment
                    withImActorModelModulesModules:(ImActorModelModulesModules *)modules;

- (AMBindedDisplayList *)buildMediaListWithAMPeer:(AMPeer *)peer
                                      withBoolean:(jboolean)isGlobalList;

- (AMBindedDisplayList *)buildNewChatListWithAMPeer:(AMPeer *)peer
                                        withBoolean:(jboolean)isGlobalList;

- (AMBindedDisplayList *)buildNewContactListWithBoolean:(jboolean)isGlobalList;

- (AMBindedDisplayList *)buildNewDialogsListWithBoolean:(jboolean)isGlobalList;

- (AMBindedDisplayList *)buildNewSearchListWithBoolean:(jboolean)isGlobalList;

- (AMBindedDisplayList *)getContactsGlobalList;

- (AMBindedDisplayList *)getDialogsGlobalList;

- (jint)getMediaCountWithAMPeer:(AMPeer *)peer;

- (AMBindedDisplayList *)getMessagesGlobalListWithAMPeer:(AMPeer *)peer;

- (AMBindedDisplayList *)getMessagesMediaListWithAMPeer:(AMPeer *)peer;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesDisplayLists)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesDisplayLists, LOAD_GAP, jint)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelModulesDisplayLists, LOAD_PAGE, jint)

FOUNDATION_EXPORT void ImActorModelModulesDisplayLists_initWithAMMessengerEnvironmentEnum_withImActorModelModulesModules_(ImActorModelModulesDisplayLists *self, AMMessengerEnvironmentEnum *environment, ImActorModelModulesModules *modules);

FOUNDATION_EXPORT ImActorModelModulesDisplayLists *new_ImActorModelModulesDisplayLists_initWithAMMessengerEnvironmentEnum_withImActorModelModulesModules_(AMMessengerEnvironmentEnum *environment, ImActorModelModulesModules *modules) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesDisplayLists)

#endif // _ImActorModelModulesDisplayLists_H_
