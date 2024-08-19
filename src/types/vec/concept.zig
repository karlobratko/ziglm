const std = @import("std");
const mem = std.mem;

const concept = @import("../../common/concept.zig");

const FIELD_NAMES = "xyzw";

pub fn isVec(comptime Type: type) bool {
    const T = @typeInfo(Type);
    if (T != .Struct)
        return false;

    const fields = T.Struct.fields;
    if (fields.len == 0 or fields.len > 4)
        return false;

    return inline for (fields, 0..) |field, i| {
        if (!concept.isArithmetic(field.type) or field.name.len != 1 or field.name[0] != FIELD_NAMES[i])
            break false;
    } else true;
}

pub fn requireVec(comptime Type: type) void {
    if (!isVec(Type))
        @compileError("Invalid std.builtin.Type - does not satisfy Vec type requirements.");
}