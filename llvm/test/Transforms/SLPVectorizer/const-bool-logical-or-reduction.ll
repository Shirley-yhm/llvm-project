; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 3
; RUN: opt -passes=slp-vectorizer -S < %s | FileCheck %s

define i1 @test(i32 %inc) {
; CHECK-LABEL: define i1 @test(
; CHECK-SAME: i32 [[INC:%.*]]) {
; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i32 [[INC]], 3
; CHECK-NEXT:    [[OP_RDX:%.*]] = select i1 poison, i1 true, i1 [[CMP]]
; CHECK-NEXT:    ret i1 [[OP_RDX]]
;
  %cmp = icmp ult i32 %inc, 3
  %sel1 = select i1 %cmp, i1 true, i1 poison
  %sel2 = select i1 %sel1, i1 true, i1 poison
  %sel3 = select i1 %sel2, i1 true, i1 poison
  ret i1 %sel3
}
