const std = @import("std");
const glm = @import("ziglm");
const testing = std.testing;

const Mat2x2 = glm.Mat2x2;
const Mat2x3 = glm.Mat2x3;
const Mat2x4 = glm.Mat2x4;
const Mat3x2 = glm.Mat3x2;
const Mat3x3 = glm.Mat3x3;
const Mat3x4 = glm.Mat3x4;
const Mat4x2 = glm.Mat4x2;
const Mat4x3 = glm.Mat4x3;
const Mat4x4 = glm.Mat4x4;

const Vec1 = glm.Vec1;
const Vec2 = glm.Vec2;
const Vec3 = glm.Vec3;
const Vec4 = glm.Vec4;

test "Mat.col_count" {
    try testing.expectEqual(2, Mat2x2(f32).col_count);
    try testing.expectEqual(2, Mat2x3(f32).col_count);
    try testing.expectEqual(2, Mat2x4(f32).col_count);
    try testing.expectEqual(3, Mat3x2(f32).col_count);
    try testing.expectEqual(3, Mat3x3(f32).col_count);
    try testing.expectEqual(3, Mat3x4(f32).col_count);
    try testing.expectEqual(4, Mat4x2(f32).col_count);
    try testing.expectEqual(4, Mat4x3(f32).col_count);
    try testing.expectEqual(4, Mat4x4(f32).col_count);
}

test "Mat.row_count" {
    try testing.expectEqual(2, Mat2x2(f32).row_count);
    try testing.expectEqual(3, Mat2x3(f32).row_count);
    try testing.expectEqual(4, Mat2x4(f32).row_count);
    try testing.expectEqual(2, Mat3x2(f32).row_count);
    try testing.expectEqual(3, Mat3x3(f32).row_count);
    try testing.expectEqual(4, Mat3x4(f32).row_count);
    try testing.expectEqual(2, Mat4x2(f32).row_count);
    try testing.expectEqual(3, Mat4x3(f32).row_count);
    try testing.expectEqual(4, Mat4x4(f32).row_count);
}

test "Mat.real_type" {
    try testing.expectEqual(f32, Mat2x2(f32).real_type);
    try testing.expectEqual(i32, Mat2x2(i32).real_type);
    try testing.expectEqual(u32, Mat2x2(u32).real_type);
}

test "Mat.size_type" {
    try testing.expectEqual(comptime_int, Mat2x2(f32).size_type);
    try testing.expectEqual(comptime_int, Mat2x2(i32).size_type);
    try testing.expectEqual(comptime_int, Mat2x2(u32).size_type);
}

test "Mat.col_type" {
    try testing.expectEqual(Vec2(f32), Mat2x2(f32).col_type);
    try testing.expectEqual(Vec3(f32), Mat2x3(f32).col_type);
    try testing.expectEqual(Vec4(f32), Mat2x4(f32).col_type);

    try testing.expectEqual(Vec2(f32), Mat3x2(f32).col_type);
    try testing.expectEqual(Vec3(f32), Mat3x3(f32).col_type);
    try testing.expectEqual(Vec4(f32), Mat3x4(f32).col_type);

    try testing.expectEqual(Vec2(f32), Mat4x2(f32).col_type);
    try testing.expectEqual(Vec3(f32), Mat4x3(f32).col_type);
    try testing.expectEqual(Vec4(f32), Mat4x4(f32).col_type);
}

test "Mat.row_type" {
    try testing.expectEqual(Vec2(f32), Mat2x2(f32).row_type);
    try testing.expectEqual(Vec2(f32), Mat2x3(f32).row_type);
    try testing.expectEqual(Vec2(f32), Mat2x4(f32).row_type);

    try testing.expectEqual(Vec3(f32), Mat3x2(f32).row_type);
    try testing.expectEqual(Vec3(f32), Mat3x3(f32).row_type);
    try testing.expectEqual(Vec3(f32), Mat3x4(f32).row_type);

    try testing.expectEqual(Vec4(f32), Mat4x2(f32).row_type);
    try testing.expectEqual(Vec4(f32), Mat4x3(f32).row_type);
    try testing.expectEqual(Vec4(f32), Mat4x4(f32).row_type);
}

