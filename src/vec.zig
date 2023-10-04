const std = @import("std");
const concept = @import("concept.zig");
const common = @import("common.zig");
const exponential = @import("exponential.zig");
const geometric = @import("geometric.zig");
const trigonometric = @import("trigonometric.zig");

const TypeHelper = struct {
    fn BoolVecTypeFromVecType(comptime Type: type) type {
        return Vec(@typeInfo(Type).Struct.fields.len, bool);
    }
};

fn ArithmeticVec1Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 1 and concept.isArithmetic(Real))
        struct {
            /// Initialises every field of vector separately.
            pub fn new(x: Real) Self {
                return Self{ .x = x };
            }
        }
    else
        struct {};
}

fn ArithmeticVec2Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 2 and concept.isArithmetic(Real))
        struct {
            /// Initialises every field of vector separately.
            pub fn new(x: Real, y: Real) Self {
                return Self{ .x = x, .y = y };
            }
        }
    else
        struct {};
}

fn ArithmeticVec3Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 3 and concept.isArithmetic(Real))
        struct {
            /// Initialises every field of vector separately.
            pub fn new(x: Real, y: Real, z: Real) Self {
                return Self{ .x = x, .y = y, .z = z };
            }
        }
    else
        struct {};
}

fn ArithmeticVec4Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 4 and concept.isArithmetic(Real))
        struct {
            /// Initialises every field of vector separately.
            pub fn new(x: Real, y: Real, z: Real, w: Real) Self {
                return Self{ .x = x, .y = y, .z = z, .w = w };
            }
        }
    else
        struct {};
}

