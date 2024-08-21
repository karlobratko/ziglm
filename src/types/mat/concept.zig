const std = @import("std");
const mem = std.mem;

const concept = @import("../vec/concept.zig");

const FIELD_NAME = "cols";

pub fn isMat(comptime Type: type) bool {
    const T = @typeInfo(Type);
    if (T != .Struct)
        return false;

    const fields = T.Struct.fields;
    if (fields.len != 1 or !@hasField(Type, FIELD_NAME))
        return false;

    const F = @typeInfo(fields[0].type);

    return F == .Array and F.Array.len >= 2 and F.Array.len <= 4 and concept.isVec(F.Array.child);
}

pub fn requireMat(comptime Type: type) void {
    if (!isMat(Type))
        @compileError("Invalid std.builtin.Type - does not satisfy Mat type requirements");
}
