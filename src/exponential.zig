const std = @import("std");
const concept = @import("concept.zig");

pub fn pow(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return std.math.pow(@TypeOf(a), a, b);
}

pub fn exp(val: anytype) @TypeOf(val) {
    return @exp(val);
}

pub fn log(val: anytype) @TypeOf(val) {
    return @log(val);
}

pub fn exp2(val: anytype) @TypeOf(val) {
    return @exp2(val);
}

pub fn log2(val: anytype) @TypeOf(val) {
    return @log2(val);
}

pub fn sqrt(val: anytype) @TypeOf(val) {
    return @sqrt(val);
}

fn qrsqrt(number: f32) f32 {
    const y = @as(f32, @bitCast(0x5f3759df - (@as(u32, @bitCast(number)) >> 1)));
    return y * (1.5 - (number * 0.5 * y * y));
}

pub fn inversesqrt(val: anytype) @TypeOf(val) {
    return if (comptime concept.isFloatingPoint32(@TypeOf(val))) qrsqrt(val) else 1 / @sqrt(val);
}
