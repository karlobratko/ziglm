pub fn isSignedIntegral(comptime Type: type) bool {
    return @typeInfo(Type) == .Int and @typeInfo(Type).Int.signedness == .signed;
}

pub fn requireSignedIntegral(comptime Type: type) void {
    if (!isSignedIntegral(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Int and .signedness == .signed");
}

pub fn isUnsignedIntegral(comptime Type: type) bool {
    return @typeInfo(Type) == .Int and @typeInfo(Type).Int.signedness == .unsigned;
}

pub fn requireUnsignedIntegral(comptime Type: type) void {
    if (!isUnsignedIntegral(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Int and .signedness == .unsigned");
}

pub fn isFloatingPoint(comptime Type: type) bool {
    return @typeInfo(Type) == .Float;
}

pub fn requireFloatingPoint(comptime Type: type) void {
    if (!isFloatingPoint(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Float");
}

pub fn isFloatingPoint32(comptime Type: type) bool {
    return @typeInfo(Type) == .Float and @typeInfo(Type).Float.bits == 32;
}

pub fn requireFloatingPoint32(comptime Type: type) void {
    if (!isFloatingPoint32(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Float and .bits == 32 (f32)");
}

pub fn isSignedNumeric(comptime Type: type) bool {
    return isSignedIntegral(Type) or isFloatingPoint(Type);
}

pub fn requireSignedNumeric(comptime Type: type) void {
    if (!isSignedNumeric(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Int or std.builtin.Type.Float");
}

pub fn isNumeric(comptime Type: type) bool {
    return isUnsignedIntegral(Type) or isSignedNumeric(Type);
}

pub fn requireNumeric(comptime Type: type) void {
    if (!isNumeric(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Int or std.builtin.Type.Float");
}

pub fn isBoolean(comptime Type: type) bool {
    return @typeInfo(Type) == .Bool;
}

pub fn requireBoolean(comptime Type: type) void {
    if (!isBoolean(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Bool");
}

pub fn isArithmetic(comptime Type: type) bool {
    return isNumeric(Type) or isBoolean(Type);
}

pub fn requireArithmetic(comptime Type: type) void {
    if (!isArithmetic(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.Int, std.builtin.Type.Float, or std.builtin.Type.Bool");
}