test "Mat.mat_type" {
    try testing.expectEqual(Mat2x2(f32), Mat2x2(f32).mat_type);
    try testing.expectEqual(Mat2x3(f32), Mat2x3(f32).mat_type);
    try testing.expectEqual(Mat2x4(f32), Mat2x4(f32).mat_type);

    try testing.expectEqual(Mat3x2(f32), Mat3x2(f32).mat_type);
    try testing.expectEqual(Mat3x3(f32), Mat3x3(f32).mat_type);
    try testing.expectEqual(Mat3x4(f32), Mat3x4(f32).mat_type);

    try testing.expectEqual(Mat4x2(f32), Mat4x2(f32).mat_type);
    try testing.expectEqual(Mat4x3(f32), Mat4x3(f32).mat_type);
    try testing.expectEqual(Mat4x4(f32), Mat4x4(f32).mat_type);
}

test "Mat.new(...)" {
    const mat2x2_new = Mat2x2(f32).new(1, 0, 0, 1);
    try testing.expect(mat2x2_new.cols[0].x == 1 and mat2x2_new.cols[0].y == 0 and mat2x2_new.cols[1].x == 0 and mat2x2_new.cols[1].y == 1);

    const mat2x3_new = Mat2x3(f32).new(1, 0, 0, 0, 1, 0);
    try testing.expect(mat2x3_new.cols[0].x == 1 and mat2x3_new.cols[0].y == 0 and mat2x3_new.cols[0].z == 0 and mat2x3_new.cols[1].x == 0 and mat2x3_new.cols[1].y == 1 and mat2x3_new.cols[1].z == 0);

    const mat2x4_new = Mat2x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0);
    try testing.expect(mat2x4_new.cols[0].x == 1 and mat2x4_new.cols[0].y == 0 and mat2x4_new.cols[0].z == 0 and mat2x4_new.cols[0].w == 0 and mat2x4_new.cols[1].x == 0 and mat2x4_new.cols[1].y == 1 and mat2x4_new.cols[1].z == 0 and mat2x4_new.cols[1].w == 0);

    const mat3x2_new = Mat3x2(f32).new(1, 0, 0, 1, 0, 0);
    try testing.expect(mat3x2_new.cols[0].x == 1 and mat3x2_new.cols[0].y == 0 and mat3x2_new.cols[1].x == 0 and mat3x2_new.cols[1].y == 1 and mat3x2_new.cols[2].x == 0 and mat3x2_new.cols[2].y == 0);

    const mat3x3_new = Mat3x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1);
    try testing.expect(mat3x3_new.cols[0].x == 1 and mat3x3_new.cols[0].y == 0 and mat3x3_new.cols[0].z == 0 and mat3x3_new.cols[1].x == 0 and mat3x3_new.cols[1].y == 1 and mat3x3_new.cols[1].z == 0 and mat3x3_new.cols[2].x == 0 and mat3x3_new.cols[2].y == 0 and mat3x3_new.cols[2].z == 1);

    const mat3x4_new = Mat3x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0);
    try testing.expect(mat3x4_new.cols[0].x == 1 and mat3x4_new.cols[0].y == 0 and mat3x4_new.cols[0].z == 0 and mat3x4_new.cols[0].w == 0 and mat3x4_new.cols[1].x == 0 and mat3x4_new.cols[1].y == 1 and mat3x4_new.cols[1].z == 0 and mat3x4_new.cols[1].w == 0 and mat3x4_new.cols[2].x == 0 and mat3x4_new.cols[2].y == 0 and mat3x4_new.cols[2].z == 1 and mat3x4_new.cols[2].w == 0);

    const mat4x2_new = Mat4x2(f32).new(1, 0, 0, 1, 0, 0, 0, 0);
    try testing.expect(mat4x2_new.cols[0].x == 1 and mat4x2_new.cols[0].y == 0 and mat4x2_new.cols[1].x == 0 and mat4x2_new.cols[1].y == 1 and mat4x2_new.cols[2].x == 0 and mat4x2_new.cols[2].y == 0 and mat4x2_new.cols[3].x == 0 and mat4x2_new.cols[3].y == 0);

    const mat4x3_new = Mat4x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0);
    try testing.expect(mat4x3_new.cols[0].x == 1 and mat4x3_new.cols[0].y == 0 and mat4x3_new.cols[0].z == 0 and mat4x3_new.cols[1].x == 0 and mat4x3_new.cols[1].y == 1 and mat4x3_new.cols[1].z == 0 and mat4x3_new.cols[2].x == 0 and mat4x3_new.cols[2].y == 0 and mat4x3_new.cols[2].z == 1 and mat4x3_new.cols[3].x == 0 and mat4x3_new.cols[3].y == 0 and mat4x3_new.cols[3].z == 0);

    const mat4x4_new = Mat4x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    try testing.expect(mat4x4_new.cols[0].x == 1 and mat4x4_new.cols[0].y == 0 and mat4x4_new.cols[0].z == 0 and mat4x4_new.cols[0].w == 0 and mat4x4_new.cols[1].x == 0 and mat4x4_new.cols[1].y == 1 and mat4x4_new.cols[1].z == 0 and mat4x4_new.cols[1].w == 0 and mat4x4_new.cols[2].x == 0 and mat4x4_new.cols[2].y == 0 and mat4x4_new.cols[2].z == 1 and mat4x4_new.cols[2].w == 0 and mat4x4_new.cols[3].x == 0 and mat4x4_new.cols[3].y == 0 and mat4x4_new.cols[3].z == 0 and mat4x4_new.cols[3].w == 1);
}

