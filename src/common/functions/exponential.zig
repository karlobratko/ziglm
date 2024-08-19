const std = @import("std");
const math = std.math;

const concept = @import("../concept.zig");

pub inline fn pow(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return math.pow(@TypeOf(a), a, b);
}

pub inline fn exp(val: anytype) @TypeOf(val) {
    return @exp(val);
}

pub inline fn log(val: anytype) @TypeOf(val) {
    return @log(val);
}

pub inline fn exp2(val: anytype) @TypeOf(val) {
    return @exp2(val);
}

pub inline fn log2(val: anytype) @TypeOf(val) {
    return @log2(val);
}

pub inline fn sqrt(val: anytype) @TypeOf(val) {
    return @sqrt(val);
}

fn qrsqrt(number: f32) f32 {
    const y = @as(f32, @bitCast(0x5f3759df - (@as(u32, @bitCast(number)) >> 1)));
    return y * (1.5 - (number * 0.5 * y * y));
}

pub inline fn inversesqrt(val: anytype) @TypeOf(val) {
    return if (comptime concept.isFloatingPoint32(@TypeOf(val))) qrsqrt(val) else 1 / @sqrt(val);
}
