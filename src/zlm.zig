const std = @import("std");
const testing = std.testing;

pub fn radians(deg: anytype) @TypeOf(deg) {
    return std.math.pi * deg / 180.0;
}

pub fn degrees(rad: anytype) @TypeOf(rad) {
    return 180.0 * rad / std.math.pi;
}

const Concept = struct {
    pub fn isIntegral(comptime Type: type) bool {
        return @typeInfo(Type) == .Int;
    }

    pub fn integral(comptime Type: type) void {
        if (!isIntegral(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int");
    }

    pub fn isSignedIntegral(comptime Type: type) bool {
        return isIntegral(Type) and @typeInfo(Type).Int.signedness == .signed;
    }

    pub fn signedIntegral(comptime Type: type) void {
        if (!isSignedIntegral(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int");
    }

    pub fn isFloatingPoint(comptime Type: type) bool {
        return @typeInfo(Type) == .Float;
    }

    pub fn floatingPoint(comptime Type: type) void {
        if (!isFloatingPoint(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Float");
    }

    pub fn isBoolean(comptime Type: type) bool {
        return @typeInfo(Type) == .Bool;
    }

    pub fn boolean(comptime Type: type) void {
        if (!isBoolean(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Bool");
    }

    pub fn isNumeric(comptime Type: type) bool {
        return isIntegral(Type) or isFloatingPoint(Type);
    }

    pub fn numeric(comptime Type: type) void {
        if (!isNumeric(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int or std.builtin.Type.Float");
    }

    pub fn isSignedNumeric(comptime Type: type) bool {
        return isSignedIntegral(Type) or isFloatingPoint(Type);
    }

    pub fn signedNumeric(comptime Type: type) void {
        if (!isSignedNumeric(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int or std.builtin.Type.Float");
    }

    pub fn isArithmetic(comptime Type: type) bool {
        return isIntegral(Type) or isFloatingPoint(Type) or isBoolean(Type);
    }

    pub fn arithmetic(comptime Type: type) void {
        if (!isArithmetic(Type))
            @compileError("Vec: invalid 'RealType' std.builtin.Type - should be std.builtin.Type.Int, std.builtin.Type.Float, or std.builtin.Type.Bool");
    }
};

const Arithmetic = struct {
    pub fn zero(comptime Type: type) Type {
        return if (Concept.isBoolean(Type)) false else 0;
    }

    pub fn one(comptime Type: type) Type {
        return if (Concept.isBoolean(Type)) true else 1;
    }
};

fn VecMixin(comptime len: comptime_int, comptime RealType: type, comptime VecType: type) type {
    return struct {
        const dimens = len;
        const origin = asAll(Arithmetic.zero(RealType));

        // conversion functions
        pub fn asAll(val: RealType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = val;
            return res;
        }

        pub fn fromVec(comptime from_len: comptime_int, vec: Vec(from_len, RealType)) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields, 0..) |fld, idx|
                @field(res, fld.name) = if (idx < from_len) @field(vec, fld.name) else (comptime Arithmetic.zero(RealType));

            return res;
        }

        pub fn fromVector(comptime from_len: comptime_int, vec: @Vector(from_len, RealType)) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields, 0..) |fld, idx|
                @field(res, fld.name) = if (idx < from_len) vec[idx] else (comptime Arithmetic.zero(RealType));

            return res;
        }

        pub fn toVec(vec: VecType, comptime to_len: comptime_int) Vec(to_len, RealType) {
            var res: Vec(to_len, RealType) = undefined;
            inline for (@typeInfo(Vec(to_len, RealType)).Struct.fields, 0..) |fld, idx|
                @field(res, fld.name) = if (idx < @typeInfo(VecType).Struct.fields.len) @field(vec, fld.name) else (comptime Arithmetic.zero(RealType));

            return res;
        }

        pub fn toVector(vec: VecType, comptime to_len: comptime_int) @Vector(to_len, RealType) {
            var res: @Vector(to_len, RealType) = undefined;
            inline for (0..to_len) |idx|
                res[idx] = if (idx < @typeInfo(VecType).Struct.fields.len) @field(vec, @typeInfo(VecType).Struct.fields[idx].name) else (comptime Arithmetic.zero(RealType));

            return res;
        }

        // element access and modification functions
        pub fn getAt(vec: VecType, comptime idx: comptime_int) RealType {
            if (idx < 0 or idx >= dimens)
                @compileError("Vec.getAt: 'idx' value out of range - 'idx' value should be in range 0...dimens - 1");

            return @field(vec, @typeInfo(VecType).Struct.fields[idx].name);
        }

        pub fn setAt(vec: *VecType, comptime idx: comptime_int, val: RealType) void {
            if (idx < 0 or idx >= dimens)
                @compileError("Vec.setAt: 'idx' value out of range - 'idx' value should be in range 0...dimens - 1");

            @field(vec, @typeInfo(VecType).Struct.fields[idx].name) = val;
        }

        // arithmetic functions
        pub fn add(a: VecType, b: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) + @field(b, fld.name);
            return res;
        }

        pub fn sub(a: VecType, b: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) - @field(b, fld.name);
            return res;
        }

        pub fn neg(vec: VecType) VecType {
            comptime Concept.signedNumeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = -@field(vec, fld.name);
            return res;
        }

        pub fn scale(a: VecType, scalar: RealType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) * scalar;
            return res;
        }

        // geometric functions
        pub fn dot(a: VecType, b: VecType) RealType {
            comptime Concept.numeric(RealType);

            var res: RealType = 0;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                res += @field(a, fld.name) * @field(b, fld.name);
            return res;
        }

        pub fn length(vec: VecType) RealType {
            comptime Concept.floatingPoint(RealType);

            return @sqrt(dot(vec, vec));
        }

        pub fn distance(a: VecType, b: VecType) RealType {
            comptime Concept.floatingPoint(RealType);

            return length(a.sub(b));
        }

        pub fn normalize(vec: VecType) VecType {
            comptime Concept.floatingPoint(RealType);

            var l = length(vec);
            return if (l != 0) vec.scale(1 / l) else origin;
        }

        pub fn faceforward(ori: VecType, inc: VecType, ref: VecType) VecType {
            comptime Concept.numeric(RealType);

            return if (dot(ref, inc) < 0.0) ori else neg(ori);
        }

        pub fn reflect(inc: VecType, norm: VecType) VecType {
            comptime Concept.numeric(RealType);

            return inc.sub(norm.scale(dot(norm, inc) * 2));
        }

        pub fn refract(inc: VecType, norm: VecType, eta: RealType) VecType {
            comptime Concept.floatingPoint(RealType);

            const d = dot(norm, inc);
            const k = 1 - eta * eta * (1 - d * d);

            return if (k >= 0) inc.scale(eta).sub(norm.scale(eta * d + @sqrt(k))) else origin;
        }

        // common functions
        pub fn abs(vec: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @fabs(@field(vec, fld.name));
            return res;
        }

        pub fn sign(vec: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = std.math.sign(@field(vec, fld.name));
            return res;
        }

        pub fn floor(vec: VecType) VecType {
            comptime Concept.floatingPoint(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @floor(@field(vec, fld.name));
            return res;
        }

        pub fn ceil(vec: VecType) VecType {
            comptime Concept.floatingPoint(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @ceil(@field(vec, fld.name));
            return res;
        }

        pub fn fract(vec: VecType) VecType {
            comptime Concept.floatingPoint(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(vec, fld.name) - @floor(@field(vec, fld.name));
            return res;
        }

        pub fn mod(a: VecType, b: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @mod(@field(a, fld.name), @field(b, fld.name));
            return res;
        }

        pub fn min(a: VecType, b: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @min(@field(a, fld.name), @field(b, fld.name));
            return res;
        }

        pub fn max(a: VecType, b: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @max(@field(a, fld.name), @field(b, fld.name));
            return res;
        }

        pub fn clamp(vec: VecType, low: VecType, high: VecType) VecType {
            comptime Concept.numeric(RealType);

            return min(max(vec, low), high);
        }

        pub fn lerp(a: VecType, b: VecType, f: RealType) VecType {
            comptime Concept.numeric(RealType);

            return a.add(b.sub(a).scale(f));
        }

        pub fn mix(a: VecType, b: VecType, m: VecType) VecType {
            comptime Concept.signedNumeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = (@field(a, fld.name) * (1 - @field(m, fld.name))) + (@field(b, fld.name) * @field(m, fld.name));
            return res;
        }

        pub fn step(edge: VecType, vec: VecType) VecType {
            comptime Concept.numeric(RealType);

            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = if (@field(edge, fld.name) > @field(vec, fld.name)) 0 else 1;
            return res;
        }

        // TODO: pub fn smoothstep(...) ... { ... }

        pub fn BoolVecTypeFromVecType(comptime Type: type) type {
            return Vec(@typeInfo(Type).Struct.fields.len, bool);
        }

        // relational functions - component wise comparison --> vector of bool
        pub fn lessThan(a: VecType, b: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.numeric(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) < @field(b, fld.name);
            return res;
        }

        pub fn lessThanEqual(a: VecType, b: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.numeric(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) <= @field(b, fld.name);
            return res;
        }

        pub fn greaterThan(a: VecType, b: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.numeric(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) > @field(b, fld.name);
            return res;
        }

        pub fn greaterThanEqual(a: VecType, b: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.numeric(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) >= @field(b, fld.name);
            return res;
        }

        pub fn equal(a: VecType, b: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.arithmetic(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) == @field(b, fld.name);
            return res;
        }

        pub fn notEqual(a: VecType, b: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.arithmetic(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @field(a, fld.name) != @field(b, fld.name);
            return res;
        }

        pub fn any(vec: VecType) bool {
            comptime Concept.boolean(RealType);

            return inline for (@typeInfo(VecType).Struct.fields) |fld| {
                if (@field(vec, fld.name)) break true;
            } else false;
        }

        pub fn all(vec: VecType) bool {
            comptime Concept.boolean(RealType);

            return inline for (@typeInfo(VecType).Struct.fields) |fld| {
                if (!@field(vec, fld.name)) break false;
            } else true;
        }

        pub fn not(vec: VecType) BoolVecTypeFromVecType(VecType) {
            comptime Concept.boolean(RealType);

            var res: BoolVecTypeFromVecType(VecType) = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = !@field(vec, fld.name);
            return res;
        }

        // relational functions - component wise comparison --> bool
        pub fn eql(a: VecType, b: VecType) bool {
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                if (@field(a, fld.name) != @field(b, fld.name))
                    return false;
            return true;
        }

        pub fn approxEqAbs(a: VecType, b: VecType, tolerance: RealType) bool {
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                if (!std.math.approxEqAbs(RealType, @field(a, fld.name), @field(b, fld.name), tolerance))
                    return false;
            return true;
        }

        pub fn approxEqRel(a: VecType, b: VecType, tolerance: RealType) bool {
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                if (!std.math.approxEqRel(RealType, @field(a, fld.name), @field(b, fld.name), tolerance))
                    return false;
            return true;
        }

        fn SwizzleTypeFromComponentsLength(comptime components_len: usize) type {
            return switch (components_len) {
                inline 1...4 => Vec(components_len, RealType),
                else => @compileError("Vec.swizzle: invalid 'len' value - 'len' value should be in range 1...4"),
            };
        }

        pub fn swizzle(vec: VecType, comptime components: []const u8) SwizzleTypeFromComponentsLength(components.len) {
            const RetType = SwizzleTypeFromComponentsLength(components.len);
            var res: RetType = undefined;

            inline for (0..components.len) |idx|
                res.setAt(idx, switch (components[idx]) {
                    '0' => 0,
                    '1' => 1,
                    else => @field(vec, components[idx .. idx + 1]),
                });

            return res;
        }

        // angle & trigonometry functions
        pub fn radians(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = std.math.pi * @field(vec, fld.name) / 180.0;
            return res;
        }

        pub fn degrees(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = 180.0 * @field(vec, fld.name) / std.math.pi;
            return res;
        }

        pub fn sin(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @sin(@field(vec, fld.name));
            return res;
        }

        pub fn cos(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @cos(@field(vec, fld.name));
            return res;
        }

        pub fn tan(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = @tan(@field(vec, fld.name));
            return res;
        }

        pub fn asin(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = std.math.asin(@field(vec, fld.name));
            return res;
        }

        pub fn acos(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = std.math.acos(@field(vec, fld.name));
            return res;
        }

        pub fn atan(vec: VecType) VecType {
            var res: VecType = undefined;
            inline for (@typeInfo(VecType).Struct.fields) |fld|
                @field(res, fld.name) = std.math.atan(@field(vec, fld.name));
            return res;
        }
    };
}

pub fn Vec1(comptime RealType: type) type {
    Concept.arithmetic(RealType);

    return packed struct {
        const Self = @This();

        x: RealType,

        const unit_x = new(Arithmetic.one(RealType));

        pub usingnamespace VecMixin(1, RealType, Self);

        pub fn new(x: RealType) Self {
            return Self{ .x = x };
        }
    };
}

pub fn Vec2(comptime RealType: type) type {
    Concept.arithmetic(RealType);

    return packed struct {
        const Self = @This();

        x: RealType,
        y: RealType,

        const unit_x = new(Arithmetic.one(RealType), Arithmetic.zero(RealType));
        const unit_y = new(Arithmetic.zero(RealType), Arithmetic.one(RealType));

        pub usingnamespace VecMixin(2, RealType, Self);

        pub fn new(x: RealType, y: RealType) Self {
            return Self{ .x = x, .y = y };
        }
    };
}

pub fn Vec3(comptime RealType: type) type {
    Concept.arithmetic(RealType);

    return packed struct {
        const Self = @This();

        x: RealType,
        y: RealType,
        z: RealType,

        const unit_x = new(Arithmetic.one(RealType), Arithmetic.zero(RealType), Arithmetic.zero(RealType));
        const unit_y = new(Arithmetic.zero(RealType), Arithmetic.one(RealType), Arithmetic.zero(RealType));
        const unit_z = new(Arithmetic.zero(RealType), Arithmetic.zero(RealType), Arithmetic.one(RealType));

        pub usingnamespace VecMixin(3, RealType, Self);

        pub fn new(x: RealType, y: RealType, z: RealType) Self {
            return Self{ .x = x, .y = y, .z = z };
        }

        pub fn cross(a: Self, b: Self) Self {
            comptime Concept.numeric(RealType);

            return Self{ .x = a.y * b.z - a.z * b.y, .y = a.z * b.x - a.x * b.z, .z = a.x * b.y - a.y * b.x };
        }
    };
}

pub fn Vec4(comptime RealType: type) type {
    Concept.arithmetic(RealType);

    return packed struct {
        const Self = @This();

        x: RealType,
        y: RealType,
        z: RealType,
        w: RealType,

        const unit_x = new(Arithmetic.one(RealType), Arithmetic.zero(RealType), Arithmetic.zero(RealType), Arithmetic.zero(RealType));
        const unit_y = new(Arithmetic.zero(RealType), Arithmetic.one(RealType), Arithmetic.zero(RealType), Arithmetic.zero(RealType));
        const unit_z = new(Arithmetic.zero(RealType), Arithmetic.zero(RealType), Arithmetic.one(RealType), Arithmetic.zero(RealType));
        const unit_w = new(Arithmetic.zero(RealType), Arithmetic.zero(RealType), Arithmetic.zero(RealType), Arithmetic.one(RealType));

        pub usingnamespace VecMixin(4, RealType, Self);

        pub fn new(x: RealType, y: RealType, z: RealType, w: RealType) Self {
            return Self{ .x = x, .y = y, .z = z, .w = w };
        }
    };
}

pub fn Vec(comptime dimens: comptime_int, comptime RealType: type) type {
    return switch (dimens) {
        1 => Vec1(RealType),
        2 => Vec2(RealType),
        3 => Vec3(RealType),
        4 => Vec4(RealType),
        else => @compileError("Vec: invalid 'len' value - should be in range 1...4"),
    };
}

test "Vec.dimens" {
    const d1 = Vec1(f32).dimens;
    try testing.expect(d1 == 1);

    const d2 = Vec2(f32).dimens;
    try testing.expect(d2 == 2);

    const d3 = Vec3(f32).dimens;
    try testing.expect(d3 == 3);

    const d4 = Vec4(f32).dimens;
    try testing.expect(d4 == 4);
}

test "Vec.new" {
    const vec1 = Vec1(f32).new(1);
    try testing.expect(vec1.x == 1);

    const vec2 = Vec2(f32).new(1, 2);
    try testing.expect(vec2.x == 1 and vec2.y == 2);

    const vec3 = Vec3(f32).new(1, 2, 3);
    try testing.expect(vec3.x == 1 and vec3.y == 2 and vec3.z == 3);

    const vec4 = Vec4(f32).new(1, 2, 3, 4);
    try testing.expect(vec4.x == 1 and vec4.y == 2 and vec4.z == 3 and vec4.w == 4);
}

test "Vec.asAll" {
    const vec1f32 = Vec1(f32).asAll(1);
    try testing.expect(vec1f32.x == 1);

    const vec2f32 = Vec2(f32).asAll(1);
    try testing.expect(vec2f32.x == 1 and vec2f32.y == 1);

    const vec3f32 = Vec3(f32).asAll(1);
    try testing.expect(vec3f32.x == 1 and vec3f32.y == 1 and vec3f32.z == 1);

    const vec4f32 = Vec4(f32).asAll(1);
    try testing.expect(vec4f32.x == 1 and vec4f32.y == 1 and vec4f32.z == 1 and vec4f32.w == 1);

    const vec1bool = Vec1(bool).asAll(true);
    try testing.expect(vec1bool.x == true);

    const vec2bool = Vec2(bool).asAll(true);
    try testing.expect(vec2bool.x == true and vec2bool.y == true);

    const vec3bool = Vec3(bool).asAll(true);
    try testing.expect(vec3bool.x == true and vec3bool.y == true and vec3bool.z == true);

    const vec4bool = Vec4(bool).asAll(true);
    try testing.expect(vec4bool.x == true and vec4bool.y == true and vec4bool.z == true and vec4bool.w == true);
}

test "Vec.fromVec" {
    const vec1 = Vec1(f32).new(1);
    const vec2 = Vec2(f32).new(1, 2);
    const vec3 = Vec3(f32).new(1, 2, 3);
    const vec4 = Vec4(f32).new(1, 2, 3, 4);

    const vec1_fromVec1 = Vec1(f32).fromVec(1, vec1);
    try testing.expect(vec1_fromVec1.x == 1);
    const vec1_fromVec2 = Vec1(f32).fromVec(2, vec2);
    try testing.expect(vec1_fromVec2.x == 1);
    const vec1_fromVec3 = Vec1(f32).fromVec(3, vec3);
    try testing.expect(vec1_fromVec3.x == 1);
    const vec1_fromVec4 = Vec1(f32).fromVec(4, vec4);
    try testing.expect(vec1_fromVec4.x == 1);

    const vec2_fromVec1 = Vec2(f32).fromVec(1, vec1);
    try testing.expect(vec2_fromVec1.x == 1 and vec2_fromVec1.y == 0);
    const vec2_fromVec2 = Vec2(f32).fromVec(2, vec2);
    try testing.expect(vec2_fromVec2.x == 1 and vec2_fromVec2.y == 2);
    const vec2_fromVec3 = Vec2(f32).fromVec(3, vec3);
    try testing.expect(vec2_fromVec3.x == 1 and vec2_fromVec3.y == 2);
    const vec2_fromVec4 = Vec2(f32).fromVec(4, vec4);
    try testing.expect(vec2_fromVec4.x == 1 and vec2_fromVec4.y == 2);

    const vec3_fromVec1 = Vec3(f32).fromVec(1, vec1);
    try testing.expect(vec3_fromVec1.x == 1 and vec3_fromVec1.y == 0 and vec3_fromVec1.z == 0);
    const vec3_fromVec2 = Vec3(f32).fromVec(2, vec2);
    try testing.expect(vec3_fromVec2.x == 1 and vec3_fromVec2.y == 2 and vec3_fromVec2.z == 0);
    const vec3_fromVec3 = Vec3(f32).fromVec(3, vec3);
    try testing.expect(vec3_fromVec3.x == 1 and vec3_fromVec3.y == 2 and vec3_fromVec3.z == 3);
    const vec3_fromVec4 = Vec3(f32).fromVec(4, vec4);
    try testing.expect(vec3_fromVec4.x == 1 and vec3_fromVec4.y == 2 and vec3_fromVec4.z == 3);

    const vec4_fromVec1 = Vec4(f32).fromVec(1, vec1);
    try testing.expect(vec4_fromVec1.x == 1 and vec4_fromVec1.y == 0 and vec4_fromVec1.z == 0 and vec4_fromVec1.w == 0);
    const vec4_fromVec2 = Vec4(f32).fromVec(2, vec2);
    try testing.expect(vec4_fromVec2.x == 1 and vec4_fromVec2.y == 2 and vec4_fromVec2.z == 0 and vec4_fromVec2.w == 0);
    const vec4_fromVec3 = Vec4(f32).fromVec(3, vec3);
    try testing.expect(vec4_fromVec3.x == 1 and vec4_fromVec3.y == 2 and vec4_fromVec3.z == 3 and vec4_fromVec3.w == 0);
    const vec4_fromVec4 = Vec4(f32).fromVec(4, vec4);
    try testing.expect(vec4_fromVec4.x == 1 and vec4_fromVec4.y == 2 and vec4_fromVec4.z == 3 and vec4_fromVec4.w == 4);
}

test "Vec.fromVector" {
    const vector1 = @Vector(1, f32){1};
    const vector2 = @Vector(2, f32){ 1, 2 };
    const vector3 = @Vector(3, f32){ 1, 2, 3 };
    const vector4 = @Vector(4, f32){ 1, 2, 3, 4 };

    const vec1_fromVector1 = Vec1(f32).fromVector(1, vector1);
    try testing.expect(vec1_fromVector1.x == 1);
    const vec1_fromVector2 = Vec1(f32).fromVector(2, vector2);
    try testing.expect(vec1_fromVector2.x == 1);
    const vec1_fromVector3 = Vec1(f32).fromVector(3, vector3);
    try testing.expect(vec1_fromVector3.x == 1);
    const vec1_fromVector4 = Vec1(f32).fromVector(4, vector4);
    try testing.expect(vec1_fromVector4.x == 1);

    const vec2_fromVector1 = Vec2(f32).fromVector(1, vector1);
    try testing.expect(vec2_fromVector1.x == 1 and vec2_fromVector1.y == 0);
    const vec2_fromVector2 = Vec2(f32).fromVector(2, vector2);
    try testing.expect(vec2_fromVector2.x == 1 and vec2_fromVector2.y == 2);
    const vec2_fromVector3 = Vec2(f32).fromVector(3, vector3);
    try testing.expect(vec2_fromVector3.x == 1 and vec2_fromVector3.y == 2);
    const vec2_fromVector4 = Vec2(f32).fromVector(4, vector4);
    try testing.expect(vec2_fromVector4.x == 1 and vec2_fromVector4.y == 2);

    const vec3_fromVector1 = Vec3(f32).fromVector(1, vector1);
    try testing.expect(vec3_fromVector1.x == 1 and vec3_fromVector1.y == 0 and vec3_fromVector1.z == 0);
    const vec3_fromVector2 = Vec3(f32).fromVector(2, vector2);
    try testing.expect(vec3_fromVector2.x == 1 and vec3_fromVector2.y == 2 and vec3_fromVector2.z == 0);
    const vec3_fromVector3 = Vec3(f32).fromVector(3, vector3);
    try testing.expect(vec3_fromVector3.x == 1 and vec3_fromVector3.y == 2 and vec3_fromVector3.z == 3);
    const vec3_fromVector4 = Vec3(f32).fromVector(4, vector4);
    try testing.expect(vec3_fromVector4.x == 1 and vec3_fromVector4.y == 2 and vec3_fromVector4.z == 3);

    const vec4_fromVector1 = Vec4(f32).fromVector(1, vector1);
    try testing.expect(vec4_fromVector1.x == 1 and vec4_fromVector1.y == 0 and vec4_fromVector1.z == 0 and vec4_fromVector1.w == 0);
    const vec4_fromVector2 = Vec4(f32).fromVector(2, vector2);
    try testing.expect(vec4_fromVector2.x == 1 and vec4_fromVector2.y == 2 and vec4_fromVector2.z == 0 and vec4_fromVector2.w == 0);
    const vec4_fromVector3 = Vec4(f32).fromVector(3, vector3);
    try testing.expect(vec4_fromVector3.x == 1 and vec4_fromVector3.y == 2 and vec4_fromVector3.z == 3 and vec4_fromVector3.w == 0);
    const vec4_fromVector4 = Vec4(f32).fromVector(4, vector4);
    try testing.expect(vec4_fromVector4.x == 1 and vec4_fromVector4.y == 2 and vec4_fromVector4.z == 3 and vec4_fromVector4.w == 4);
}

test "Vec.toVec" {
    const vec1 = Vec1(f32).new(1);
    const vec2 = Vec2(f32).new(1, 2);
    const vec3 = Vec3(f32).new(1, 2, 3);
    const vec4 = Vec4(f32).new(1, 2, 3, 4);

    const vec1_toVec1 = vec1.toVec(1);
    try testing.expect(vec1_toVec1.x == 1);
    const vec1_toVec2 = vec1.toVec(2);
    try testing.expect(vec1_toVec2.x == 1 and vec1_toVec2.y == 0);
    const vec1_toVec3 = vec1.toVec(3);
    try testing.expect(vec1_toVec3.x == 1 and vec1_toVec3.y == 0 and vec1_toVec3.z == 0);
    const vec1_toVec4 = vec1.toVec(4);
    try testing.expect(vec1_toVec4.x == 1 and vec1_toVec4.y == 0 and vec1_toVec4.z == 0 and vec1_toVec4.w == 0);

    const vec2_toVec1 = vec2.toVec(1);
    try testing.expect(vec2_toVec1.x == 1);
    const vec2_toVec2 = vec2.toVec(2);
    try testing.expect(vec2_toVec2.x == 1 and vec2_toVec2.y == 2);
    const vec2_toVec3 = vec2.toVec(3);
    try testing.expect(vec2_toVec3.x == 1 and vec2_toVec3.y == 2 and vec2_toVec3.z == 0);
    const vec2_toVec4 = vec2.toVec(4);
    try testing.expect(vec2_toVec4.x == 1 and vec2_toVec4.y == 2 and vec2_toVec4.z == 0 and vec2_toVec4.w == 0);

    const vec3_toVec1 = vec3.toVec(1);
    try testing.expect(vec3_toVec1.x == 1);
    const vec3_toVec2 = vec3.toVec(2);
    try testing.expect(vec3_toVec2.x == 1 and vec3_toVec2.y == 2);
    const vec3_toVec3 = vec3.toVec(3);
    try testing.expect(vec3_toVec3.x == 1 and vec3_toVec3.y == 2 and vec3_toVec3.z == 3);
    const vec3_toVec4 = vec3.toVec(4);
    try testing.expect(vec3_toVec4.x == 1 and vec3_toVec4.y == 2 and vec3_toVec4.z == 3 and vec3_toVec4.w == 0);

    const vec4_toVec1 = vec4.toVec(1);
    try testing.expect(vec4_toVec1.x == 1);
    const vec4_toVec2 = vec4.toVec(2);
    try testing.expect(vec4_toVec2.x == 1 and vec4_toVec2.y == 2);
    const vec4_toVec3 = vec4.toVec(3);
    try testing.expect(vec4_toVec3.x == 1 and vec4_toVec3.y == 2 and vec4_toVec3.z == 3);
    const vec4_toVec4 = vec4.toVec(4);
    try testing.expect(vec4_toVec4.x == 1 and vec4_toVec4.y == 2 and vec4_toVec4.z == 3 and vec4_toVec4.w == 4);
}

test "Vec.toVector" {
    const vec1 = Vec1(f32).new(1);
    const vec2 = Vec2(f32).new(1, 2);
    const vec3 = Vec3(f32).new(1, 2, 3);
    const vec4 = Vec4(f32).new(1, 2, 3, 4);

    const vec1_toVector1 = vec1.toVector(1);
    try testing.expect(vec1_toVector1[0] == 1);
    const vec1_toVector2 = vec1.toVector(2);
    try testing.expect(vec1_toVector2[0] == 1 and vec1_toVector2[1] == 0);
    const vec1_toVector3 = vec1.toVector(3);
    try testing.expect(vec1_toVector3[0] == 1 and vec1_toVector3[1] == 0 and vec1_toVector3[2] == 0);
    const vec1_toVector4 = vec1.toVector(4);
    try testing.expect(vec1_toVector4[0] == 1 and vec1_toVector4[1] == 0 and vec1_toVector4[2] == 0 and vec1_toVector4[3] == 0);

    const vec2_toVector1 = vec2.toVector(1);
    try testing.expect(vec2_toVector1[0] == 1);
    const vec2_toVector2 = vec2.toVector(2);
    try testing.expect(vec2_toVector2[0] == 1 and vec2_toVector2[1] == 2);
    const vec2_toVector3 = vec2.toVector(3);
    try testing.expect(vec2_toVector3[0] == 1 and vec2_toVector3[1] == 2 and vec2_toVector3[2] == 0);
    const vec2_toVector4 = vec2.toVector(4);
    try testing.expect(vec2_toVector4[0] == 1 and vec2_toVector4[1] == 2 and vec2_toVector4[2] == 0 and vec2_toVector4[3] == 0);

    const vec3_toVector1 = vec3.toVector(1);
    try testing.expect(vec3_toVector1[0] == 1);
    const vec3_toVector2 = vec3.toVector(2);
    try testing.expect(vec3_toVector2[0] == 1 and vec3_toVector2[1] == 2);
    const vec3_toVector3 = vec3.toVector(3);
    try testing.expect(vec3_toVector3[0] == 1 and vec3_toVector3[1] == 2 and vec3_toVector3[2] == 3);
    const vec3_toVector4 = vec3.toVector(4);
    try testing.expect(vec3_toVector4[0] == 1 and vec3_toVector4[1] == 2 and vec3_toVector4[2] == 3 and vec3_toVector4[3] == 0);

    const vec4_toVector1 = vec4.toVector(1);
    try testing.expect(vec4_toVector1[0] == 1);
    const vec4_toVector2 = vec4.toVector(2);
    try testing.expect(vec4_toVector2[0] == 1 and vec4_toVector2[1] == 2);
    const vec4_toVector3 = vec4.toVector(3);
    try testing.expect(vec4_toVector3[0] == 1 and vec4_toVector3[1] == 2 and vec4_toVector3[2] == 3);
    const vec4_toVector4 = vec4.toVector(4);
    try testing.expect(vec4_toVector4[0] == 1 and vec4_toVector4[1] == 2 and vec4_toVector4[2] == 3 and vec4_toVector4[3] == 4);
}

test "Vec.getAt" {
    const vec1 = Vec1(f32).new(1);
    try testing.expect(vec1.getAt(0) == 1);

    const vec2 = Vec2(f32).new(1, 2);
    try testing.expect(vec2.getAt(0) == 1 and vec2.getAt(1) == 2);

    const vec3 = Vec3(f32).new(1, 2, 3);
    try testing.expect(vec3.getAt(0) == 1 and vec3.getAt(1) == 2 and vec3.getAt(2) == 3);

    const vec4 = Vec4(f32).new(1, 2, 3, 4);
    try testing.expect(vec4.getAt(0) == 1 and vec4.getAt(1) == 2 and vec4.getAt(2) == 3 and vec4.getAt(3) == 4);
}

test "Vec.setAt" {
    var vec1 = Vec1(f32).origin;
    vec1.setAt(0, 1);
    try testing.expect(vec1.x == 1);

    var vec2 = Vec2(f32).origin;
    vec2.setAt(0, 1);
    vec2.setAt(1, 2);
    try testing.expect(vec2.x == 1 and vec2.y == 2);

    var vec3 = Vec3(f32).origin;
    vec3.setAt(0, 1);
    vec3.setAt(1, 2);
    vec3.setAt(2, 3);
    try testing.expect(vec3.x == 1 and vec3.y == 2 and vec3.z == 3);

    var vec4 = Vec4(f32).origin;
    vec4.setAt(0, 1);
    vec4.setAt(1, 2);
    vec4.setAt(2, 3);
    vec4.setAt(3, 4);
    try testing.expect(vec4.x == 1 and vec4.y == 2 and vec4.z == 3 and vec4.w == 4);
}

test "Vec.add" {
    const vec1 = Vec1(f32).new(1).add(Vec1(f32).asAll(1));
    try testing.expect(vec1.x == 2);

    const vec2 = Vec2(f32).new(1, 2).add(Vec2(f32).asAll(1));
    try testing.expect(vec2.x == 2 and vec2.y == 3);

    const vec3 = Vec3(f32).new(1, 2, 3).add(Vec3(f32).asAll(1));
    try testing.expect(vec3.x == 2 and vec3.y == 3 and vec3.z == 4);

    const vec4 = Vec4(f32).new(1, 2, 3, 4).add(Vec4(f32).asAll(1));
    try testing.expect(vec4.x == 2 and vec4.y == 3 and vec4.z == 4 and vec4.w == 5);
}

test "Vec.sub" {
    const vec1 = Vec1(f32).new(1).sub(Vec1(f32).asAll(1));
    try testing.expect(vec1.x == 0);

    const vec2 = Vec2(f32).new(1, 2).sub(Vec2(f32).asAll(1));
    try testing.expect(vec2.x == 0 and vec2.y == 1);

    const vec3 = Vec3(f32).new(1, 2, 3).sub(Vec3(f32).asAll(1));
    try testing.expect(vec3.x == 0 and vec3.y == 1 and vec3.z == 2);

    const vec4 = Vec4(f32).new(1, 2, 3, 4).sub(Vec4(f32).asAll(1));
    try testing.expect(vec4.x == 0 and vec4.y == 1 and vec4.z == 2 and vec4.w == 3);
}

test "Vec.neg" {
    const vec1 = Vec1(f32).new(1).neg();
    try testing.expect(vec1.x == -1);

    const vec2 = Vec2(f32).new(1, 2).neg();
    try testing.expect(vec2.x == -1 and vec2.y == -2);

    const vec3 = Vec3(f32).new(1, 2, 3).neg();
    try testing.expect(vec3.x == -1 and vec3.y == -2 and vec3.z == -3);

    const vec4 = Vec4(f32).new(1, 2, 3, 4).neg();
    try testing.expect(vec4.x == -1 and vec4.y == -2 and vec4.z == -3 and vec4.w == -4);
}

test "Vec.scale" {
    const vec1 = Vec1(f32).new(1).scale(2);
    try testing.expect(vec1.x == 2);

    const vec2 = Vec2(f32).new(1, 2).scale(2);
    try testing.expect(vec2.x == 2 and vec2.y == 4);

    const vec3 = Vec3(f32).new(1, 2, 3).scale(2);
    try testing.expect(vec3.x == 2 and vec3.y == 4 and vec3.z == 6);

    const vec4 = Vec4(f32).new(1, 2, 3, 4).scale(2);
    try testing.expect(vec4.x == 2 and vec4.y == 4 and vec4.z == 6 and vec4.w == 8);

    const vec5 = Vec1(f32).new(1).scale(0.5);
    try testing.expect(vec5.x == 0.5);

    const vec6 = Vec2(f32).new(1, 2).scale(0.5);
    try testing.expect(vec6.x == 0.5 and vec6.y == 1);

    const vec7 = Vec3(f32).new(1, 2, 3).scale(0.5);
    try testing.expect(vec7.x == 0.5 and vec7.y == 1 and vec7.z == 1.5);

    const vec8 = Vec4(f32).new(1, 2, 3, 4).scale(0.5);
    try testing.expect(vec8.x == 0.5 and vec8.y == 1 and vec8.z == 1.5 and vec8.w == 2);
}

test "Vec.dot" {
    const dot1 = Vec1(f32).new(1).dot(Vec1(f32).new(1));
    try testing.expect(dot1 == 1);

    const dot2 = Vec2(f32).new(1, 2).dot(Vec2(f32).new(1, 2));
    try testing.expect(dot2 == 5);

    const dot3 = Vec3(f32).new(1, 2, 3).dot(Vec3(f32).new(1, 2, 3));
    try testing.expect(dot3 == 14);

    const dot4 = Vec4(f32).new(1, 2, 3, 4).dot(Vec4(f32).new(1, 2, 3, 4));
    try testing.expect(dot4 == 30);
}

test "Vec.length" {
    const length1 = Vec1(f32).new(1).length();
    try testing.expect(length1 == @sqrt(1.0 * 1.0));

    const length2 = Vec2(f32).new(1, 2).length();
    try testing.expect(length2 == @sqrt(1.0 * 1.0 + 2.0 * 2.0));

    const length3 = Vec3(f32).new(1, 2, 3).length();
    try testing.expect(length3 == @sqrt(1.0 * 1.0 + 2.0 * 2.0 + 3.0 * 3.0));

    const length4 = Vec4(f32).new(1, 2, 3, 4).length();
    try testing.expect(length4 == @sqrt(1.0 * 1.0 + 2.0 * 2.0 + 3.0 * 3.0 + 4.0 * 4.0));
}

test "Vec.distance" {
    const distance1 = Vec1(f32).new(1).distance(Vec1(f32).new(2));
    try testing.expect(distance1 == @sqrt((1.0 - 2.0) * (1.0 - 2.0)));

    const distance2 = Vec2(f32).new(1, 2).distance(Vec2(f32).new(2, 3));
    try testing.expect(distance2 == @sqrt((1.0 - 2.0) * (1.0 - 2.0) + (2.0 - 3.0) * (2.0 - 3.0)));

    const distance3 = Vec3(f32).new(1, 2, 3).distance(Vec3(f32).new(2, 3, 4));
    try testing.expect(distance3 == @sqrt((1.0 - 2.0) * (1.0 - 2.0) + (2.0 - 3.0) * (2.0 - 3.0) + (3.0 - 4.0) * (3.0 - 4.0)));

    const distance4 = Vec4(f32).new(1, 2, 3, 4).distance(Vec4(f32).new(2, 3, 4, 5));
    try testing.expect(distance4 == @sqrt((1.0 - 2.0) * (1.0 - 2.0) + (2.0 - 3.0) * (2.0 - 3.0) + (3.0 - 4.0) * (3.0 - 4.0) + (4.0 - 5.0) * (4.0 - 5.0)));
}
