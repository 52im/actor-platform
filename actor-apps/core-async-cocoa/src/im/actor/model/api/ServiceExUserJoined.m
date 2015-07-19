//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/ServiceExUserJoined.java
//


#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/ServiceEx.h"
#include "im/actor/model/api/ServiceExUserJoined.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/droidkit/bser/util/SparseArray.h"
#include "java/io/IOException.h"

@implementation APServiceExUserJoined

- (instancetype)init {
  APServiceExUserJoined_init(self);
  return self;
}

- (jint)getHeader {
  return 17;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  if ([((BSBserValues *) nil_chk(values)) hasRemaining]) {
    [self setUnmappedObjectsWithImActorModelDroidkitBserUtilSparseArray:[values buildRemaining]];
  }
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if ([self getUnmappedObjects] != nil) {
    ImActorModelDroidkitBserUtilSparseArray *unmapped = [self getUnmappedObjects];
    for (jint i = 0; i < [((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(unmapped)) size]; i++) {
      jint key = [unmapped keyAtWithInt:i];
      [((BSBserWriter *) nil_chk(writer)) writeUnmappedWithInt:key withId:[unmapped getWithInt:key]];
    }
  }
}

- (NSString *)description {
  NSString *res = @"struct ServiceExUserJoined{";
  res = JreStrcat("$C", res, '}');
  return res;
}

@end

void APServiceExUserJoined_init(APServiceExUserJoined *self) {
  (void) APServiceEx_init(self);
}

APServiceExUserJoined *new_APServiceExUserJoined_init() {
  APServiceExUserJoined *self = [APServiceExUserJoined alloc];
  APServiceExUserJoined_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(APServiceExUserJoined)
