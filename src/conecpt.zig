pub fn isSignedIntegral(comptime Type: type) bool {
    return @typeInfo(Type) == .Int and @typeInfo(Type).Int.signedness == .signed;
}

pub fn signedIntegral(comptime Type: type) void {
    if (!isSignedIntegral(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int and .signedness == .signed");
}

pub fn isUnsignedIntegral(comptime Type: type) bool {
    return @typeInfo(Type) == .Int and @typeInfo(Type).Int.signedness == .unsigned;
}

pub fn unsignedIntegral(comptime Type: type) void {
    if (!isUnsignedIntegral(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int and .signedness == .unsigned");
}

pub fn isFloatingPoint(comptime Type: type) bool {
    return @typeInfo(Type) == .Float;
}

pub fn floatingPoint(comptime Type: type) void {
    if (!isFloatingPoint(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Float");
}

pub fn isFloatingPoint32(comptime Type: type) bool {
    return @typeInfo(Type) == .Float and @typeInfo(Type).Float.bits == 32;
}

pub fn floatingPoint32(comptime Type: type) void {
    if (!isFloatingPoint32(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Float and .bits == 32 (f32)");
}

pub fn isSignedNumeric(comptime Type: type) bool {
    return isSignedIntegral(Type) or isFloatingPoint(Type);
}

pub fn signedNumeric(comptime Type: type) void {
    if (!isSignedNumeric(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int or std.builtin.Type.Float");
}

pub fn isNumeric(comptime Type: type) bool {
    return isUnsignedIntegral(Type) or isSignedNumeric(Type);
}

pub fn numeric(comptime Type: type) void {
    if (!isNumeric(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int or std.builtin.Type.Float");
}

pub fn isBoolean(comptime Type: type) bool {
    return @typeInfo(Type) == .Bool;
}

pub fn boolean(comptime Type: type) void {
    if (!isBoolean(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Bool");
}

pub fn isArithmetic(comptime Type: type) bool {
    return isNumeric(Type) or isBoolean(Type);
}

pub fn arithmetic(comptime Type: type) void {
    if (!isArithmetic(Type))
        @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int, std.builtin.Type.Float, or std.builtin.Type.Bool");
}