test "Mat.as(...)" {
    try testing.expectEqual(Mat2x2(f32).new(1, 1, 1, 1), Mat2x2(f32).as(1));

    try testing.expectEqual(Mat3x2(f32).new(1, 1, 1, 1, 1, 1), Mat3x2(f32).as(1));
}

test "Mat.fromMat(...)" {
    try testing.expectEqual(Mat2x2(f32).as(1), Mat2x2(f32).fromMat(2, 2, Mat2x2(f32).as(1)));
    try testing.expectEqual(Mat2x2(f32).as(1), Mat2x2(f32).fromMat(2, 3, Mat2x3(f32).as(1)));
    try testing.expectEqual(Mat2x3(f32).as(1), Mat2x3(f32).fromMat(3, 3, Mat3x3(f32).as(1)));
    try testing.expectEqual(Mat4x4(f32).new(1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0), Mat4x4(f32).fromMat(3, 3, Mat3x3(f32).as(1)));
    try testing.expectEqual(Mat4x4(f32).new(1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0), Mat4x4(f32).fromMat(3, 2, Mat3x2(f32).as(1)));
    try testing.expectEqual(Mat3x3(f32).new(1, 1, 0, 1, 1, 0, 1, 1, 0), Mat3x3(f32).fromMat(4, 2, Mat4x2(f32).as(1)));
}

test "Mat.toMat(...)" {
    try testing.expectEqual(Mat2x2(f32).as(1), Mat2x2(f32).as(1).toMat(2, 2));
    try testing.expectEqual(Mat2x2(f32).as(1), Mat2x3(f32).as(1).toMat(2, 2));
    try testing.expectEqual(Mat2x2(f32).as(1), Mat3x3(f32).as(1).toMat(2, 2));
    try testing.expectEqual(Mat3x3(f32).new(1, 1, 1, 1, 1, 1, 0, 0, 0), Mat2x4(f32).as(1).toMat(3, 3));
    try testing.expectEqual(Mat3x4(f32).new(1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0), Mat2x4(f32).as(1).toMat(3, 4));
    try testing.expectEqual(Mat4x3(f32).new(1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0), Mat2x4(f32).as(1).toMat(4, 3));
}

test "Mat.getAt/at/col(...)" {
    try testing.expectEqual(Vec2(f32).as(1), Mat2x2(f32).as(1).getAt(1));
    try testing.expectEqual(Vec3(f32).as(1), Mat2x3(f32).as(1).getAt(1));
    try testing.expectEqual(Vec4(f32).as(1), Mat3x4(f32).as(1).getAt(1));
    try testing.expectEqual(@as(f32, 1), Mat3x4(f32).as(1).col(0).row(0));
}

test "Mat.row(...)" {
    try testing.expectEqual(Vec2(f32).as(1), Mat2x2(f32).as(1).row(1));
    try testing.expectEqual(Vec3(f32).as(1), Mat3x2(f32).as(1).row(1));
    try testing.expectEqual(Vec2(f32).new(3, 4), Mat2x2(f32).rows(Vec2(f32).new(1, 2), Vec2(f32).new(3, 4)).row(1));
    try testing.expectEqual(@as(f32, 1), Mat3x4(f32).as(1).row(0).col(0));
}

