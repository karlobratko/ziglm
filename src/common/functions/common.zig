const std = @import("std");
const math = std.math;

const concept = @import("../concept.zig");

pub inline fn abs(val: anytype) @TypeOf(val) {
    const T = @TypeOf(val);
    if (comptime concept.isFloatingPoint(T)) {
        return @abs(val);
    } else if (concept.isSignedNumeric(T)) {
        return @as(T, @intCast(@abs(val)));
    } else {
        return val;
    }
}

pub inline fn sign(val: anytype) @TypeOf(val) {
    return std.math.sign(val);
}

pub inline fn floor(val: anytype) @TypeOf(val) {
    return @floor(val);
}

pub inline fn ceil(val: anytype) @TypeOf(val) {
    return @ceil(val);
}

pub inline fn fract(val: anytype) @TypeOf(val) {
    return val - @floor(val);
}

pub inline fn mod(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return @mod(a, b);
}

pub inline fn max(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return @max(a, b);
}

pub inline fn min(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return @min(a, b);
}

pub inline fn clamp(val: anytype, low: @TypeOf(val), high: @TypeOf(val)) @TypeOf(val) {
    return math.clamp(val, low, high);
}

pub inline fn mix(a: anytype, b: @TypeOf(a), m: @TypeOf(a)) @TypeOf(a) {
    return (a * (1.0 - m)) + b * m;
}

pub inline fn step(edge: anytype, val: @TypeOf(edge)) @TypeOf(edge) {
    return if (edge > val) 0 else 1;
}

pub fn smoothstep(edge0: anytype, edge1: @TypeOf(edge0), val: @TypeOf(edge0)) @TypeOf(edge0) {
    const tmp = @min(@max((val - edge0) / (edge1 - edge0), 0.0), 1.0);
    return tmp * tmp * (3.0 - 2.0 * tmp);
}
