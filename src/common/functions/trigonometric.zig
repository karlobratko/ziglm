const std = @import("std");
const math = std.math;

const DEG2RAD = 0.017453292519943295769236907684886127134428718885417;

const RAD2DEG = 57.29577951308232087679815481410517033240547246656442;

pub inline fn radians(deg: anytype) @TypeOf(deg) {
    return deg * DEG2RAD;
}

pub inline fn degrees(rad: anytype) @TypeOf(rad) {
    return rad * RAD2DEG;
}

pub inline fn sin(val: anytype) @TypeOf(val) {
    return @sin(val);
}

pub inline fn cos(val: anytype) @TypeOf(val) {
    return @cos(val);
}

pub inline fn tan(val: anytype) @TypeOf(val) {
    return @tan(val);
}

pub inline fn asin(val: anytype) @TypeOf(val) {
    return math.asin(val);
}

pub inline fn acos(val: anytype) @TypeOf(val) {
    return math.acos(val);
}

pub inline fn atan(val: anytype) @TypeOf(val) {
    return math.atan(val);
}
