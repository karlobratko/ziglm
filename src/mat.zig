const std = @import("std");
const concept = @import("concept.zig");
const vec = @import("vec.zig");

const Vec = vec.Vec;
const Vec2 = vec.Vec2;
const Vec3 = vec.Vec3;
const Vec4 = vec.Vec4;

const TypeHelper = struct {
    fn BoolVecTypeFromVecType(comptime Type: type) type {
        return Mat(Type.col_count, Type.row_count, bool);
    }
};

fn ArithmeticMat2x2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 2 and Rows == 2 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, x1: Real, y1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0 }, .{ .x = x1, .y = y1 } } };
            }

            pub fn diagonal(d0: Real, d1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0 }, .{ .x = 0, .y = d1 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat2x3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 2 and Rows == 3 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, z0: Real, x1: Real, y1: Real, z1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0, .z = z0 }, .{ .x = x1, .y = y1, .z = z1 } } };
            }

            pub fn diagonal(d0: Real, d1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0, .z = 0 }, .{ .x = 0, .y = d1, .z = 0 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat2x4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 2 and Rows == 4 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, z0: Real, w0: Real, x1: Real, y1: Real, z1: Real, w1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0, .z = z0, .w = w0 }, .{ .x = x1, .y = y1, .z = z1, .w = w1 } } };
            }

            pub fn diagonal(d0: Real, d1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0, .z = 0, .w = 0 }, .{ .x = 0, .y = d1, .z = 0, .w = 0 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat3x2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 3 and Rows == 2 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, x1: Real, y1: Real, x2: Real, y2: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0 }, .{ .x = x1, .y = y1 }, .{ .x = x2, .y = y2 } } };
            }

            pub fn diagonal(d0: Real, d1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0 }, .{ .x = 0, .y = d1 }, .{ .x = 0, .y = 0 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat3x3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 3 and Rows == 3 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, z0: Real, x1: Real, y1: Real, z1: Real, x2: Real, y2: Real, z2: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0, .z = z0 }, .{ .x = x1, .y = y1, .z = z1 }, .{ .x = x2, .y = y2, .z = z2 } } };
            }

            pub fn diagonal(d0: Real, d1: Real, d2: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0, .z = 0 }, .{ .x = 0, .y = d1, .z = 0 }, .{ .x = 0, .y = 0, .z = d2 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat3x4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 3 and Rows == 4 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, z0: Real, w0: Real, x1: Real, y1: Real, z1: Real, w1: Real, x2: Real, y2: Real, z2: Real, w2: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0, .z = z0, .w = w0 }, .{ .x = x1, .y = y1, .z = z1, .w = w1 }, .{ .x = x2, .y = y2, .z = z2, .w = w2 } } };
            }

            pub fn diagonal(d0: Real, d1: Real, d2: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0, .z = 0, .w = 0 }, .{ .x = 0, .y = d1, .z = 0, .w = 0 }, .{ .x = 0, .y = 0, .z = d2, .w = 0 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat4x2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 4 and Rows == 2 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, x1: Real, y1: Real, x2: Real, y2: Real, x3: Real, y3: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0 }, .{ .x = x1, .y = y1 }, .{ .x = x2, .y = y2 }, .{ .x = x3, .y = y3 } } };
            }

            pub fn diagonal(d0: Real, d1: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0 }, .{ .x = 0, .y = d1 }, .{ .x = 0, .y = 0 }, .{ .x = 0, .y = 0 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat4x3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 4 and Rows == 3 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, z0: Real, x1: Real, y1: Real, z1: Real, x2: Real, y2: Real, z2: Real, x3: Real, y3: Real, z3: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0, .z = z0 }, .{ .x = x1, .y = y1, .z = z1 }, .{ .x = x2, .y = y2, .z = z2 }, .{ .x = x3, .y = y3, .z = z3 } } };
            }

            pub fn diagonal(d0: Real, d1: Real, d2: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0, .z = 0 }, .{ .x = 0, .y = d1, .z = 0 }, .{ .x = 0, .y = 0, .z = d2 }, .{ .x = 0, .y = 0, .z = 0 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat4x4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (Cols == 4 and Rows == 4 and concept.isArithmetic(Real))
        struct {
            pub fn new(x0: Real, y0: Real, z0: Real, w0: Real, x1: Real, y1: Real, z1: Real, w1: Real, x2: Real, y2: Real, z2: Real, w2: Real, x3: Real, y3: Real, z3: Real, w3: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = x0, .y = y0, .z = z0, .w = w0 }, .{ .x = x1, .y = y1, .z = z1, .w = w1 }, .{ .x = x2, .y = y2, .z = z2, .w = w2 }, .{ .x = x3, .y = y3, .z = z3, .w = w3 } } };
            }

            pub fn diagonal(d0: Real, d1: Real, d2: Real, d3: Real) Self {
                return Self{ .cols = [_]Self.col_type{ .{ .x = d0, .y = 0, .z = 0, .w = 0 }, .{ .x = 0, .y = d1, .z = 0, .w = 0 }, .{ .x = 0, .y = 0, .z = d2, .w = 0 }, .{ .x = 0, .y = 0, .z = 0, .w = d3 } } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat2xMMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Rows;
    return if (Cols == 2 and concept.isArithmetic(Real))
        struct {
            pub fn cols(c0: Self.col_type, c1: Self.col_type) Self {
                return Self{ .cols = [_]Self.col_type{ c0, c1 } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat3xMMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Rows;
    return if (Cols == 3 and concept.isArithmetic(Real))
        struct {
            pub fn cols(c0: Self.col_type, c1: Self.col_type, c2: Self.col_type) Self {
                return Self{ .cols = [_]Self.col_type{ c0, c1, c2 } };
            }
        }
    else
        struct {};
}

fn ArithmeticMat4xMMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Rows;
    return if (Cols == 4 and concept.isArithmetic(Real))
        struct {
            pub fn cols(c0: Self.col_type, c1: Self.col_type, c2: Self.col_type, c3: Self.col_type) Self {
                return Self{ .cols = [_]Self.col_type{ c0, c1, c2, c3 } };
            }
        }
    else
        struct {};
}

fn ArithmeticMatNx2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Cols;
    return if (Rows == 2 and concept.isArithmetic(Real))
        struct {
            pub fn rows(r0: Self.row_type, r1: Self.row_type) Self {
                var res: Self = undefined;
                inline for (0..Self.col_count) |cidx| {
                    res.cols[cidx].x = r0.getAt(cidx);
                    res.cols[cidx].y = r1.getAt(cidx);
                }
                return res;
            }
        }
    else
        struct {};
}

fn ArithmeticMatNx3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Cols;
    return if (Rows == 3 and concept.isArithmetic(Real))
        struct {
            pub fn rows(r0: Self.row_type, r1: Self.row_type, r2: Self.row_type) Self {
                var res: Self = undefined;
                inline for (0..Self.col_count) |cidx| {
                    res.cols[cidx].x = r0.getAt(cidx);
                    res.cols[cidx].y = r1.getAt(cidx);
                    res.cols[cidx].z = r2.getAt(cidx);
                }
                return res;
            }
        }
    else
        struct {};
}

fn ArithmeticMatNx4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Cols;
    return if (Rows == 4 and concept.isArithmetic(Real))
        struct {
            pub fn rows(r0: Self.row_type, r1: Self.row_type, r2: Self.row_type, r3: Self.row_type) Self {
                var res: Self = undefined;
                inline for (0..Self.col_count) |cidx| {
                    res.cols[cidx].x = r0.getAt(cidx);
                    res.cols[cidx].y = r1.getAt(cidx);
                    res.cols[cidx].z = r2.getAt(cidx);
                    res.cols[cidx].w = r3.getAt(cidx);
                }
                return res;
            }
        }
    else
        struct {};
}