fn ArithmeticVecMixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (concept.isArithmetic(Real))
        struct {
            pub const size_type = comptime_int;
            pub const real_type = Real;

            /// Number of dimensions that vector has.
            pub const dimens = Dimens;

            pub const vec_type = Self;

            fn zeroForArithmeticType(comptime Type: type) Type {
                return if (concept.isBoolean(Type)) false else 0;
            }

            fn oneForArithmeticType(comptime Type: type) Type {
                return if (concept.isBoolean(Type)) true else 1;
            }

            /// Initialises every field of vector with same value.
            pub fn as(val: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = val;
                return res;
            }

            /// Converts from vector of specified length to vector while preserving type.
            ///
            /// If length of destination type is greater than length of source type,
            /// fields are padded with default value - 0 for numeric types and false for boolean types.
            pub fn fromVec(comptime from_len: comptime_int, vec: Vec(from_len, Real)) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields, 0..) |fld, idx|
                    @field(res, fld.name) = if (idx < from_len) @field(vec, fld.name) else (comptime zeroForArithmeticType(Real));

                return res;
            }

            /// Converts from builtin @Vector of specified length to vector while preserving type.
            ///
            /// If length of destination type is greater than length of source type,
            /// fields are padded with default value - 0 for numeric types and false for boolean types.
            pub fn fromVector(comptime from_len: comptime_int, vec: @Vector(from_len, Real)) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields, 0..) |fld, idx|
                    @field(res, fld.name) = if (idx < from_len) vec[idx] else (comptime zeroForArithmeticType(Real));

                return res;
            }

            /// Converts to vector of specified length while preserving type.
            ///
            /// If length of destination type is greater than length of source type,
            /// fields are padded with default value - 0 for numeric types and false for boolean types.
            pub fn toVec(vec: Self, comptime to_len: comptime_int) Vec(to_len, Real) {
                var res: Vec(to_len, Real) = undefined;
                inline for (@typeInfo(Vec(to_len, Real)).Struct.fields, 0..) |fld, idx|
                    @field(res, fld.name) = if (idx < @typeInfo(Self).Struct.fields.len) @field(vec, fld.name) else (comptime zeroForArithmeticType(Real));

                return res;
            }

            /// Converts to builtin @Vector of specified length while preserving type.
            ///
            /// If length of destination type is greater than length of source type,
            /// fields are padded with default value - 0 for numeric types and false for boolean types.
            pub fn toVector(vec: Self, comptime to_len: comptime_int) @Vector(to_len, Real) {
                var res: @Vector(to_len, Real) = undefined;
                inline for (0..to_len) |idx|
                    res[idx] = if (idx < @typeInfo(Self).Struct.fields.len) @field(vec, @typeInfo(Self).Struct.fields[idx].name) else (comptime zeroForArithmeticType(Real));

                return res;
            }

            fn SwizzleTypeFromComponentsLength(comptime components_len: usize) type {
                return switch (components_len) {
                    inline 1...4 => Vec(components_len, Real),
                    else => @compileError("Vec.swizzle: invalid 'len' value - 'len' value should be in range 1...4"),
                };
            }

            /// Performs 'swizzle' operation. Creates vector based on number of elements in swizzle string.
            ///
            /// Acceptable elements of string are field names which include: 'x', 'y', 'z', and 'w', numbers '0' and '1', or booleans 'T' and 'F'.
            ///
            /// If value provided in string is '0' or 'F', field will be initialized with value false if boolean and 0 if numeric.
            /// If value provided in string is '1' or 'F', field will be initialized with value true if boolean and 1 if numeric.
            pub fn swizzle(vec: Self, comptime components: []const u8) SwizzleTypeFromComponentsLength(components.len) {
                const RetType = SwizzleTypeFromComponentsLength(components.len);
                var res: RetType = undefined;

                inline for (0..components.len) |idx|
                    res.setAt(idx, switch (components[idx]) {
                        '0', 'F' => comptime zeroForArithmeticType(Real),
                        '1', 'T' => comptime oneForArithmeticType(Real),
                        else => @field(vec, components[idx .. idx + 1]),
                    });

                return res;
            }

            /// Gets value at zero based index position.
            pub fn getAt(vec: Self, comptime idx: comptime_int) Real {
                if (idx < 0 or idx >= dimens)
                    @compileError("Vec.getAt: 'idx' value out of range - 'idx' value should be in range 0...dimens - 1");

                return @field(vec, @typeInfo(Self).Struct.fields[idx].name);
            }

            pub fn at(vec: Self, comptime idx: comptime_int) Real {
                return vec.getAt(idx);
            }

            pub fn row(vec: Self, comptime idx: comptime_int) Real {
                return vec.getAt(idx);
            }

            pub fn col(vec: Self, comptime idx: comptime_int) Real {
                return vec.getAt(idx);
            }

            /// Sets value at zero based index position to provided value.
            pub fn setAt(vec: *Self, comptime idx: comptime_int, val: Real) void {
                if (idx < 0 or idx >= dimens)
                    @compileError("Vec.setAt: 'idx' value out of range - 'idx' value should be in range 0...dimens - 1");

                @field(vec, @typeInfo(Self).Struct.fields[idx].name) = val;
            }

            /// Performs component-wise comparison in the form of a[i] == b[i] and return a boolean vector.
            pub fn equal(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) == @field(b, fld.name);
                return res;
            }

            /// Performs component-wise comparison in the form of a[i] != b[i] and return a boolean vector.
            pub fn notEqual(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) != @field(b, fld.name);
                return res;
            }

            /// Performs component-wise comparison in the form of a[i] == b[i] and return a boolean.
            pub fn eql(a: Self, b: Self) bool {
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    if (@field(a, fld.name) != @field(b, fld.name))
                        return false;
                return true;
            }
        }
    else
        struct {};
}

fn BooleanVecMixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    _ = Dimens;
    return if (concept.isBoolean(Real))
        struct {
            /// Checks whether any component of vector is 'true' and returns boolean.
            pub fn any(vec: Self) bool {
                return inline for (@typeInfo(Self).Struct.fields) |fld| {
                    if (@field(vec, fld.name)) break true;
                } else false;
            }

            /// Checks whether all components of vector are 'true' and returns boolean.
            pub fn all(vec: Self) bool {
                return inline for (@typeInfo(Self).Struct.fields) |fld| {
                    if (!@field(vec, fld.name)) break false;
                } else true;
            }

            /// Performs component-wise logical complement operation and returns boolean vector.
            pub fn not(vec: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = !@field(vec, fld.name);
                return res;
            }
        }
    else
        struct {};
}

fn NumericVec1Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 1 and concept.isNumeric(Real))
        struct {
            /// 1D vector representing unit on X axis.
            pub const unit_x = Self.new(1);
        }
    else
        struct {};
}

