; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-unknown-linux-gnu < %s | FileCheck %s

define <4 x i1> @t32_3(<4 x i32> %X) nounwind {
; CHECK-LABEL: t32_3:
; CHECK:       // %bb.0:
; CHECK-NEXT:    adrp x8, .LCPI0_0
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI0_0]
; CHECK-NEXT:    mov w8, #43691 // =0xaaab
; CHECK-NEXT:    movk w8, #43690, lsl #16
; CHECK-NEXT:    sub v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    dup v1.4s, w8
; CHECK-NEXT:    adrp x8, .LCPI0_1
; CHECK-NEXT:    mul v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI0_1]
; CHECK-NEXT:    cmhs v0.4s, v1.4s, v0.4s
; CHECK-NEXT:    xtn v0.4h, v0.4s
; CHECK-NEXT:    ret
  %urem = urem <4 x i32> %X, <i32 3, i32 3, i32 3, i32 3>
  %cmp = icmp eq <4 x i32> %urem, <i32 0, i32 1, i32 2, i32 2>
  ret <4 x i1> %cmp
}

define <4 x i1> @t32_5(<4 x i32> %X) nounwind {
; CHECK-LABEL: t32_5:
; CHECK:       // %bb.0:
; CHECK-NEXT:    adrp x8, .LCPI1_0
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI1_0]
; CHECK-NEXT:    mov w8, #52429 // =0xcccd
; CHECK-NEXT:    movk w8, #52428, lsl #16
; CHECK-NEXT:    sub v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    dup v1.4s, w8
; CHECK-NEXT:    mov w8, #13106 // =0x3332
; CHECK-NEXT:    movk w8, #13107, lsl #16
; CHECK-NEXT:    mul v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    dup v1.4s, w8
; CHECK-NEXT:    cmhs v0.4s, v1.4s, v0.4s
; CHECK-NEXT:    xtn v0.4h, v0.4s
; CHECK-NEXT:    ret
  %urem = urem <4 x i32> %X, <i32 5, i32 5, i32 5, i32 5>
  %cmp = icmp eq <4 x i32> %urem, <i32 1, i32 2, i32 3, i32 4>
  ret <4 x i1> %cmp
}

define <4 x i1> @t32_6_part0(<4 x i32> %X) nounwind {
; CHECK-LABEL: t32_6_part0:
; CHECK:       // %bb.0:
; CHECK-NEXT:    adrp x8, .LCPI2_0
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI2_0]
; CHECK-NEXT:    mov w8, #43691 // =0xaaab
; CHECK-NEXT:    movk w8, #43690, lsl #16
; CHECK-NEXT:    sub v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    dup v1.4s, w8
; CHECK-NEXT:    mul v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    movi v1.16b, #170
; CHECK-NEXT:    shl v2.4s, v0.4s, #31
; CHECK-NEXT:    fneg v1.4s, v1.4s
; CHECK-NEXT:    usra v2.4s, v0.4s, #1
; CHECK-NEXT:    cmhs v0.4s, v1.4s, v2.4s
; CHECK-NEXT:    xtn v0.4h, v0.4s
; CHECK-NEXT:    ret
  %urem = urem <4 x i32> %X, <i32 6, i32 6, i32 6, i32 6>
  %cmp = icmp eq <4 x i32> %urem, <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i1> %cmp
}

define <4 x i1> @t32_6_part1(<4 x i32> %X) nounwind {
; CHECK-LABEL: t32_6_part1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    adrp x8, .LCPI3_0
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI3_0]
; CHECK-NEXT:    mov w8, #43691 // =0xaaab
; CHECK-NEXT:    movk w8, #43690, lsl #16
; CHECK-NEXT:    sub v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    dup v1.4s, w8
; CHECK-NEXT:    adrp x8, .LCPI3_1
; CHECK-NEXT:    mul v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    shl v1.4s, v0.4s, #31
; CHECK-NEXT:    usra v1.4s, v0.4s, #1
; CHECK-NEXT:    ldr q0, [x8, :lo12:.LCPI3_1]
; CHECK-NEXT:    cmhs v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    xtn v0.4h, v0.4s
; CHECK-NEXT:    ret
  %urem = urem <4 x i32> %X, <i32 6, i32 6, i32 6, i32 6>
  %cmp = icmp eq <4 x i32> %urem, <i32 4, i32 5, i32 0, i32 0>
  ret <4 x i1> %cmp
}

define <4 x i1> @t32_tautological(<4 x i32> %X) nounwind {
; CHECK-LABEL: t32_tautological:
; CHECK:       // %bb.0:
; CHECK-NEXT:    adrp x8, .LCPI4_0
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI4_0]
; CHECK-NEXT:    mov w8, #43691 // =0xaaab
; CHECK-NEXT:    movk w8, #43690, lsl #16
; CHECK-NEXT:    sub v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    dup v1.4s, w8
; CHECK-NEXT:    adrp x8, .LCPI4_1
; CHECK-NEXT:    mul v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ldr q1, [x8, :lo12:.LCPI4_1]
; CHECK-NEXT:    cmhs v0.4s, v1.4s, v0.4s
; CHECK-NEXT:    movi d1, #0x00ffffffff0000
; CHECK-NEXT:    xtn v0.4h, v0.4s
; CHECK-NEXT:    eor v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %urem = urem <4 x i32> %X, <i32 1, i32 1, i32 2, i32 3>
  %cmp = icmp eq <4 x i32> %urem, <i32 0, i32 1, i32 2, i32 2>
  ret <4 x i1> %cmp
}