fn ArithmeticMatMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return if (concept.isArithmetic(Real))
        struct {
            pub const size_type = comptime_int;
            pub const real_type = Real;

            pub const col_count = Cols;
            pub const row_count = Rows;

            pub const col_type = Vec(Rows, Real);
            pub const row_type = Vec(Cols, Real);
            pub const mat_type = Self;

            pub const identity = Self.scalar(1);

            fn zeroForArithmeticType(comptime Type: type) Type {
                return if (concept.isBoolean(Type)) false else 0;
            }

            fn oneForArithmeticType(comptime Type: type) Type {
                return if (concept.isBoolean(Type)) true else 1;
            }

            pub fn as(val: Real) Self {
                var res: Self = undefined;
                inline for (0..Self.col_count) |idx| {
                    inline for (@typeInfo(Self.col_type).Struct.fields) |fld|
                        @field(res.cols[idx], fld.name) = val;
                }
                return res;
            }

            pub fn scalar(val: Real) Self {
                var res: Self = undefined;
                inline for (0..Self.col_count) |cidx| {
                    inline for (@typeInfo(Self.col_type).Struct.fields, 0..) |fld, ridx|
                        @field(res.cols[cidx], fld.name) = if (cidx == ridx) val else (comptime zeroForArithmeticType(Real));
                }
                return res;
            }

            pub fn fromMat(comptime from_cols: comptime_int, comptime from_rows: comptime_int, mat: Mat(from_cols, from_rows, Real)) Self {
                var res: Self = undefined;
                inline for (0..Self.col_count) |cidx| {
                    inline for (@typeInfo(Self.col_type).Struct.fields, 0..) |fld, ridx|
                        @field(res.cols[cidx], fld.name) = if (cidx < from_cols and ridx < from_rows) @field(mat.cols[cidx], fld.name) else (comptime zeroForArithmeticType(Real));
                }
                return res;
            }

            pub fn toMat(mat: Self, comptime to_cols: comptime_int, comptime to_rows: comptime_int) Mat(to_cols, to_rows, Real) {
                var res: Mat(to_cols, to_rows, Real) = undefined;
                inline for (0..to_cols) |cidx| {
                    inline for (@typeInfo(Mat(to_cols, to_rows, Real).col_type).Struct.fields, 0..) |fld, ridx|
                        @field(res.cols[cidx], fld.name) = if (cidx < Self.col_count and ridx < Self.row_count) @field(mat.cols[cidx], fld.name) else (comptime zeroForArithmeticType(Real));
                }
                return res;
            }

            pub fn getAt(mat: Self, comptime idx: comptime_int) Self.col_type {
                if (idx < 0 or idx >= Self.col_count)
                    @compileError("Mat.getAt: 'idx' value out of range - 'idx' value should be in range 0...col_count - 1");

                return mat.cols[idx];
            }

            pub fn at(mat: Self, comptime idx: comptime_int) Self.col_type {
                return mat.getAt(idx);
            }

            pub fn col(mat: Self, comptime idx: comptime_int) Self.col_type {
                return mat.getAt(idx);
            }

            pub fn row(mat: Self, comptime idx: comptime_int) Self.row_type {
                var res: Self.row_type = undefined;
                inline for (@typeInfo(Self.row_type).Struct.fields, 0..) |fld, cidx|
                    @field(res, fld.name) = mat.cols[cidx].getAt(idx);
                return res;
            }

            pub fn setAt(mat: *Self, comptime cidx: comptime_int, comptime ridx: comptime_int, val: Real) void {
                if (cidx < 0 or cidx >= Self.col_count)
                    @compileError("Vec.setAt: 'idx' value out of range - 'cidx' value should be in range 0...col_count - 1");

                if (ridx < 0 or ridx >= Self.row_count)
                    @compileError("Vec.setAt: 'idx' value out of range - 'ridx' value should be in range 0...row_count - 1");

                @field(mat.cols[cidx], @typeInfo(Self.col_type).Struct.fields[ridx].name) = val;
            }

            pub fn equal(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (0..Self.col_count) |cidx| {
                    inline for (@typeInfo(Self.col_type).Struct.fields) |fld|
                        @field(res.cols[cidx], fld.name) = @field(a.cols[cidx], fld.name) == @field(b.cols[cidx], fld.name);
                }
                return res;
            }

            pub fn notEqual(a: Self, b: Self) TypeHelper.BoolVecTypeFromVecType(Self) {
                var res: TypeHelper.BoolVecTypeFromVecType(Self) = undefined;
                inline for (0..Self.col_count) |cidx| {
                    inline for (@typeInfo(Self.col_type).Struct.fields) |fld|
                        @field(res.cols[cidx], fld.name) = @field(a.cols[cidx], fld.name) != @field(b.cols[cidx], fld.name);
                }
                return res;
            }

            pub fn eql(a: Self, b: Self) bool {
                inline for (0..Self.col_count) |cidx| {
                    inline for (@typeInfo(Self.col_type).Struct.fields) |fld|
                        if (@field(a.cols[cidx], fld.name) != @field(b.cols[cidx], fld.name))
                            return false;
                }
                return true;
            }
        }
    else
        struct {};
}

