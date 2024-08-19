const std = @import("std");

const common = @import("common.zig");
const concept = @import("../concept.zig");

pub inline fn length(val: anytype) @TypeOf(val) {
    return common.abs(val);
}

pub inline fn distance(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return length(a - b);
}

pub inline fn dot(a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    return a * b;
}

pub inline fn normalize(val: anytype) @TypeOf(val) {
    return 1.0;
}

pub inline fn faceforward(ori: anytype, inc: @TypeOf(ori), ref: @TypeOf(ori)) @TypeOf(ori) {
    return if (dot(ref, inc) < 0) ori else -ori;
}

pub inline fn reflect(inc: anytype, norm: @TypeOf(inc)) @TypeOf(inc) {
    return inc - (norm * dot(norm, inc) * 2);
}

pub fn refract(inc: anytype, norm: @TypeOf(inc), eta: @TypeOf(inc)) @TypeOf(inc) {
    const d = dot(norm, inc);
    const k = 1.0 - eta * eta * (1.0 - d * d);

    return if (k < 0.0) 0.0 else (inc * eta) - (norm * ((eta * d) + @sqrt(k)));
}