fn NumericVec2Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 2 and concept.isNumeric(Real))
        struct {
            /// 2D vector representing unit on X axis.
            pub const unit_x = Self.new(1, 0);

            /// 2D vector representing unit on Y axis.
            pub const unit_y = Self.new(0, 1);
        }
    else
        struct {};
}

fn NumericVec3Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 3 and concept.isNumeric(Real))
        struct {
            /// 3D vector representing unit on X axis.
            pub const unit_x = Self.new(1, 0, 0);

            /// 3D vector representing unit on Y axis.
            pub const unit_y = Self.new(0, 1, 0);

            /// 3D vector representing unit on Z axis.
            pub const unit_z = Self.new(0, 0, 1);
        }
    else
        struct {};
}

fn NumericVec4Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 4 and concept.isNumeric(Real))
        struct {
            /// 4D vector representing unit on X axis.
            pub const unit_x = Self.new(1, 0, 0, 0);

            /// 4D vector representing unit on Y axis.
            pub const unit_y = Self.new(0, 1, 0, 0);

            /// 4D vector representing unit on Z axis.
            pub const unit_z = Self.new(0, 0, 1, 0);

            /// 4D vector representing unit on W axis.
            pub const unit_w = Self.new(0, 0, 0, 1);
        }
    else
        struct {};
}

fn NumericVecMixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    _ = Dimens;
    return if (concept.isNumeric(Real))
        struct {
            /// Vector representing origin of the Cartesian coordinate system.
            pub const origin = Self.as(0);

            /// Performs component-wise addition and returns vector.
            pub fn add(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) + @field(b, fld.name);
                return res;
            }

            /// Performs component-wise addition wih single scalar value and returns vector.
            pub fn adds(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) + scalar;
                return res;
            }

            /// Performs component-wise subtraction and returns vector.
            pub fn sub(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) - @field(b, fld.name);
                return res;
            }

            /// Performs component-wise subtraction with single scalar value and returns vector.
            pub fn subs(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) - scalar;
                return res;
            }

            /// Performs component-wise multiplication and returns vector.
            pub fn mul(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) * @field(b, fld.name);
                return res;
            }

            /// Performs component-wise scaling by the factor provided with parameter 'scalar' and returns vector.
            pub fn muls(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) * scalar;
                return res;
            }

            /// Performs component-wise multiplication and returns vector.
            pub fn pow(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.pow(@field(a, fld.name), @field(b, fld.name));
                return res;
            }

            /// Performs component-wise multiplication and returns vector.
            ///
            /// This is variation of the pow function where the second parameter is always a scalar.
            pub fn pows(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.pow(@field(a, fld.name), scalar);
                return res;
            }

            /// Returns the dot product of the two input parameters, i.e. the sum of the component-wise products.
            ///
            /// If x and y are the same the square root of the dot product is equivalent to the length of the vector.
            pub fn dot(a: Self, b: Self) Real {
                var res: Real = 0;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    res += geometric.dot(@field(a, fld.name), @field(b, fld.name));
                return res;
            }

            /// Performs a component-wise check for sign of values in vector and returns vector.
            ///
            /// Result value is set to 1 when source value is positive, to 0 when source value is zero and -1 when source value is negative.
            pub fn sign(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.sign(@field(vec, fld.name));
                return res;
            }

            /// Performs a component-wise modulo operation by calling builtin @mod function and returns vector.
            ///
            /// For unsigned integers this is the same as numerator % denominator.
            /// Caller guarantees denominator > 0, otherwise the operation will result in a Remainder Division by Zero when runtime safety checks are enabled.
            pub fn mod(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.mod(@field(a, fld.name), @field(b, fld.name));
                return res;
            }

            /// Performs a component-wise modulo operation by calling builtin @mod function and returns vector.
            ///
            /// For unsigned integers this is the same as numerator % denominator.
            /// Caller guarantees denominator > 0, otherwise the operation will result in a Remainder Division by Zero when runtime safety checks are enabled.
            pub fn mods(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.mod(@field(a, fld.name), scalar);
                return res;
            }

            /// Performs component-wise operation of getting the smaller of the two arguments and returns vector.
            pub fn min(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.min(@field(a, fld.name), @field(b, fld.name));
                return res;
            }

            /// Performs component-wise operation of getting the smaller of the two arguments and returns vector.
            ///
            /// This is variation of the min function where the second parameter is always a scalar.
            pub fn mins(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.min(@field(a, fld.name), scalar);
                return res;
            }

            /// Performs component-wise operation of getting the greater of the two arguments and returns vector.
            pub fn max(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.max(@field(a, fld.name), @field(b, fld.name));
                return res;
            }

            /// Performs component-wise operation of getting the greater of the two arguments and returns vector.
            ///
            /// This is variation of the max function where the second parameter is always a scalar.
            pub fn maxs(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.max(@field(a, fld.name), scalar);
                return res;
            }

            /// Performs component-wise clamp operation and returns a vector.
            ///
            /// The clamp function returns vec[i] if it is larger than low[i] and smaller than high[i].
            /// In case vec[i] is smaller than low[i], low[i] is returned. If x is larger than high[i], high[i] is returned.
            pub fn clamp(vec: Self, low: Self, high: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.clamp(@field(vec, fld.name), @field(low, fld.name), @field(high, fld.name));
                return res;
            }

            /// Performs component-wise clamp operation and returns a vector.
            ///
            /// This is variation of the clamp function where the second and third parameters are always a scalars.
            ///
            /// The clamp function returns vec[i] if it is larger than low and smaller than high.
            /// In case vec[i] is smaller than low, low is returned. If x is larger than high, high is returned.
            pub fn clamps(vec: Self, low: Real, high: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.clamp(@field(vec, fld.name), low, high);
                return res;
            }

            /// Performs component-wise check if vec[i] < edge[i] and returns 0 otherwise 1.
            pub fn step(edge: Self, vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.step(@field(edge, fld.name), @field(vec, fld.name));
                return res;
            }

            /// Performs component-wise check if vec[i] < edge and returns 0 otherwise 1.
            ///
            /// This is variation of the step function where the second parameter is always a scalars.
            pub fn steps(edge: Real, vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.step(edge, @field(vec, fld.name));
                return res;
            }

            /// The lessThan function returns a boolean vector as result of a component-wise comparison in the form of x[i] < y[i].
            pub fn lessThan(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) < @field(b, fld.name);
                return res;
            }

            /// The lessThanEqual function returns a boolean vector as result of a component-wise comparison in the form of x[i] <= y[i].
            pub fn lessThanEqual(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) <= @field(b, fld.name);
                return res;
            }

            /// The greaterThan function returns a boolean vector as result of a component-wise comparison in the form of x[i] > y[i].
            pub fn greaterThan(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) > @field(b, fld.name);
                return res;
            }

            /// The greaterThanEqual function returns a boolean vector as result of a component-wise comparison in the form of x[i] >= y[i].
            pub fn greaterThanEqual(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) >= @field(b, fld.name);
                return res;
            }
        }
    else
        struct {};
}