fn NumericMat2x2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 2 and Rows == 2 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat2x3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 2 and Rows == 3 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat2x4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 2 and Rows == 4 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat3x2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 3 and Rows == 2 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat3x3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 3 and Rows == 3 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat3x4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 3 and Rows == 4 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat4x2Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 4 and Rows == 2 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat4x3Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 4 and Rows == 3 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMat4x4Mixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == 4 and Rows == 4 and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMatNxNMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Self;
    return if (Cols == Rows and concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn NumericMatMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    _ = Rows;
    _ = Cols;
    _ = Self;
    return if (concept.isNumeric(Real))
        struct {}
    else
        struct {};
}

fn MatMixin(comptime Self: type, comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return struct {
        pub usingnamespace ArithmeticMatMixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat2xMMixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat3xMMixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat4xMMixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMatNx2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMatNx3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMatNx4Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat2x2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat2x3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat2x4Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat3x2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat3x3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat3x4Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat4x2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat4x3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace ArithmeticMat4x4Mixin(Self, Cols, Rows, Real);

        pub usingnamespace NumericMatMixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMatNxNMixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat2x2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat2x3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat2x4Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat3x2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat3x3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat3x4Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat4x2Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat4x3Mixin(Self, Cols, Rows, Real);
        pub usingnamespace NumericMat4x4Mixin(Self, Cols, Rows, Real);
    };
}

