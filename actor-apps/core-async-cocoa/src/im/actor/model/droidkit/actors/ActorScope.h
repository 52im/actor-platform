//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/droidkit/actors/ActorScope.java
//

#ifndef _DKActorScope_H_
#define _DKActorScope_H_

#include "J2ObjC_header.h"

@class DKActor;
@class DKActorDispatcher;
@class DKActorEndpoint;
@class DKActorRef;
@class DKActorSystem;
@class DKMailbox;
@class DKProps;

@interface DKActorScope : NSObject

#pragma mark Public

- (instancetype)initWithDKActorSystem:(DKActorSystem *)actorSystem
                        withDKMailbox:(DKMailbox *)mailbox
                withDKActorDispatcher:(DKActorDispatcher *)dispatcher
                         withNSString:(NSString *)path
                          withDKProps:(DKProps *)props
                  withDKActorEndpoint:(DKActorEndpoint *)endpoint;

- (DKActor *)getActor;

- (DKActorRef *)getActorRef;

- (DKActorSystem *)getActorSystem;

- (DKActorDispatcher *)getDispatcher;

- (DKActorEndpoint *)getEndpoint;

- (DKMailbox *)getMailbox;

- (NSString *)getPath;

- (DKProps *)getProps;

- (DKActorRef *)getSender;

- (void)onActorCreatedWithDKActor:(DKActor *)actor;

- (void)onActorDie;

- (void)setSenderWithDKActorRef:(DKActorRef *)sender;

@end

J2OBJC_EMPTY_STATIC_INIT(DKActorScope)

FOUNDATION_EXPORT void DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(DKActorScope *self, DKActorSystem *actorSystem, DKMailbox *mailbox, DKActorDispatcher *dispatcher, NSString *path, DKProps *props, DKActorEndpoint *endpoint);

FOUNDATION_EXPORT DKActorScope *new_DKActorScope_initWithDKActorSystem_withDKMailbox_withDKActorDispatcher_withNSString_withDKProps_withDKActorEndpoint_(DKActorSystem *actorSystem, DKMailbox *mailbox, DKActorDispatcher *dispatcher, NSString *path, DKProps *props, DKActorEndpoint *endpoint) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(DKActorScope)

typedef DKActorScope ImActorModelDroidkitActorsActorScope;

#endif // _DKActorScope_H_
