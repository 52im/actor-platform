//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/entity/ContactRecordType.java
//


#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/entity/ContactRecordType.h"
#include "java/lang/Enum.h"
#include "java/lang/IllegalArgumentException.h"

__attribute__((unused)) static void AMContactRecordTypeEnum_initWithNSString_withInt_(AMContactRecordTypeEnum *self, NSString *__name, jint __ordinal);

__attribute__((unused)) static AMContactRecordTypeEnum *new_AMContactRecordTypeEnum_initWithNSString_withInt_(NSString *__name, jint __ordinal) NS_RETURNS_RETAINED;

J2OBJC_INITIALIZED_DEFN(AMContactRecordTypeEnum)

AMContactRecordTypeEnum *AMContactRecordTypeEnum_values_[2];

@implementation AMContactRecordTypeEnum

- (instancetype)initWithNSString:(NSString *)__name
                         withInt:(jint)__ordinal {
  AMContactRecordTypeEnum_initWithNSString_withInt_(self, __name, __ordinal);
  return self;
}

IOSObjectArray *AMContactRecordTypeEnum_values() {
  AMContactRecordTypeEnum_initialize();
  return [IOSObjectArray arrayWithObjects:AMContactRecordTypeEnum_values_ count:2 type:AMContactRecordTypeEnum_class_()];
}

+ (IOSObjectArray *)values {
  return AMContactRecordTypeEnum_values();
}

+ (AMContactRecordTypeEnum *)valueOfWithNSString:(NSString *)name {
  return AMContactRecordTypeEnum_valueOfWithNSString_(name);
}

AMContactRecordTypeEnum *AMContactRecordTypeEnum_valueOfWithNSString_(NSString *name) {
  AMContactRecordTypeEnum_initialize();
  for (int i = 0; i < 2; i++) {
    AMContactRecordTypeEnum *e = AMContactRecordTypeEnum_values_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

+ (void)initialize {
  if (self == [AMContactRecordTypeEnum class]) {
    AMContactRecordTypeEnum_PHONE = new_AMContactRecordTypeEnum_initWithNSString_withInt_(@"PHONE", 0);
    AMContactRecordTypeEnum_EMAIL = new_AMContactRecordTypeEnum_initWithNSString_withInt_(@"EMAIL", 1);
    J2OBJC_SET_INITIALIZED(AMContactRecordTypeEnum)
  }
}

@end

void AMContactRecordTypeEnum_initWithNSString_withInt_(AMContactRecordTypeEnum *self, NSString *__name, jint __ordinal) {
  (void) JavaLangEnum_initWithNSString_withInt_(self, __name, __ordinal);
}

AMContactRecordTypeEnum *new_AMContactRecordTypeEnum_initWithNSString_withInt_(NSString *__name, jint __ordinal) {
  AMContactRecordTypeEnum *self = [AMContactRecordTypeEnum alloc];
  AMContactRecordTypeEnum_initWithNSString_withInt_(self, __name, __ordinal);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMContactRecordTypeEnum)