test "Mat.setAt(...)" {
    var mat = Mat2x2(f32).as(1);
    try testing.expectEqual(Mat2x2(f32).as(1), mat);
    mat.setAt(0, 1, 10);
    try testing.expectEqual(Mat2x2(f32).new(1, 10, 1, 1), mat);
}

test "Mat.equal(...)" {
    try testing.expectEqual(Mat2x2(bool).as(true), Mat2x2(bool).as(false).equal(Mat2x2(bool).as(false)));
    try testing.expectEqual(Mat2x2(bool).new(true, false, false, false), Mat2x2(f32).new(1, 2, 3, 4).equal(Mat2x2(f32).as(1)));
    try testing.expectEqual(Mat2x2(bool).as(false), Mat2x2(f32).new(0, 2, 3, 4).equal(Mat2x2(f32).as(1)));
}

test "Mat.notEqual(...)" {
    try testing.expectEqual(Mat2x2(bool).as(true), Mat2x2(bool).as(true).notEqual(Mat2x2(bool).as(false)));
    try testing.expectEqual(Mat2x2(bool).new(false, true, true, true), Mat2x2(f32).new(1, 2, 3, 4).notEqual(Mat2x2(f32).as(1)));
    try testing.expectEqual(Mat2x2(bool).as(true), Mat2x2(f32).new(0, 2, 3, 4).notEqual(Mat2x2(f32).as(1)));
}

test "Mat.eql(...)" {
    try testing.expect(Mat2x2(f32).new(1, 2, 3, 4).eql(Mat2x2(f32).rows(Vec2(f32).new(1, 3), Vec2(f32).new(2, 4))));
    try testing.expect(!Mat2x3(f32).as(1).eql(Mat2x3(f32).new(1, 1, 1, 1, 1, 2)));
}

test "Mat.cols(...)" {
    try testing.expectEqual(Mat2x2(f32).new(1, 0, 0, 1), Mat2x2(f32).cols(Vec2(f32).new(1, 0), Vec2(f32).new(0, 1)));
    try testing.expectEqual(Mat2x3(f32).new(1, 0, 0, 0, 1, 0), Mat2x3(f32).cols(Vec3(f32).new(1, 0, 0), Vec3(f32).new(0, 1, 0)));
    try testing.expectEqual(Mat2x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0), Mat2x4(f32).cols(Vec4(f32).new(1, 0, 0, 0), Vec4(f32).new(0, 1, 0, 0)));

    try testing.expectEqual(Mat3x2(f32).new(1, 0, 0, 1, 0, 0), Mat3x2(f32).cols(Vec2(f32).new(1, 0), Vec2(f32).new(0, 1), Vec2(f32).new(0, 0)));
    try testing.expectEqual(Mat3x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1), Mat3x3(f32).cols(Vec3(f32).new(1, 0, 0), Vec3(f32).new(0, 1, 0), Vec3(f32).new(0, 0, 1)));
    try testing.expectEqual(Mat3x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0), Mat3x4(f32).cols(Vec4(f32).new(1, 0, 0, 0), Vec4(f32).new(0, 1, 0, 0), Vec4(f32).new(0, 0, 1, 0)));

    try testing.expectEqual(Mat4x2(f32).new(1, 0, 0, 1, 0, 0, 0, 0), Mat4x2(f32).cols(Vec2(f32).new(1, 0), Vec2(f32).new(0, 1), Vec2(f32).new(0, 0), Vec2(f32).new(0, 0)));
    try testing.expectEqual(Mat4x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0), Mat4x3(f32).cols(Vec3(f32).new(1, 0, 0), Vec3(f32).new(0, 1, 0), Vec3(f32).new(0, 0, 1), Vec3(f32).new(0, 0, 0)));
    try testing.expectEqual(Mat4x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1), Mat4x4(f32).cols(Vec4(f32).new(1, 0, 0, 0), Vec4(f32).new(0, 1, 0, 0), Vec4(f32).new(0, 0, 1, 0), Vec4(f32).new(0, 0, 0, 1)));
}

