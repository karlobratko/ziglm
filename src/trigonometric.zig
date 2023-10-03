const std = @import("std");

pub fn radians(deg: anytype) @TypeOf(deg) {
    return deg * 0.017453292519943295769236907684886127134428718885417;
}

pub fn degrees(rad: anytype) @TypeOf(rad) {
    return rad * 57.29577951308232087679815481410517033240547246656442;
}

pub fn sin(val: anytype) @TypeOf(val) {
    return @sin(val);
}

pub fn cos(val: anytype) @TypeOf(val) {
    return @cos(val);
}

pub fn tan(val: anytype) @TypeOf(val) {
    return @tan(val);
}

pub fn asin(val: anytype) @TypeOf(val) {
    return std.math.asin(val);
}

pub fn acos(val: anytype) @TypeOf(val) {
    return std.math.acos(val);
}

pub fn atan(val: anytype) @TypeOf(val) {
    return std.math.atan(val);
}
