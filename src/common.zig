const std = @import("std");
const concept = @import("concept.zig");

pub fn abs(val: anytype) @TypeOf(val) {
    return if (comptime concept.isFloatingPoint(@TypeOf(val))) @fabs(val) else std.math.absInt(val) catch (comptime std.math.maxInt(@TypeOf(val)));
}

pub fn sign(val: anytype) @TypeOf(val) {
    return std.math.sign(val);
}

pub fn floor(val: anytype) @TypeOf(val) {
    return @floor(val);
}

pub fn ceil(val: anytype) @TypeOf(val) {
    return @ceil(val);
}

pub fn fract(val: anytype) @TypeOf(val) {
    return val - @floor(val);
}

pub fn mod(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return @mod(a, b);
}

pub fn max(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return @max(a, b);
}

pub fn min(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return @min(a, b);
}

pub fn clamp(val: anytype, low: @TypeOf(val), high: @TypeOf(val)) @TypeOf(val) {
    return std.math.clamp(val, low, high);
}

pub fn mix(a: anytype, b: @TypeOf(a), m: @TypeOf(a)) @TypeOf(a) {
    return (a * (1.0 - m)) + b * m;
}

pub fn step(edge: anytype, val: @TypeOf(edge)) @TypeOf(edge) {
    return if (edge > val) 0 else 1;
}

pub fn smoothstep(edge0: anytype, edge1: @TypeOf(edge0), val: @TypeOf(edge0)) @TypeOf(edge0) {
    var tmp = @min(@max((val - edge0) / (edge1 - edge0), 0.0), 1.0);
    return tmp * tmp * (3.0 - 2.0 * tmp);
}