test "Mat.rows(...)" {
    try testing.expectEqual(Mat2x2(f32).new(1, 0, 0, 1), Mat2x2(f32).rows(Vec2(f32).new(1, 0), Vec2(f32).new(0, 1)));
    try testing.expectEqual(Mat3x2(f32).new(1, 0, 0, 1, 0, 0), Mat3x2(f32).rows(Vec3(f32).new(1, 0, 0), Vec3(f32).new(0, 1, 0)));
    try testing.expectEqual(Mat4x2(f32).new(1, 0, 0, 1, 0, 0, 0, 0), Mat4x2(f32).rows(Vec4(f32).new(1, 0, 0, 0), Vec4(f32).new(0, 1, 0, 0)));

    try testing.expectEqual(Mat2x3(f32).new(1, 0, 0, 0, 1, 0), Mat2x3(f32).rows(Vec2(f32).new(1, 0), Vec2(f32).new(0, 1), Vec2(f32).new(0, 0)));
    try testing.expectEqual(Mat3x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1), Mat3x3(f32).rows(Vec3(f32).new(1, 0, 0), Vec3(f32).new(0, 1, 0), Vec3(f32).new(0, 0, 1)));
    try testing.expectEqual(Mat4x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0), Mat4x3(f32).rows(Vec4(f32).new(1, 0, 0, 0), Vec4(f32).new(0, 1, 0, 0), Vec4(f32).new(0, 0, 1, 0)));

    try testing.expectEqual(Mat2x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0), Mat2x4(f32).rows(Vec2(f32).new(1, 0), Vec2(f32).new(0, 1), Vec2(f32).new(0, 0), Vec2(f32).new(0, 0)));
    try testing.expectEqual(Mat3x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0), Mat3x4(f32).rows(Vec3(f32).new(1, 0, 0), Vec3(f32).new(0, 1, 0), Vec3(f32).new(0, 0, 1), Vec3(f32).new(0, 0, 0)));
    try testing.expectEqual(Mat4x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1), Mat4x4(f32).rows(Vec4(f32).new(1, 0, 0, 0), Vec4(f32).new(0, 1, 0, 0), Vec4(f32).new(0, 0, 1, 0), Vec4(f32).new(0, 0, 0, 1)));
}

test "Mat.diagonal(...)" {
    try testing.expectEqual(Mat2x2(f32).new(1, 0, 0, 1), Mat2x2(f32).diagonal(1, 1));
    try testing.expectEqual(Mat2x3(f32).new(1, 0, 0, 0, 1, 0), Mat2x3(f32).diagonal(1, 1));
    try testing.expectEqual(Mat2x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0), Mat2x4(f32).diagonal(1, 1));

    try testing.expectEqual(Mat3x2(f32).new(1, 0, 0, 1, 0, 0), Mat3x2(f32).diagonal(1, 1));
    try testing.expectEqual(Mat3x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1), Mat3x3(f32).diagonal(1, 1, 1));
    try testing.expectEqual(Mat3x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0), Mat3x4(f32).diagonal(1, 1, 1));

    try testing.expectEqual(Mat4x2(f32).new(1, 0, 0, 1, 0, 0, 0, 0), Mat4x2(f32).diagonal(1, 1));
    try testing.expectEqual(Mat4x3(f32).new(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0), Mat4x3(f32).diagonal(1, 1, 1));
    try testing.expectEqual(Mat4x4(f32).new(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1), Mat4x4(f32).diagonal(1, 1, 1, 1));
}

test "Mat.scalar(...)" {
    try testing.expectEqual(Mat2x2(f32).diagonal(1, 1), Mat2x2(f32).scalar(1));

    try testing.expectEqual(Mat3x3(f32).diagonal(1, 1, 1), Mat3x3(f32).scalar(1));

    try testing.expectEqual(Mat4x4(f32).diagonal(1, 1, 1, 1), Mat4x4(f32).scalar(1));
}

test "Mat.identity" {
    try testing.expectEqual(Mat2x2(f32).scalar(1), Mat2x2(f32).identity);

    try testing.expectEqual(Mat3x3(f32).scalar(1), Mat3x3(f32).identity);

    try testing.expectEqual(Mat4x4(f32).scalar(1), Mat4x4(f32).identity);
}