pub fn Mat2x2(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 2, 2, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat2x3(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 2, 3, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat2x4(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 2, 4, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat3x2(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 3, 2, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat3x3(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 3, 3, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat3x4(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 3, 4, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat4x2(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 4, 2, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat4x3(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 4, 3, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat4x4(comptime Real: type) type {
    concept.arithmetic(Real);

    return extern struct {
        pub usingnamespace MatMixin(Self, 4, 4, Real);

        const Self = @This();

        cols: [Self.col_count]Self.col_type,
    };
}

pub fn Mat(comptime Cols: comptime_int, comptime Rows: comptime_int, comptime Real: type) type {
    return switch (Cols) {
        2 => switch (Rows) {
            2 => Mat2x2(Real),
            3 => Mat2x3(Real),
            4 => Mat2x4(Real),
            else => @compileError("Mat: invalid 'Rows' value - should be in range 2...4"),
        },
        3 => switch (Rows) {
            2 => Mat3x2(Real),
            3 => Mat3x3(Real),
            4 => Mat3x4(Real),
            else => @compileError("Mat: invalid 'Rows' value - should be in range 2...4"),
        },
        4 => switch (Rows) {
            2 => Mat4x2(Real),
            3 => Mat4x3(Real),
            4 => Mat4x4(Real),
            else => @compileError("Mat: invalid 'Rows' value - should be in range 2...4"),
        },
        else => @compileError("Mat: invalid 'Cols' value - should be in range 2...4"),
    };
}

pub const Mat2 = Mat2x2;
pub const Mat3 = Mat3x3;
pub const Mat4 = Mat4x4;