fn SignedNumericVec3Mixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return if (Dimens == 3 and concept.isSignedNumeric(Real))
        struct {
            /// Returns the cross product of the two input parameters, i.e. a vector that is perpendicular to the plane
            /// containing x and y and has a magnitude that is equal to the area of the parallelogram that x and y span.
            pub fn cross(a: Self, b: Self) Self {
                return Self{ .x = a.y * b.z - a.z * b.y, .y = a.z * b.x - a.x * b.z, .z = a.x * b.y - a.y * b.x };
            }
        }
    else
        struct {};
}

fn SignedNumericVecMixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    _ = Dimens;
    return if (concept.isSignedNumeric(Real))
        struct {
            /// Performs component-wise absolute value calculation and returns vector.
            pub fn abs(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.abs(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise negation and returns vector.
            pub fn neg(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = -@field(vec, fld.name);
                return res;
            }

            /// Returns a vector that points in the direction of reflection.
            ///
            /// The function has two input parameters of the type float vector: I, the incident vector, and N, the normal vector of the reflecting surface.
            ///
            /// To obtain the desired result the vector N has to be normalized.
            /// The reflection vector always has the same length as the incident vector.
            /// From this it follows that the reflection vector is normalized if N and I are both normalized.
            pub fn reflect(inc: Self, norm: Self) Self {
                const d2 = Self.dot(norm, inc) * 2;
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(inc, fld.name) - (@field(norm, fld.name) * d2);
                return res;
            }

            /// The faceforward function returns a vector that points in the same direction as a reference vector.
            ///
            /// The function has three input parameters: N, the vector to orient, I, the incident vector, and Nref, the reference vector.
            /// If the dot product of I and Nref is smaller than zero the return value is N. Otherwise -N is returned.
            pub fn faceforward(ori: Self, inc: Self, ref: Self) Self {
                return if (Self.dot(ref, inc) < 0) ori else Self.neg(ori);
            }
        }
    else
        struct {};
}

fn FloatingPointVecMixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    _ = Dimens;
    return if (concept.isFloatingPoint(Real))
        struct {
            /// Performs component-wise division and returns vector.
            pub fn div(a: Self, b: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) / @field(b, fld.name);
                return res;
            }

            /// Performs component-wise division and returns vector.
            pub fn divs(a: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = @field(a, fld.name) / scalar;
                return res;
            }

            /// The length function returns the length of a vector defined by the Euclidean norm, i.e. the square root of the sum of the squared components.
            pub fn length(vec: Self) Real {
                return @sqrt(Self.dot(vec, vec));
            }

            /// The distance function returns the distance between two points.
            ///
            /// The distance of two points is the length of the vector d = p0 - p1, that starts at p1 and points to p0.
            pub fn distance(a: Self, b: Self) Real {
                return length(a.sub(b));
            }

            /// The normalize function returns a vector with length 1.0 that is parallel to x, i.e. x divided by its length.
            pub fn normalize(vec: Self) Self {
                const d = Self.dot(vec, vec);
                return if (d != 0.0) vec.muls(exponential.inversesqrt(d)) else Self.origin;
            }

            /// The refract function returns a vector that points in the direction of refraction.
            ///
            /// The function has two vector input parameters and one scalar input parameter: I, the incident vector, N, the normal vector of the refracting surface, and eta, the ratio of indices of refraction.
            ///
            /// Side note: To obtain the desired result the vectors I and N have to be normalized.
            pub fn refract(inc: Self, norm: Self, eta: Real) Self {
                const d = Self.dot(norm, inc);
                const k = 1.0 - eta * eta * (1.0 - d * d);

                if (k < 0.0) return Self.origin;

                const sqrtk = @sqrt(k);
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = (@field(inc, fld.name) * eta) - (@field(norm, fld.name) * ((eta * d) + sqrtk));
                return res;
            }

            /// Performs component-wise builtin @floor operation.
            pub fn floor(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.floor(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise builtin @ceil operation.
            pub fn ceil(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.ceil(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise fractional part of vec[i] calculation, i.e. vec[i] - @floor(vec[i]).
            pub fn fract(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.fract(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise linear blend calculation of a[i] and b[i], i.e. (a[i] * (1 - m[i])) + (b[i] * m[i]).
            pub fn mix(a: Self, b: Self, m: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.mix(@field(a, fld.name), @field(b, fld.name), @field(m, fld.name));
                return res;
            }

            /// Performs component-wise linear blend calculation of a[i] and b[i], i.e. (a[i] * (1 - m)) + (b[i] * m).
            ///
            /// This is variation of the mix function where the third parameter is always a scalar.
            pub fn mixs(a: Self, b: Self, scalar: Real) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.mix(@field(a, fld.name), @field(b, fld.name), scalar);
                return res;
            }

            /// Performs component-wise smoothstep function application.
            ///
            /// The smoothstep function returns 0 if vec[i] is smaller then edge0[i] and 1 if vec[i] is larger than edge1[i].
            /// Otherwise the return value is interpolated between 0 and 1 using Hermite polynomials.
            pub fn smoothstep(edge0: Self, edge1: Self, vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.smoothstep(@field(edge0, fld.name), @field(edge1, fld.name), @field(vec, fld.name));
                return res;
            }

            /// Performs component-wise smoothstep function application.
            ///
            /// This is variation of the smoothstep function where the second and third parameters are always a scalars.
            ///
            /// The smoothstep function returns 0 if vec[i] is smaller then edge0[i] and 1 if vec[i] is larger than edge1[i].
            /// Otherwise the return value is interpolated between 0 and 1 using Hermite polynomials.
            pub fn smoothsteps(edge0: Real, edge1: Real, vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = common.smoothstep(edge0, edge1, @field(vec, fld.name));
                return res;
            }

            /// Performs component-wise std.math.approxEqAbs operation and returns bool.
            pub fn approxEqAbs(a: Self, b: Self, tolerance: Real) bool {
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    if (!std.math.approxEqAbs(Real, @field(a, fld.name), @field(b, fld.name), tolerance))
                        return false;
                return true;
            }

            /// Performs component-wise std.math.approxEqRel operation and returns bool.
            pub fn approxEqRel(a: Self, b: Self, tolerance: Real) bool {
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    if (!std.math.approxEqRel(Real, @field(a, fld.name), @field(b, fld.name), tolerance))
                        return false;
                return true;
            }

            /// Performs component-wise conversion from degrees to radians and returns vector.
            pub fn radians(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.radians(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise conversion from radians to degrees and returns vector.
            pub fn degrees(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.degrees(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of bulitin @sin function.
            pub fn sin(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.sin(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of bulitin @cos function.
            pub fn cos(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.cos(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of bulitin @tan function.
            pub fn tan(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.tan(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of bulitin @asin function.
            pub fn asin(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.asin(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of bulitin @acos function.
            pub fn acos(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.acos(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of bulitin @atan function.
            pub fn atan(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = trigonometric.atan(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of builtin @exp function.
            pub fn exp(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.exp(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of builtin @log function.
            pub fn log(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.log(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of builtin @exp2 function.
            pub fn exp2(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.exp2(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of builtin @log2 function.
            pub fn log2(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.log2(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of builtin @sqrt function.
            pub fn sqrt(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.sqrt(@field(vec, fld.name));
                return res;
            }

            /// Performs component-wise application of 1 / builtin @sqrt function.
            ///
            /// In case of vector of f32 types, performs qrsqrt (Quake 3 Fast Inverse Sqrt Algorithm).
            pub fn inversesqrt(vec: Self) Self {
                var res: Self = undefined;
                inline for (@typeInfo(Self).Struct.fields) |fld|
                    @field(res, fld.name) = exponential.inversesqrt(@field(vec, fld.name));
                return res;
            }
        }
    else
        struct {};
}

fn VecMixin(comptime Self: type, comptime Dimens: comptime_int, comptime Real: type) type {
    return struct {
        pub usingnamespace ArithmeticVecMixin(Self, Dimens, Real);
        pub usingnamespace ArithmeticVec1Mixin(Self, Dimens, Real);
        pub usingnamespace ArithmeticVec2Mixin(Self, Dimens, Real);
        pub usingnamespace ArithmeticVec3Mixin(Self, Dimens, Real);
        pub usingnamespace ArithmeticVec4Mixin(Self, Dimens, Real);

        pub usingnamespace NumericVecMixin(Self, Dimens, Real);
        pub usingnamespace NumericVec1Mixin(Self, Dimens, Real);
        pub usingnamespace NumericVec2Mixin(Self, Dimens, Real);
        pub usingnamespace NumericVec3Mixin(Self, Dimens, Real);
        pub usingnamespace NumericVec4Mixin(Self, Dimens, Real);

        pub usingnamespace SignedNumericVecMixin(Self, Dimens, Real);
        pub usingnamespace SignedNumericVec3Mixin(Self, Dimens, Real);

        pub usingnamespace BooleanVecMixin(Self, Dimens, Real);

        pub usingnamespace FloatingPointVecMixin(Self, Dimens, Real);
    };
}

pub fn Vec1(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace VecMixin(Self, 1, Real);

        const Self = @This();

        x: Real,
    };
}

pub fn Vec2(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace VecMixin(Self, 2, Real);

        const Self = @This();

        x: Real,
        y: Real,
    };
}

pub fn Vec3(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace VecMixin(Self, 3, Real);

        const Self = @This();

        x: Real,
        y: Real,
        z: Real,
    };
}

pub fn Vec4(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace VecMixin(Self, 4, Real);

        const Self = @This();

        x: Real,
        y: Real,
        z: Real,
        w: Real,
    };
}

pub fn Vec(comptime Dimens: comptime_int, comptime Real: type) type {
    return switch (Dimens) {
        1 => Vec1(Real),
        2 => Vec2(Real),
        3 => Vec3(Real),
        4 => Vec4(Real),
        else => @compileError("Vec: invalid 'Dimens' value - should be in range 1...4"),
    };
}
