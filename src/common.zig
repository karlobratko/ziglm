const std = @import("std");

pub fn qrsqrt(number: f32) f32 {
    const y = @as(f32, @bitCast(0x5f3759df - (@as(u32, @bitCast(number)) >> 1)));
    return y * (1.5 - (number * 0.5 * y * y));
}

pub fn radians(deg: anytype) @TypeOf(deg) {
    return std.math.pi * deg / 180.0;
}

pub fn degrees(rad: anytype) @TypeOf(rad) {
    return 180.0 * rad / std.math.pi;
}
