const std = @import("std");
const glm = @import("ziglm");
const testing = std.testing;

const Vec1 = glm.Vec1;
const Vec2 = glm.Vec2;
const Vec3 = glm.Vec3;
const Vec4 = glm.Vec4;

test "Vec.dimens" {
    try testing.expect(Vec1(f32).dimens == 1);
    try testing.expect(Vec2(f32).dimens == 2);
    try testing.expect(Vec3(f32).dimens == 3);
    try testing.expect(Vec4(f32).dimens == 4);

    try testing.expect(Vec1(i32).dimens == 1);
    try testing.expect(Vec2(i32).dimens == 2);
    try testing.expect(Vec3(i32).dimens == 3);
    try testing.expect(Vec4(i32).dimens == 4);

    try testing.expect(Vec1(bool).dimens == 1);
    try testing.expect(Vec2(bool).dimens == 2);
    try testing.expect(Vec3(bool).dimens == 3);
    try testing.expect(Vec4(bool).dimens == 4);
}

test "Vec.new" {
    const vec1f32 = Vec1(f32).new(1);
    try testing.expect(vec1f32.x == 1);

    const vec2f32 = Vec2(f32).new(1, 2);
    try testing.expect(vec2f32.x == 1 and vec2f32.y == 2);

    const vec3f32 = Vec3(f32).new(1, 2, 3);
    try testing.expect(vec3f32.x == 1 and vec3f32.y == 2 and vec3f32.z == 3);

    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);
    try testing.expect(vec4f32.x == 1 and vec4f32.y == 2 and vec4f32.z == 3 and vec4f32.w == 4);

    const vec1i32 = Vec1(i32).new(1);
    try testing.expect(vec1i32.x == 1);

    const vec2i32 = Vec2(i32).new(1, 2);
    try testing.expect(vec2i32.x == 1 and vec2i32.y == 2);

    const vec3i32 = Vec3(i32).new(1, 2, 3);
    try testing.expect(vec3i32.x == 1 and vec3i32.y == 2 and vec3i32.z == 3);

    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);
    try testing.expect(vec4i32.x == 1 and vec4i32.y == 2 and vec4i32.z == 3 and vec4i32.w == 4);

    const vec1bool = Vec1(bool).new(true);
    try testing.expect(vec1bool.x == true);

    const vec2bool = Vec2(bool).new(true, true);
    try testing.expect(vec2bool.x == true and vec2bool.y == true);

    const vec3bool = Vec3(bool).new(true, true, true);
    try testing.expect(vec3bool.x == true and vec3bool.y == true and vec3bool.z == true);

    const vec4bool = Vec4(bool).new(true, true, true, true);
    try testing.expect(vec4bool.x == true and vec4bool.y == true and vec4bool.z == true and vec4bool.w == true);
}

test "Vec.as" {
    const vec1f32 = Vec1(f32).as(1);
    try testing.expect(vec1f32.x == 1);

    const vec2f32 = Vec2(f32).as(1);
    try testing.expect(vec2f32.x == 1 and vec2f32.y == 1);

    const vec3f32 = Vec3(f32).as(1);
    try testing.expect(vec3f32.x == 1 and vec3f32.y == 1 and vec3f32.z == 1);

    const vec4f32 = Vec4(f32).as(1);
    try testing.expect(vec4f32.x == 1 and vec4f32.y == 1 and vec4f32.z == 1 and vec4f32.w == 1);

    const vec1i32 = Vec1(i32).as(1);
    try testing.expect(vec1i32.x == 1);

    const vec2i32 = Vec2(i32).as(1);
    try testing.expect(vec2i32.x == 1 and vec2i32.y == 1);

    const vec3i32 = Vec3(i32).as(1);
    try testing.expect(vec3i32.x == 1 and vec3i32.y == 1 and vec3i32.z == 1);

    const vec4i32 = Vec4(i32).as(1);
    try testing.expect(vec4i32.x == 1 and vec4i32.y == 1 and vec4i32.z == 1 and vec4i32.w == 1);

    const vec1bool = Vec1(bool).as(true);
    try testing.expect(vec1bool.x == true);

    const vec2bool = Vec2(bool).as(true);
    try testing.expect(vec2bool.x == true and vec2bool.y == true);

    const vec3bool = Vec3(bool).as(true);
    try testing.expect(vec3bool.x == true and vec3bool.y == true and vec3bool.z == true);

    const vec4bool = Vec4(bool).as(true);
    try testing.expect(vec4bool.x == true and vec4bool.y == true and vec4bool.z == true and vec4bool.w == true);
}

test "Vec.fromVec" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    const vec1f32_fromVec1 = Vec1(f32).fromVec(1, vec1f32);
    try testing.expect(vec1f32_fromVec1.x == 1);
    const vec1f32_fromVec2 = Vec1(f32).fromVec(2, vec2f32);
    try testing.expect(vec1f32_fromVec2.x == 1);
    const vec1f32_fromVec3 = Vec1(f32).fromVec(3, vec3f32);
    try testing.expect(vec1f32_fromVec3.x == 1);
    const vec1f32_fromVec4 = Vec1(f32).fromVec(4, vec4f32);
    try testing.expect(vec1f32_fromVec4.x == 1);

    const vec2f32_fromVec1 = Vec2(f32).fromVec(1, vec1f32);
    try testing.expect(vec2f32_fromVec1.x == 1 and vec2f32_fromVec1.y == 0);
    const vec2f32_fromVec2 = Vec2(f32).fromVec(2, vec2f32);
    try testing.expect(vec2f32_fromVec2.x == 1 and vec2f32_fromVec2.y == 2);
    const vec2f32_fromVec3 = Vec2(f32).fromVec(3, vec3f32);
    try testing.expect(vec2f32_fromVec3.x == 1 and vec2f32_fromVec3.y == 2);
    const vec2f32_fromVec4 = Vec2(f32).fromVec(4, vec4f32);
    try testing.expect(vec2f32_fromVec4.x == 1 and vec2f32_fromVec4.y == 2);

    const vec3f32_fromVec1 = Vec3(f32).fromVec(1, vec1f32);
    try testing.expect(vec3f32_fromVec1.x == 1 and vec3f32_fromVec1.y == 0 and vec3f32_fromVec1.z == 0);
    const vec3f32_fromVec2 = Vec3(f32).fromVec(2, vec2f32);
    try testing.expect(vec3f32_fromVec2.x == 1 and vec3f32_fromVec2.y == 2 and vec3f32_fromVec2.z == 0);
    const vec3f32_fromVec3 = Vec3(f32).fromVec(3, vec3f32);
    try testing.expect(vec3f32_fromVec3.x == 1 and vec3f32_fromVec3.y == 2 and vec3f32_fromVec3.z == 3);
    const vec3f32_fromVec4 = Vec3(f32).fromVec(4, vec4f32);
    try testing.expect(vec3f32_fromVec4.x == 1 and vec3f32_fromVec4.y == 2 and vec3f32_fromVec4.z == 3);

    const vec4f32_fromVec1 = Vec4(f32).fromVec(1, vec1f32);
    try testing.expect(vec4f32_fromVec1.x == 1 and vec4f32_fromVec1.y == 0 and vec4f32_fromVec1.z == 0 and vec4f32_fromVec1.w == 0);
    const vec4f32_fromVec2 = Vec4(f32).fromVec(2, vec2f32);
    try testing.expect(vec4f32_fromVec2.x == 1 and vec4f32_fromVec2.y == 2 and vec4f32_fromVec2.z == 0 and vec4f32_fromVec2.w == 0);
    const vec4f32_fromVec3 = Vec4(f32).fromVec(3, vec3f32);
    try testing.expect(vec4f32_fromVec3.x == 1 and vec4f32_fromVec3.y == 2 and vec4f32_fromVec3.z == 3 and vec4f32_fromVec3.w == 0);
    const vec4f32_fromVec4 = Vec4(f32).fromVec(4, vec4f32);
    try testing.expect(vec4f32_fromVec4.x == 1 and vec4f32_fromVec4.y == 2 and vec4f32_fromVec4.z == 3 and vec4f32_fromVec4.w == 4);

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    const vec1i32_fromVec1 = Vec1(i32).fromVec(1, vec1i32);
    try testing.expect(vec1i32_fromVec1.x == 1);
    const vec1i32_fromVec2 = Vec1(i32).fromVec(2, vec2i32);
    try testing.expect(vec1i32_fromVec2.x == 1);
    const vec1i32_fromVec3 = Vec1(i32).fromVec(3, vec3i32);
    try testing.expect(vec1i32_fromVec3.x == 1);
    const vec1i32_fromVec4 = Vec1(i32).fromVec(4, vec4i32);
    try testing.expect(vec1i32_fromVec4.x == 1);

    const vec2i32_fromVec1 = Vec2(i32).fromVec(1, vec1i32);
    try testing.expect(vec2i32_fromVec1.x == 1 and vec2i32_fromVec1.y == 0);
    const vec2i32_fromVec2 = Vec2(i32).fromVec(2, vec2i32);
    try testing.expect(vec2i32_fromVec2.x == 1 and vec2i32_fromVec2.y == 2);
    const vec2i32_fromVec3 = Vec2(i32).fromVec(3, vec3i32);
    try testing.expect(vec2i32_fromVec3.x == 1 and vec2i32_fromVec3.y == 2);
    const vec2i32_fromVec4 = Vec2(i32).fromVec(4, vec4i32);
    try testing.expect(vec2i32_fromVec4.x == 1 and vec2i32_fromVec4.y == 2);

    const vec3i32_fromVec1 = Vec3(i32).fromVec(1, vec1i32);
    try testing.expect(vec3i32_fromVec1.x == 1 and vec3i32_fromVec1.y == 0 and vec3i32_fromVec1.z == 0);
    const vec3i32_fromVec2 = Vec3(i32).fromVec(2, vec2i32);
    try testing.expect(vec3i32_fromVec2.x == 1 and vec3i32_fromVec2.y == 2 and vec3i32_fromVec2.z == 0);
    const vec3i32_fromVec3 = Vec3(i32).fromVec(3, vec3i32);
    try testing.expect(vec3i32_fromVec3.x == 1 and vec3i32_fromVec3.y == 2 and vec3i32_fromVec3.z == 3);
    const vec3i32_fromVec4 = Vec3(i32).fromVec(4, vec4i32);
    try testing.expect(vec3i32_fromVec4.x == 1 and vec3i32_fromVec4.y == 2 and vec3i32_fromVec4.z == 3);

    const vec4i32_fromVec1 = Vec4(i32).fromVec(1, vec1i32);
    try testing.expect(vec4i32_fromVec1.x == 1 and vec4i32_fromVec1.y == 0 and vec4i32_fromVec1.z == 0 and vec4i32_fromVec1.w == 0);
    const vec4i32_fromVec2 = Vec4(i32).fromVec(2, vec2i32);
    try testing.expect(vec4i32_fromVec2.x == 1 and vec4i32_fromVec2.y == 2 and vec4i32_fromVec2.z == 0 and vec4i32_fromVec2.w == 0);
    const vec4i32_fromVec3 = Vec4(i32).fromVec(3, vec3i32);
    try testing.expect(vec4i32_fromVec3.x == 1 and vec4i32_fromVec3.y == 2 and vec4i32_fromVec3.z == 3 and vec4i32_fromVec3.w == 0);
    const vec4i32_fromVec4 = Vec4(i32).fromVec(4, vec4i32);
    try testing.expect(vec4i32_fromVec4.x == 1 and vec4i32_fromVec4.y == 2 and vec4i32_fromVec4.z == 3 and vec4i32_fromVec4.w == 4);

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, true);
    const vec3bool = Vec3(bool).new(true, true, true);
    const vec4bool = Vec4(bool).new(true, true, true, true);

    const vec1bool_fromVec1 = Vec1(bool).fromVec(1, vec1bool);
    try testing.expect(vec1bool_fromVec1.x == true);
    const vec1bool_fromVec2 = Vec1(bool).fromVec(2, vec2bool);
    try testing.expect(vec1bool_fromVec2.x == true);
    const vec1bool_fromVec3 = Vec1(bool).fromVec(3, vec3bool);
    try testing.expect(vec1bool_fromVec3.x == true);
    const vec1bool_fromVec4 = Vec1(bool).fromVec(4, vec4bool);
    try testing.expect(vec1bool_fromVec4.x == true);

    const vec2bool_fromVec1 = Vec2(bool).fromVec(1, vec1bool);
    try testing.expect(vec2bool_fromVec1.x == true and vec2bool_fromVec1.y == false);
    const vec2bool_fromVec2 = Vec2(bool).fromVec(2, vec2bool);
    try testing.expect(vec2bool_fromVec2.x == true and vec2bool_fromVec2.y == true);
    const vec2bool_fromVec3 = Vec2(bool).fromVec(3, vec3bool);
    try testing.expect(vec2bool_fromVec3.x == true and vec2bool_fromVec3.y == true);
    const vec2bool_fromVec4 = Vec2(bool).fromVec(4, vec4bool);
    try testing.expect(vec2bool_fromVec4.x == true and vec2bool_fromVec4.y == true);

    const vec3bool_fromVec1 = Vec3(bool).fromVec(1, vec1bool);
    try testing.expect(vec3bool_fromVec1.x == true and vec3bool_fromVec1.y == false and vec3bool_fromVec1.z == false);
    const vec3bool_fromVec2 = Vec3(bool).fromVec(2, vec2bool);
    try testing.expect(vec3bool_fromVec2.x == true and vec3bool_fromVec2.y == true and vec3bool_fromVec2.z == false);
    const vec3bool_fromVec3 = Vec3(bool).fromVec(3, vec3bool);
    try testing.expect(vec3bool_fromVec3.x == true and vec3bool_fromVec3.y == true and vec3bool_fromVec3.z == true);
    const vec3bool_fromVec4 = Vec3(bool).fromVec(4, vec4bool);
    try testing.expect(vec3bool_fromVec4.x == true and vec3bool_fromVec4.y == true and vec3bool_fromVec4.z == true);

    const vec4bool_fromVec1 = Vec4(bool).fromVec(1, vec1bool);
    try testing.expect(vec4bool_fromVec1.x == true and vec4bool_fromVec1.y == false and vec4bool_fromVec1.z == false and vec4bool_fromVec1.w == false);
    const vec4bool_fromVec2 = Vec4(bool).fromVec(2, vec2bool);
    try testing.expect(vec4bool_fromVec2.x == true and vec4bool_fromVec2.y == true and vec4bool_fromVec2.z == false and vec4bool_fromVec2.w == false);
    const vec4bool_fromVec3 = Vec4(bool).fromVec(3, vec3bool);
    try testing.expect(vec4bool_fromVec3.x == true and vec4bool_fromVec3.y == true and vec4bool_fromVec3.z == true and vec4bool_fromVec3.w == false);
    const vec4bool_fromVec4 = Vec4(bool).fromVec(4, vec4bool);
    try testing.expect(vec4bool_fromVec4.x == true and vec4bool_fromVec4.y == true and vec4bool_fromVec4.z == true and vec4bool_fromVec4.w == true);
}

test "Vec.fromVector" {
    const vector1f32 = @Vector(1, f32){1};
    const vector2f32 = @Vector(2, f32){ 1, 2 };
    const vector3f32 = @Vector(3, f32){ 1, 2, 3 };
    const vector4f32 = @Vector(4, f32){ 1, 2, 3, 4 };

    const vec1f32_fromVector1 = Vec1(f32).fromVector(1, vector1f32);
    try testing.expect(vec1f32_fromVector1.x == 1);
    const vec1f32_fromVector2 = Vec1(f32).fromVector(2, vector2f32);
    try testing.expect(vec1f32_fromVector2.x == 1);
    const vec1f32_fromVector3 = Vec1(f32).fromVector(3, vector3f32);
    try testing.expect(vec1f32_fromVector3.x == 1);
    const vec1f32_fromVector4 = Vec1(f32).fromVector(4, vector4f32);
    try testing.expect(vec1f32_fromVector4.x == 1);

    const vec2f32_fromVector1 = Vec2(f32).fromVector(1, vector1f32);
    try testing.expect(vec2f32_fromVector1.x == 1 and vec2f32_fromVector1.y == 0);
    const vec2f32_fromVector2 = Vec2(f32).fromVector(2, vector2f32);
    try testing.expect(vec2f32_fromVector2.x == 1 and vec2f32_fromVector2.y == 2);
    const vec2f32_fromVector3 = Vec2(f32).fromVector(3, vector3f32);
    try testing.expect(vec2f32_fromVector3.x == 1 and vec2f32_fromVector3.y == 2);
    const vec2f32_fromVector4 = Vec2(f32).fromVector(4, vector4f32);
    try testing.expect(vec2f32_fromVector4.x == 1 and vec2f32_fromVector4.y == 2);

    const vec3f32_fromVector1 = Vec3(f32).fromVector(1, vector1f32);
    try testing.expect(vec3f32_fromVector1.x == 1 and vec3f32_fromVector1.y == 0 and vec3f32_fromVector1.z == 0);
    const vec3f32_fromVector2 = Vec3(f32).fromVector(2, vector2f32);
    try testing.expect(vec3f32_fromVector2.x == 1 and vec3f32_fromVector2.y == 2 and vec3f32_fromVector2.z == 0);
    const vec3f32_fromVector3 = Vec3(f32).fromVector(3, vector3f32);
    try testing.expect(vec3f32_fromVector3.x == 1 and vec3f32_fromVector3.y == 2 and vec3f32_fromVector3.z == 3);
    const vec3f32_fromVector4 = Vec3(f32).fromVector(4, vector4f32);
    try testing.expect(vec3f32_fromVector4.x == 1 and vec3f32_fromVector4.y == 2 and vec3f32_fromVector4.z == 3);

    const vec4f32_fromVector1 = Vec4(f32).fromVector(1, vector1f32);
    try testing.expect(vec4f32_fromVector1.x == 1 and vec4f32_fromVector1.y == 0 and vec4f32_fromVector1.z == 0 and vec4f32_fromVector1.w == 0);
    const vec4f32_fromVector2 = Vec4(f32).fromVector(2, vector2f32);
    try testing.expect(vec4f32_fromVector2.x == 1 and vec4f32_fromVector2.y == 2 and vec4f32_fromVector2.z == 0 and vec4f32_fromVector2.w == 0);
    const vec4f32_fromVector3 = Vec4(f32).fromVector(3, vector3f32);
    try testing.expect(vec4f32_fromVector3.x == 1 and vec4f32_fromVector3.y == 2 and vec4f32_fromVector3.z == 3 and vec4f32_fromVector3.w == 0);
    const vec4f32_fromVector4 = Vec4(f32).fromVector(4, vector4f32);
    try testing.expect(vec4f32_fromVector4.x == 1 and vec4f32_fromVector4.y == 2 and vec4f32_fromVector4.z == 3 and vec4f32_fromVector4.w == 4);

    const vector1i32 = @Vector(1, i32){1};
    const vector2i32 = @Vector(2, i32){ 1, 2 };
    const vector3i32 = @Vector(3, i32){ 1, 2, 3 };
    const vector4i32 = @Vector(4, i32){ 1, 2, 3, 4 };

    const vec1i32_fromVector1 = Vec1(i32).fromVector(1, vector1i32);
    try testing.expect(vec1i32_fromVector1.x == 1);
    const vec1i32_fromVector2 = Vec1(i32).fromVector(2, vector2i32);
    try testing.expect(vec1i32_fromVector2.x == 1);
    const vec1i32_fromVector3 = Vec1(i32).fromVector(3, vector3i32);
    try testing.expect(vec1i32_fromVector3.x == 1);
    const vec1i32_fromVector4 = Vec1(i32).fromVector(4, vector4i32);
    try testing.expect(vec1i32_fromVector4.x == 1);

    const vec2i32_fromVector1 = Vec2(i32).fromVector(1, vector1i32);
    try testing.expect(vec2i32_fromVector1.x == 1 and vec2i32_fromVector1.y == 0);
    const vec2i32_fromVector2 = Vec2(i32).fromVector(2, vector2i32);
    try testing.expect(vec2i32_fromVector2.x == 1 and vec2i32_fromVector2.y == 2);
    const vec2i32_fromVector3 = Vec2(i32).fromVector(3, vector3i32);
    try testing.expect(vec2i32_fromVector3.x == 1 and vec2i32_fromVector3.y == 2);
    const vec2i32_fromVector4 = Vec2(i32).fromVector(4, vector4i32);
    try testing.expect(vec2i32_fromVector4.x == 1 and vec2i32_fromVector4.y == 2);

    const vec3i32_fromVector1 = Vec3(i32).fromVector(1, vector1i32);
    try testing.expect(vec3i32_fromVector1.x == 1 and vec3i32_fromVector1.y == 0 and vec3i32_fromVector1.z == 0);
    const vec3i32_fromVector2 = Vec3(i32).fromVector(2, vector2i32);
    try testing.expect(vec3i32_fromVector2.x == 1 and vec3i32_fromVector2.y == 2 and vec3i32_fromVector2.z == 0);
    const vec3i32_fromVector3 = Vec3(i32).fromVector(3, vector3i32);
    try testing.expect(vec3i32_fromVector3.x == 1 and vec3i32_fromVector3.y == 2 and vec3i32_fromVector3.z == 3);
    const vec3i32_fromVector4 = Vec3(i32).fromVector(4, vector4i32);
    try testing.expect(vec3i32_fromVector4.x == 1 and vec3i32_fromVector4.y == 2 and vec3i32_fromVector4.z == 3);

    const vec4i32_fromVector1 = Vec4(i32).fromVector(1, vector1i32);
    try testing.expect(vec4i32_fromVector1.x == 1 and vec4i32_fromVector1.y == 0 and vec4i32_fromVector1.z == 0 and vec4i32_fromVector1.w == 0);
    const vec4i32_fromVector2 = Vec4(i32).fromVector(2, vector2i32);
    try testing.expect(vec4i32_fromVector2.x == 1 and vec4i32_fromVector2.y == 2 and vec4i32_fromVector2.z == 0 and vec4i32_fromVector2.w == 0);
    const vec4i32_fromVector3 = Vec4(i32).fromVector(3, vector3i32);
    try testing.expect(vec4i32_fromVector3.x == 1 and vec4i32_fromVector3.y == 2 and vec4i32_fromVector3.z == 3 and vec4i32_fromVector3.w == 0);
    const vec4i32_fromVector4 = Vec4(i32).fromVector(4, vector4i32);
    try testing.expect(vec4i32_fromVector4.x == 1 and vec4i32_fromVector4.y == 2 and vec4i32_fromVector4.z == 3 and vec4i32_fromVector4.w == 4);

    const vector1bool = @Vector(1, bool){true};
    const vector2bool = @Vector(2, bool){ true, true };
    const vector3bool = @Vector(3, bool){ true, true, true };
    const vector4bool = @Vector(4, bool){ true, true, true, true };

    const vec1bool_fromVector1 = Vec1(bool).fromVector(1, vector1bool);
    try testing.expect(vec1bool_fromVector1.x == true);
    const vec1bool_fromVector2 = Vec1(bool).fromVector(2, vector2bool);
    try testing.expect(vec1bool_fromVector2.x == true);
    const vec1bool_fromVector3 = Vec1(bool).fromVector(3, vector3bool);
    try testing.expect(vec1bool_fromVector3.x == true);
    const vec1bool_fromVector4 = Vec1(bool).fromVector(4, vector4bool);
    try testing.expect(vec1bool_fromVector4.x == true);

    const vec2bool_fromVector1 = Vec2(bool).fromVector(1, vector1bool);
    try testing.expect(vec2bool_fromVector1.x == true and vec2bool_fromVector1.y == false);
    const vec2bool_fromVector2 = Vec2(bool).fromVector(2, vector2bool);
    try testing.expect(vec2bool_fromVector2.x == true and vec2bool_fromVector2.y == true);
    const vec2bool_fromVector3 = Vec2(bool).fromVector(3, vector3bool);
    try testing.expect(vec2bool_fromVector3.x == true and vec2bool_fromVector3.y == true);
    const vec2bool_fromVector4 = Vec2(bool).fromVector(4, vector4bool);
    try testing.expect(vec2bool_fromVector4.x == true and vec2bool_fromVector4.y == true);

    const vec3bool_fromVector1 = Vec3(bool).fromVector(1, vector1bool);
    try testing.expect(vec3bool_fromVector1.x == true and vec3bool_fromVector1.y == false and vec3bool_fromVector1.z == false);
    const vec3bool_fromVector2 = Vec3(bool).fromVector(2, vector2bool);
    try testing.expect(vec3bool_fromVector2.x == true and vec3bool_fromVector2.y == true and vec3bool_fromVector2.z == false);
    const vec3bool_fromVector3 = Vec3(bool).fromVector(3, vector3bool);
    try testing.expect(vec3bool_fromVector3.x == true and vec3bool_fromVector3.y == true and vec3bool_fromVector3.z == true);
    const vec3bool_fromVector4 = Vec3(bool).fromVector(4, vector4bool);
    try testing.expect(vec3bool_fromVector4.x == true and vec3bool_fromVector4.y == true and vec3bool_fromVector4.z == true);

    const vec4bool_fromVector1 = Vec4(bool).fromVector(1, vector1bool);
    try testing.expect(vec4bool_fromVector1.x == true and vec4bool_fromVector1.y == false and vec4bool_fromVector1.z == false and vec4bool_fromVector1.w == false);
    const vec4bool_fromVector2 = Vec4(bool).fromVector(2, vector2bool);
    try testing.expect(vec4bool_fromVector2.x == true and vec4bool_fromVector2.y == true and vec4bool_fromVector2.z == false and vec4bool_fromVector2.w == false);
    const vec4bool_fromVector3 = Vec4(bool).fromVector(3, vector3bool);
    try testing.expect(vec4bool_fromVector3.x == true and vec4bool_fromVector3.y == true and vec4bool_fromVector3.z == true and vec4bool_fromVector3.w == false);
    const vec4bool_fromVector4 = Vec4(bool).fromVector(4, vector4bool);
    try testing.expect(vec4bool_fromVector4.x == true and vec4bool_fromVector4.y == true and vec4bool_fromVector4.z == true and vec4bool_fromVector4.w == true);
}

test "Vec.toVec" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    const vec1f32_toVec1 = vec1f32.toVec(1);
    try testing.expect(vec1f32_toVec1.x == 1);
    const vec1f32_toVec2 = vec1f32.toVec(2);
    try testing.expect(vec1f32_toVec2.x == 1 and vec1f32_toVec2.y == 0);
    const vec1f32_toVec3 = vec1f32.toVec(3);
    try testing.expect(vec1f32_toVec3.x == 1 and vec1f32_toVec3.y == 0 and vec1f32_toVec3.z == 0);
    const vec1f32_toVec4 = vec1f32.toVec(4);
    try testing.expect(vec1f32_toVec4.x == 1 and vec1f32_toVec4.y == 0 and vec1f32_toVec4.z == 0 and vec1f32_toVec4.w == 0);

    const vec2f32_toVec1 = vec2f32.toVec(1);
    try testing.expect(vec2f32_toVec1.x == 1);
    const vec2f32_toVec2 = vec2f32.toVec(2);
    try testing.expect(vec2f32_toVec2.x == 1 and vec2f32_toVec2.y == 2);
    const vec2f32_toVec3 = vec2f32.toVec(3);
    try testing.expect(vec2f32_toVec3.x == 1 and vec2f32_toVec3.y == 2 and vec2f32_toVec3.z == 0);
    const vec2f32_toVec4 = vec2f32.toVec(4);
    try testing.expect(vec2f32_toVec4.x == 1 and vec2f32_toVec4.y == 2 and vec2f32_toVec4.z == 0 and vec2f32_toVec4.w == 0);

    const vec3f32_toVec1 = vec3f32.toVec(1);
    try testing.expect(vec3f32_toVec1.x == 1);
    const vec3f32_toVec2 = vec3f32.toVec(2);
    try testing.expect(vec3f32_toVec2.x == 1 and vec3f32_toVec2.y == 2);
    const vec3f32_toVec3 = vec3f32.toVec(3);
    try testing.expect(vec3f32_toVec3.x == 1 and vec3f32_toVec3.y == 2 and vec3f32_toVec3.z == 3);
    const vec3f32_toVec4 = vec3f32.toVec(4);
    try testing.expect(vec3f32_toVec4.x == 1 and vec3f32_toVec4.y == 2 and vec3f32_toVec4.z == 3 and vec3f32_toVec4.w == 0);

    const vec4f32_toVec1 = vec4f32.toVec(1);
    try testing.expect(vec4f32_toVec1.x == 1);
    const vec4f32_toVec2 = vec4f32.toVec(2);
    try testing.expect(vec4f32_toVec2.x == 1 and vec4f32_toVec2.y == 2);
    const vec4f32_toVec3 = vec4f32.toVec(3);
    try testing.expect(vec4f32_toVec3.x == 1 and vec4f32_toVec3.y == 2 and vec4f32_toVec3.z == 3);
    const vec4f32_toVec4 = vec4f32.toVec(4);
    try testing.expect(vec4f32_toVec4.x == 1 and vec4f32_toVec4.y == 2 and vec4f32_toVec4.z == 3 and vec4f32_toVec4.w == 4);

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    const vec1i32_toVec1 = vec1i32.toVec(1);
    try testing.expect(vec1i32_toVec1.x == 1);
    const vec1i32_toVec2 = vec1i32.toVec(2);
    try testing.expect(vec1i32_toVec2.x == 1 and vec1i32_toVec2.y == 0);
    const vec1i32_toVec3 = vec1i32.toVec(3);
    try testing.expect(vec1i32_toVec3.x == 1 and vec1i32_toVec3.y == 0 and vec1i32_toVec3.z == 0);
    const vec1i32_toVec4 = vec1i32.toVec(4);
    try testing.expect(vec1i32_toVec4.x == 1 and vec1i32_toVec4.y == 0 and vec1i32_toVec4.z == 0 and vec1i32_toVec4.w == 0);

    const vec2i32_toVec1 = vec2i32.toVec(1);
    try testing.expect(vec2i32_toVec1.x == 1);
    const vec2i32_toVec2 = vec2i32.toVec(2);
    try testing.expect(vec2i32_toVec2.x == 1 and vec2i32_toVec2.y == 2);
    const vec2i32_toVec3 = vec2i32.toVec(3);
    try testing.expect(vec2i32_toVec3.x == 1 and vec2i32_toVec3.y == 2 and vec2i32_toVec3.z == 0);
    const vec2i32_toVec4 = vec2i32.toVec(4);
    try testing.expect(vec2i32_toVec4.x == 1 and vec2i32_toVec4.y == 2 and vec2i32_toVec4.z == 0 and vec2i32_toVec4.w == 0);

    const vec3i32_toVec1 = vec3i32.toVec(1);
    try testing.expect(vec3i32_toVec1.x == 1);
    const vec3i32_toVec2 = vec3i32.toVec(2);
    try testing.expect(vec3i32_toVec2.x == 1 and vec3i32_toVec2.y == 2);
    const vec3i32_toVec3 = vec3i32.toVec(3);
    try testing.expect(vec3i32_toVec3.x == 1 and vec3i32_toVec3.y == 2 and vec3i32_toVec3.z == 3);
    const vec3i32_toVec4 = vec3i32.toVec(4);
    try testing.expect(vec3i32_toVec4.x == 1 and vec3i32_toVec4.y == 2 and vec3i32_toVec4.z == 3 and vec3i32_toVec4.w == 0);

    const vec4i32_toVec1 = vec4i32.toVec(1);
    try testing.expect(vec4i32_toVec1.x == 1);
    const vec4i32_toVec2 = vec4i32.toVec(2);
    try testing.expect(vec4i32_toVec2.x == 1 and vec4i32_toVec2.y == 2);
    const vec4i32_toVec3 = vec4i32.toVec(3);
    try testing.expect(vec4i32_toVec3.x == 1 and vec4i32_toVec3.y == 2 and vec4i32_toVec3.z == 3);
    const vec4i32_toVec4 = vec4i32.toVec(4);
    try testing.expect(vec4i32_toVec4.x == 1 and vec4i32_toVec4.y == 2 and vec4i32_toVec4.z == 3 and vec4i32_toVec4.w == 4);

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, true);
    const vec3bool = Vec3(bool).new(true, true, true);
    const vec4bool = Vec4(bool).new(true, true, true, true);

    const vec1bool_toVec1 = vec1bool.toVec(1);
    try testing.expect(vec1bool_toVec1.x == true);
    const vec1bool_toVec2 = vec1bool.toVec(2);
    try testing.expect(vec1bool_toVec2.x == true and vec1bool_toVec2.y == false);
    const vec1bool_toVec3 = vec1bool.toVec(3);
    try testing.expect(vec1bool_toVec3.x == true and vec1bool_toVec3.y == false and vec1bool_toVec3.z == false);
    const vec1bool_toVec4 = vec1bool.toVec(4);
    try testing.expect(vec1bool_toVec4.x == true and vec1bool_toVec4.y == false and vec1bool_toVec4.z == false and vec1bool_toVec4.w == false);

    const vec2bool_toVec1 = vec2bool.toVec(1);
    try testing.expect(vec2bool_toVec1.x == true);
    const vec2bool_toVec2 = vec2bool.toVec(2);
    try testing.expect(vec2bool_toVec2.x == true and vec2bool_toVec2.y == true);
    const vec2bool_toVec3 = vec2bool.toVec(3);
    try testing.expect(vec2bool_toVec3.x == true and vec2bool_toVec3.y == true and vec2bool_toVec3.z == false);
    const vec2bool_toVec4 = vec2bool.toVec(4);
    try testing.expect(vec2bool_toVec4.x == true and vec2bool_toVec4.y == true and vec2bool_toVec4.z == false and vec2bool_toVec4.w == false);

    const vec3bool_toVec1 = vec3bool.toVec(1);
    try testing.expect(vec3bool_toVec1.x == true);
    const vec3bool_toVec2 = vec3bool.toVec(2);
    try testing.expect(vec3bool_toVec2.x == true and vec3bool_toVec2.y == true);
    const vec3bool_toVec3 = vec3bool.toVec(3);
    try testing.expect(vec3bool_toVec3.x == true and vec3bool_toVec3.y == true and vec3bool_toVec3.z == true);
    const vec3bool_toVec4 = vec3bool.toVec(4);
    try testing.expect(vec3bool_toVec4.x == true and vec3bool_toVec4.y == true and vec3bool_toVec4.z == true and vec3bool_toVec4.w == false);

    const vec4bool_toVec1 = vec4bool.toVec(1);
    try testing.expect(vec4bool_toVec1.x == true);
    const vec4bool_toVec2 = vec4bool.toVec(2);
    try testing.expect(vec4bool_toVec2.x == true and vec4bool_toVec2.y == true);
    const vec4bool_toVec3 = vec4bool.toVec(3);
    try testing.expect(vec4bool_toVec3.x == true and vec4bool_toVec3.y == true and vec4bool_toVec3.z == true);
    const vec4bool_toVec4 = vec4bool.toVec(4);
    try testing.expect(vec4bool_toVec4.x == true and vec4bool_toVec4.y == true and vec4bool_toVec4.z == true and vec4bool_toVec4.w == true);
}

test "Vec.toVector" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    const vec1f32_toVector1 = vec1f32.toVector(1);
    try testing.expect(vec1f32_toVector1[0] == 1);
    const vec1f32_toVector2 = vec1f32.toVector(2);
    try testing.expect(vec1f32_toVector2[0] == 1 and vec1f32_toVector2[1] == 0);
    const vec1f32_toVector3 = vec1f32.toVector(3);
    try testing.expect(vec1f32_toVector3[0] == 1 and vec1f32_toVector3[1] == 0 and vec1f32_toVector3[2] == 0);
    const vec1f32_toVector4 = vec1f32.toVector(4);
    try testing.expect(vec1f32_toVector4[0] == 1 and vec1f32_toVector4[1] == 0 and vec1f32_toVector4[2] == 0 and vec1f32_toVector4[3] == 0);

    const vec2f32_toVector1 = vec2f32.toVector(1);
    try testing.expect(vec2f32_toVector1[0] == 1);
    const vec2f32_toVector2 = vec2f32.toVector(2);
    try testing.expect(vec2f32_toVector2[0] == 1 and vec2f32_toVector2[1] == 2);
    const vec2f32_toVector3 = vec2f32.toVector(3);
    try testing.expect(vec2f32_toVector3[0] == 1 and vec2f32_toVector3[1] == 2 and vec2f32_toVector3[2] == 0);
    const vec2f32_toVector4 = vec2f32.toVector(4);
    try testing.expect(vec2f32_toVector4[0] == 1 and vec2f32_toVector4[1] == 2 and vec2f32_toVector4[2] == 0 and vec2f32_toVector4[3] == 0);

    const vec3f32_toVector1 = vec3f32.toVector(1);
    try testing.expect(vec3f32_toVector1[0] == 1);
    const vec3f32_toVector2 = vec3f32.toVector(2);
    try testing.expect(vec3f32_toVector2[0] == 1 and vec3f32_toVector2[1] == 2);
    const vec3f32_toVector3 = vec3f32.toVector(3);
    try testing.expect(vec3f32_toVector3[0] == 1 and vec3f32_toVector3[1] == 2 and vec3f32_toVector3[2] == 3);
    const vec3f32_toVector4 = vec3f32.toVector(4);
    try testing.expect(vec3f32_toVector4[0] == 1 and vec3f32_toVector4[1] == 2 and vec3f32_toVector4[2] == 3 and vec3f32_toVector4[3] == 0);

    const vec4f32_toVector1 = vec4f32.toVector(1);
    try testing.expect(vec4f32_toVector1[0] == 1);
    const vec4f32_toVector2 = vec4f32.toVector(2);
    try testing.expect(vec4f32_toVector2[0] == 1 and vec4f32_toVector2[1] == 2);
    const vec4f32_toVector3 = vec4f32.toVector(3);
    try testing.expect(vec4f32_toVector3[0] == 1 and vec4f32_toVector3[1] == 2 and vec4f32_toVector3[2] == 3);
    const vec4f32_toVector4 = vec4f32.toVector(4);
    try testing.expect(vec4f32_toVector4[0] == 1 and vec4f32_toVector4[1] == 2 and vec4f32_toVector4[2] == 3 and vec4f32_toVector4[3] == 4);

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    const vec1i32_toVector1 = vec1i32.toVector(1);
    try testing.expect(vec1i32_toVector1[0] == 1);
    const vec1i32_toVector2 = vec1i32.toVector(2);
    try testing.expect(vec1i32_toVector2[0] == 1 and vec1i32_toVector2[1] == 0);
    const vec1i32_toVector3 = vec1i32.toVector(3);
    try testing.expect(vec1i32_toVector3[0] == 1 and vec1i32_toVector3[1] == 0 and vec1i32_toVector3[2] == 0);
    const vec1i32_toVector4 = vec1i32.toVector(4);
    try testing.expect(vec1i32_toVector4[0] == 1 and vec1i32_toVector4[1] == 0 and vec1i32_toVector4[2] == 0 and vec1i32_toVector4[3] == 0);

    const vec2i32_toVector1 = vec2i32.toVector(1);
    try testing.expect(vec2i32_toVector1[0] == 1);
    const vec2i32_toVector2 = vec2i32.toVector(2);
    try testing.expect(vec2i32_toVector2[0] == 1 and vec2i32_toVector2[1] == 2);
    const vec2i32_toVector3 = vec2i32.toVector(3);
    try testing.expect(vec2i32_toVector3[0] == 1 and vec2i32_toVector3[1] == 2 and vec2i32_toVector3[2] == 0);
    const vec2i32_toVector4 = vec2i32.toVector(4);
    try testing.expect(vec2i32_toVector4[0] == 1 and vec2i32_toVector4[1] == 2 and vec2i32_toVector4[2] == 0 and vec2i32_toVector4[3] == 0);

    const vec3i32_toVector1 = vec3i32.toVector(1);
    try testing.expect(vec3i32_toVector1[0] == 1);
    const vec3i32_toVector2 = vec3i32.toVector(2);
    try testing.expect(vec3i32_toVector2[0] == 1 and vec3i32_toVector2[1] == 2);
    const vec3i32_toVector3 = vec3i32.toVector(3);
    try testing.expect(vec3i32_toVector3[0] == 1 and vec3i32_toVector3[1] == 2 and vec3i32_toVector3[2] == 3);
    const vec3i32_toVector4 = vec3i32.toVector(4);
    try testing.expect(vec3i32_toVector4[0] == 1 and vec3i32_toVector4[1] == 2 and vec3i32_toVector4[2] == 3 and vec3i32_toVector4[3] == 0);

    const vec4i32_toVector1 = vec4i32.toVector(1);
    try testing.expect(vec4i32_toVector1[0] == 1);
    const vec4i32_toVector2 = vec4i32.toVector(2);
    try testing.expect(vec4i32_toVector2[0] == 1 and vec4i32_toVector2[1] == 2);
    const vec4i32_toVector3 = vec4i32.toVector(3);
    try testing.expect(vec4i32_toVector3[0] == 1 and vec4i32_toVector3[1] == 2 and vec4i32_toVector3[2] == 3);
    const vec4i32_toVector4 = vec4i32.toVector(4);
    try testing.expect(vec4i32_toVector4[0] == 1 and vec4i32_toVector4[1] == 2 and vec4i32_toVector4[2] == 3 and vec4i32_toVector4[3] == 4);

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, true);
    const vec3bool = Vec3(bool).new(true, true, true);
    const vec4bool = Vec4(bool).new(true, true, true, true);

    const vec1bool_toVector1 = vec1bool.toVector(1);
    try testing.expect(vec1bool_toVector1[0] == true);
    const vec1bool_toVector2 = vec1bool.toVector(2);
    try testing.expect(vec1bool_toVector2[0] == true and vec1bool_toVector2[1] == false);
    const vec1bool_toVector3 = vec1bool.toVector(3);
    try testing.expect(vec1bool_toVector3[0] == true and vec1bool_toVector3[1] == false and vec1bool_toVector3[2] == false);
    const vec1bool_toVector4 = vec1bool.toVector(4);
    try testing.expect(vec1bool_toVector4[0] == true and vec1bool_toVector4[1] == false and vec1bool_toVector4[2] == false and vec1bool_toVector4[3] == false);

    const vec2bool_toVector1 = vec2bool.toVector(1);
    try testing.expect(vec2bool_toVector1[0] == true);
    const vec2bool_toVector2 = vec2bool.toVector(2);
    try testing.expect(vec2bool_toVector2[0] == true and vec2bool_toVector2[1] == true);
    const vec2bool_toVector3 = vec2bool.toVector(3);
    try testing.expect(vec2bool_toVector3[0] == true and vec2bool_toVector3[1] == true and vec2bool_toVector3[2] == false);
    const vec2bool_toVector4 = vec2bool.toVector(4);
    try testing.expect(vec2bool_toVector4[0] == true and vec2bool_toVector4[1] == true and vec2bool_toVector4[2] == false and vec2bool_toVector4[3] == false);

    const vec3bool_toVector1 = vec3bool.toVector(1);
    try testing.expect(vec3bool_toVector1[0] == true);
    const vec3bool_toVector2 = vec3bool.toVector(2);
    try testing.expect(vec3bool_toVector2[0] == true and vec3bool_toVector2[1] == true);
    const vec3bool_toVector3 = vec3bool.toVector(3);
    try testing.expect(vec3bool_toVector3[0] == true and vec3bool_toVector3[1] == true and vec3bool_toVector3[2] == true);
    const vec3bool_toVector4 = vec3bool.toVector(4);
    try testing.expect(vec3bool_toVector4[0] == true and vec3bool_toVector4[1] == true and vec3bool_toVector4[2] == true and vec3bool_toVector4[3] == false);

    const vec4bool_toVector1 = vec4bool.toVector(1);
    try testing.expect(vec4bool_toVector1[0] == true);
    const vec4bool_toVector2 = vec4bool.toVector(2);
    try testing.expect(vec4bool_toVector2[0] == true and vec4bool_toVector2[1] == true);
    const vec4bool_toVector3 = vec4bool.toVector(3);
    try testing.expect(vec4bool_toVector3[0] == true and vec4bool_toVector3[1] == true and vec4bool_toVector3[2] == true);
    const vec4bool_toVector4 = vec4bool.toVector(4);
    try testing.expect(vec4bool_toVector4[0] == true and vec4bool_toVector4[1] == true and vec4bool_toVector4[2] == true and vec4bool_toVector4[3] == true);
}

test "Vec.swizzle" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    const vec1f32_swizzle1 = vec1f32.swizzle("x");
    try testing.expect(vec1f32_swizzle1.x == 1);
    const vec1f32_swizzle2 = vec1f32.swizzle("xx");
    try testing.expect(vec1f32_swizzle2.x == 1 and vec1f32_swizzle2.y == 1);
    const vec1f32_swizzle3 = vec1f32.swizzle("xx0");
    try testing.expect(vec1f32_swizzle3.x == 1 and vec1f32_swizzle3.y == 1 and vec1f32_swizzle3.z == 0);
    const vec1f32_swizzle4 = vec1f32.swizzle("xx01");
    try testing.expect(vec1f32_swizzle4.x == 1 and vec1f32_swizzle4.y == 1 and vec1f32_swizzle4.z == 0 and vec1f32_swizzle4.w == 1);

    const vec2f32_swizzle1 = vec2f32.swizzle("x");
    try testing.expect(vec2f32_swizzle1.x == 1);
    const vec2f32_swizzle2 = vec2f32.swizzle("xy");
    try testing.expect(vec2f32_swizzle2.x == 1 and vec2f32_swizzle2.y == 2);
    const vec2f32_swizzle3 = vec2f32.swizzle("xy0");
    try testing.expect(vec2f32_swizzle3.x == 1 and vec2f32_swizzle3.y == 2 and vec2f32_swizzle3.z == 0);
    const vec2f32_swizzle4 = vec2f32.swizzle("xy01");
    try testing.expect(vec2f32_swizzle4.x == 1 and vec2f32_swizzle4.y == 2 and vec2f32_swizzle4.z == 0 and vec2f32_swizzle4.w == 1);

    const vec3f32_swizzle1 = vec3f32.swizzle("z");
    try testing.expect(vec3f32_swizzle1.x == 3);
    const vec3f32_swizzle2 = vec3f32.swizzle("x0");
    try testing.expect(vec3f32_swizzle2.x == 1 and vec3f32_swizzle2.y == 0);
    const vec3f32_swizzle3 = vec3f32.swizzle("x1z");
    try testing.expect(vec3f32_swizzle3.x == 1 and vec3f32_swizzle3.y == 1 and vec3f32_swizzle3.z == 3);
    const vec3f32_swizzle4 = vec3f32.swizzle("1yz0");
    try testing.expect(vec3f32_swizzle4.x == 1 and vec3f32_swizzle4.y == 2 and vec3f32_swizzle4.z == 3 and vec3f32_swizzle4.w == 0);

    const vec4f32_swizzle1 = vec4f32.swizzle("w");
    try testing.expect(vec4f32_swizzle1.x == 4);
    const vec4f32_swizzle2 = vec4f32.swizzle("0y");
    try testing.expect(vec4f32_swizzle2.x == 0 and vec4f32_swizzle2.y == 2);
    const vec4f32_swizzle3 = vec4f32.swizzle("zy1");
    try testing.expect(vec4f32_swizzle3.x == 3 and vec4f32_swizzle3.y == 2 and vec4f32_swizzle3.z == 1);
    const vec4f32_swizzle4 = vec4f32.swizzle("01y0");
    try testing.expect(vec4f32_swizzle4.x == 0 and vec4f32_swizzle4.y == 1 and vec4f32_swizzle4.z == 2 and vec4f32_swizzle4.w == 0);

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    const vec1i32_swizzle1 = vec1i32.swizzle("x");
    try testing.expect(vec1i32_swizzle1.x == 1);
    const vec1i32_swizzle2 = vec1i32.swizzle("xx");
    try testing.expect(vec1i32_swizzle2.x == 1 and vec1i32_swizzle2.y == 1);
    const vec1i32_swizzle3 = vec1i32.swizzle("xx0");
    try testing.expect(vec1i32_swizzle3.x == 1 and vec1i32_swizzle3.y == 1 and vec1i32_swizzle3.z == 0);
    const vec1i32_swizzle4 = vec1i32.swizzle("xx01");
    try testing.expect(vec1i32_swizzle4.x == 1 and vec1i32_swizzle4.y == 1 and vec1i32_swizzle4.z == 0 and vec1i32_swizzle4.w == 1);

    const vec2i32_swizzle1 = vec2i32.swizzle("x");
    try testing.expect(vec2i32_swizzle1.x == 1);
    const vec2i32_swizzle2 = vec2i32.swizzle("xy");
    try testing.expect(vec2i32_swizzle2.x == 1 and vec2i32_swizzle2.y == 2);
    const vec2i32_swizzle3 = vec2i32.swizzle("xy0");
    try testing.expect(vec2i32_swizzle3.x == 1 and vec2i32_swizzle3.y == 2 and vec2i32_swizzle3.z == 0);
    const vec2i32_swizzle4 = vec2i32.swizzle("xy01");
    try testing.expect(vec2i32_swizzle4.x == 1 and vec2i32_swizzle4.y == 2 and vec2i32_swizzle4.z == 0 and vec2i32_swizzle4.w == 1);

    const vec3i32_swizzle1 = vec3i32.swizzle("z");
    try testing.expect(vec3i32_swizzle1.x == 3);
    const vec3i32_swizzle2 = vec3i32.swizzle("x0");
    try testing.expect(vec3i32_swizzle2.x == 1 and vec3i32_swizzle2.y == 0);
    const vec3i32_swizzle3 = vec3i32.swizzle("x1z");
    try testing.expect(vec3i32_swizzle3.x == 1 and vec3i32_swizzle3.y == 1 and vec3i32_swizzle3.z == 3);
    const vec3i32_swizzle4 = vec3i32.swizzle("1yz0");
    try testing.expect(vec3i32_swizzle4.x == 1 and vec3i32_swizzle4.y == 2 and vec3i32_swizzle4.z == 3 and vec3i32_swizzle4.w == 0);

    const vec4i32_swizzle1 = vec4i32.swizzle("w");
    try testing.expect(vec4i32_swizzle1.x == 4);
    const vec4i32_swizzle2 = vec4i32.swizzle("0y");
    try testing.expect(vec4i32_swizzle2.x == 0 and vec4i32_swizzle2.y == 2);
    const vec4i32_swizzle3 = vec4i32.swizzle("zy1");
    try testing.expect(vec4i32_swizzle3.x == 3 and vec4i32_swizzle3.y == 2 and vec4i32_swizzle3.z == 1);
    const vec4i32_swizzle4 = vec4i32.swizzle("01y0");
    try testing.expect(vec4i32_swizzle4.x == 0 and vec4i32_swizzle4.y == 1 and vec4i32_swizzle4.z == 2 and vec4i32_swizzle4.w == 0);

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, false);
    const vec3bool = Vec3(bool).new(true, false, true);
    const vec4bool = Vec4(bool).new(true, false, true, false);

    const vec1bool_swizzle1 = vec1bool.swizzle("F");
    try testing.expect(vec1bool_swizzle1.x == false);
    const vec1bool_swizzle2 = vec1bool.swizzle("xT");
    try testing.expect(vec1bool_swizzle2.x == true and vec1bool_swizzle2.y == true);
    const vec1bool_swizzle3 = vec1bool.swizzle("FxF");
    try testing.expect(vec1bool_swizzle3.x == false and vec1bool_swizzle3.y == true and vec1bool_swizzle3.z == false);
    const vec1bool_swizzle4 = vec1bool.swizzle("TTxF");
    try testing.expect(vec1bool_swizzle4.x == true and vec1bool_swizzle4.y == true and vec1bool_swizzle4.z == true and vec1bool_swizzle4.w == false);

    const vec2bool_swizzle1 = vec2bool.swizzle("y");
    try testing.expect(vec2bool_swizzle1.x == false);
    const vec2bool_swizzle2 = vec2bool.swizzle("yT");
    try testing.expect(vec2bool_swizzle2.x == false and vec2bool_swizzle2.y == true);
    const vec2bool_swizzle3 = vec2bool.swizzle("yxT");
    try testing.expect(vec2bool_swizzle3.x == false and vec2bool_swizzle3.y == true and vec2bool_swizzle3.z == true);
    const vec2bool_swizzle4 = vec2bool.swizzle("FyxT");
    try testing.expect(vec2bool_swizzle4.x == false and vec2bool_swizzle4.y == false and vec2bool_swizzle4.z == true and vec2bool_swizzle4.w == true);

    const vec3bool_swizzle1 = vec3bool.swizzle("z");
    try testing.expect(vec3bool_swizzle1.x == true);
    const vec3bool_swizzle2 = vec3bool.swizzle("xF");
    try testing.expect(vec3bool_swizzle2.x == true and vec3bool_swizzle2.y == false);
    const vec3bool_swizzle3 = vec3bool.swizzle("zTF");
    try testing.expect(vec3bool_swizzle3.x == true and vec3bool_swizzle3.y == true and vec3bool_swizzle3.z == false);
    const vec3bool_swizzle4 = vec3bool.swizzle("xxxF");
    try testing.expect(vec3bool_swizzle4.x == true and vec3bool_swizzle4.y == true and vec3bool_swizzle4.z == true and vec3bool_swizzle4.w == false);

    const vec4bool_swizzle1 = vec4bool.swizzle("w");
    try testing.expect(vec4bool_swizzle1.x == false);
    const vec4bool_swizzle2 = vec4bool.swizzle("wF");
    try testing.expect(vec4bool_swizzle2.x == false and vec4bool_swizzle2.y == false);
    const vec4bool_swizzle3 = vec4bool.swizzle("wTF");
    try testing.expect(vec4bool_swizzle3.x == false and vec4bool_swizzle3.y == true and vec4bool_swizzle3.z == false);
    const vec4bool_swizzle4 = vec4bool.swizzle("FTwx");
    try testing.expect(vec4bool_swizzle4.x == false and vec4bool_swizzle4.y == true and vec4bool_swizzle4.z == false and vec4bool_swizzle4.w == true);
}

test "Vec.getAt" {
    const vec1f32 = Vec1(f32).new(1);
    try testing.expect(vec1f32.getAt(0) == 1);

    const vec2f32 = Vec2(f32).new(1, 2);
    try testing.expect(vec2f32.getAt(0) == 1 and vec2f32.getAt(1) == 2);

    const vec3f32 = Vec3(f32).new(1, 2, 3);
    try testing.expect(vec3f32.getAt(0) == 1 and vec3f32.getAt(1) == 2 and vec3f32.getAt(2) == 3);

    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);
    try testing.expect(vec4f32.getAt(0) == 1 and vec4f32.getAt(1) == 2 and vec4f32.getAt(2) == 3 and vec4f32.getAt(3) == 4);

    const vec1i32 = Vec1(i32).new(1);
    try testing.expect(vec1i32.getAt(0) == 1);

    const vec2i32 = Vec2(i32).new(1, 2);
    try testing.expect(vec2i32.getAt(0) == 1 and vec2i32.getAt(1) == 2);

    const vec3i32 = Vec3(i32).new(1, 2, 3);
    try testing.expect(vec3i32.getAt(0) == 1 and vec3i32.getAt(1) == 2 and vec3i32.getAt(2) == 3);

    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);
    try testing.expect(vec4i32.getAt(0) == 1 and vec4i32.getAt(1) == 2 and vec4i32.getAt(2) == 3 and vec4i32.getAt(3) == 4);

    const vec1bool = Vec1(bool).new(true);
    try testing.expect(vec1bool.getAt(0) == true);

    const vec2bool = Vec2(bool).new(true, false);
    try testing.expect(vec2bool.getAt(0) == true and vec2bool.getAt(1) == false);

    const vec3bool = Vec3(bool).new(true, false, true);
    try testing.expect(vec3bool.getAt(0) == true and vec3bool.getAt(1) == false and vec3bool.getAt(2) == true);

    const vec4bool = Vec4(bool).new(true, false, true, false);
    try testing.expect(vec4bool.getAt(0) == true and vec4bool.getAt(1) == false and vec4bool.getAt(2) == true and vec4bool.getAt(3) == false);
}

test "Vec.setAt" {
    var vec1f32 = Vec1(f32).as(0);
    vec1f32.setAt(0, 1);
    try testing.expect(vec1f32.x == 1);

    var vec2f32 = Vec2(f32).as(0);
    vec2f32.setAt(0, 1);
    vec2f32.setAt(1, 2);
    try testing.expect(vec2f32.x == 1 and vec2f32.y == 2);

    var vec3f32 = Vec3(f32).as(0);
    vec3f32.setAt(0, 1);
    vec3f32.setAt(1, 2);
    vec3f32.setAt(2, 3);
    try testing.expect(vec3f32.x == 1 and vec3f32.y == 2 and vec3f32.z == 3);

    var vec4f32 = Vec4(f32).as(0);
    vec4f32.setAt(0, 1);
    vec4f32.setAt(1, 2);
    vec4f32.setAt(2, 3);
    vec4f32.setAt(3, 4);
    try testing.expect(vec4f32.x == 1 and vec4f32.y == 2 and vec4f32.z == 3 and vec4f32.w == 4);

    var vec1i32 = Vec1(i32).as(0);
    vec1i32.setAt(0, 1);
    try testing.expect(vec1i32.x == 1);

    var vec2i32 = Vec2(i32).as(0);
    vec2i32.setAt(0, 1);
    vec2i32.setAt(1, 2);
    try testing.expect(vec2i32.x == 1 and vec2i32.y == 2);

    var vec3i32 = Vec3(i32).as(0);
    vec3i32.setAt(0, 1);
    vec3i32.setAt(1, 2);
    vec3i32.setAt(2, 3);
    try testing.expect(vec3i32.x == 1 and vec3i32.y == 2 and vec3i32.z == 3);

    var vec4i32 = Vec4(i32).as(0);
    vec4i32.setAt(0, 1);
    vec4i32.setAt(1, 2);
    vec4i32.setAt(2, 3);
    vec4i32.setAt(3, 4);
    try testing.expect(vec4i32.x == 1 and vec4i32.y == 2 and vec4i32.z == 3 and vec4i32.w == 4);

    var vec1bool = Vec1(bool).as(false);
    vec1bool.setAt(0, true);
    try testing.expect(vec1bool.x == true);

    var vec2bool = Vec2(bool).as(false);
    vec2bool.setAt(0, true);
    vec2bool.setAt(1, true);
    try testing.expect(vec2bool.x == true and vec2bool.y == true);

    var vec3bool = Vec3(bool).as(false);
    vec3bool.setAt(0, true);
    vec3bool.setAt(1, true);
    vec3bool.setAt(2, true);
    try testing.expect(vec3bool.x == true and vec3bool.y == true and vec3bool.z == true);

    var vec4bool = Vec4(bool).as(false);
    vec4bool.setAt(0, true);
    vec4bool.setAt(1, true);
    vec4bool.setAt(2, true);
    vec4bool.setAt(3, true);
    try testing.expect(vec4bool.x == true and vec4bool.y == true and vec4bool.z == true and vec4bool.w == true);
}

test "Vec.equal" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    const vec1f32_equal1 = vec1f32.equal(Vec1(f32).new(1));
    try testing.expect(vec1f32_equal1.x == true);
    const vec1f32_equal2 = vec1f32.equal(Vec1(f32).new(0));
    try testing.expect(vec1f32_equal2.x == false);

    const vec2f32_equal1 = vec2f32.equal(Vec2(f32).new(1, 2));
    try testing.expect(vec2f32_equal1.x == true and vec2f32_equal1.y == true);
    const vec2f32_equal2 = vec2f32.equal(Vec2(f32).new(0, 2));
    try testing.expect(vec2f32_equal2.x == false and vec2f32_equal2.y == true);

    const vec3f32_equal1 = vec3f32.equal(Vec3(f32).new(1, 2, 3));
    try testing.expect(vec3f32_equal1.x == true and vec3f32_equal1.y == true and vec3f32_equal1.z == true);
    const vec3f32_equal2 = vec3f32.equal(Vec3(f32).new(0, 2, 1));
    try testing.expect(vec3f32_equal2.x == false and vec3f32_equal2.y == true and vec3f32_equal2.z == false);

    const vec4f32_equal1 = vec4f32.equal(Vec4(f32).new(1, 2, 3, 4));
    try testing.expect(vec4f32_equal1.x == true and vec4f32_equal1.y == true and vec4f32_equal1.z == true and vec4f32_equal1.w == true);
    const vec4f32_equal2 = vec4f32.equal(Vec4(f32).new(0, 2, 1, 4));
    try testing.expect(vec4f32_equal2.x == false and vec4f32_equal2.y == true and vec4f32_equal2.z == false and vec4f32_equal2.w == true);

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    const vec1i32_equal1 = vec1i32.equal(Vec1(i32).new(1));
    try testing.expect(vec1i32_equal1.x == true);
    const vec1i32_equal2 = vec1i32.equal(Vec1(i32).new(0));
    try testing.expect(vec1i32_equal2.x == false);

    const vec2i32_equal1 = vec2i32.equal(Vec2(i32).new(1, 2));
    try testing.expect(vec2i32_equal1.x == true and vec2i32_equal1.y == true);
    const vec2i32_equal2 = vec2i32.equal(Vec2(i32).new(0, 2));
    try testing.expect(vec2i32_equal2.x == false and vec2i32_equal2.y == true);

    const vec3i32_equal1 = vec3i32.equal(Vec3(i32).new(1, 2, 3));
    try testing.expect(vec3i32_equal1.x == true and vec3i32_equal1.y == true and vec3i32_equal1.z == true);
    const vec3i32_equal2 = vec3i32.equal(Vec3(i32).new(0, 2, 1));
    try testing.expect(vec3i32_equal2.x == false and vec3i32_equal2.y == true and vec3i32_equal2.z == false);

    const vec4i32_equal1 = vec4i32.equal(Vec4(i32).new(1, 2, 3, 4));
    try testing.expect(vec4i32_equal1.x == true and vec4i32_equal1.y == true and vec4i32_equal1.z == true and vec4i32_equal1.w == true);
    const vec4i32_equal2 = vec4i32.equal(Vec4(i32).new(0, 2, 1, 4));
    try testing.expect(vec4i32_equal2.x == false and vec4i32_equal2.y == true and vec4i32_equal2.z == false and vec4i32_equal2.w == true);

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, false);
    const vec3bool = Vec3(bool).new(true, false, true);
    const vec4bool = Vec4(bool).new(true, false, true, false);

    const vec1bool_equal1 = vec1bool.equal(Vec1(bool).new(true));
    try testing.expect(vec1bool_equal1.x == true);
    const vec1bool_equal2 = vec1bool.equal(Vec1(bool).new(false));
    try testing.expect(vec1bool_equal2.x == false);

    const vec2bool_equal1 = vec2bool.equal(Vec2(bool).new(true, false));
    try testing.expect(vec2bool_equal1.x == true and vec2bool_equal1.y == true);
    const vec2bool_equal2 = vec2bool.equal(Vec2(bool).new(false, false));
    try testing.expect(vec2bool_equal2.x == false and vec2bool_equal2.y == true);

    const vec3bool_equal1 = vec3bool.equal(Vec3(bool).new(true, false, true));
    try testing.expect(vec3bool_equal1.x == true and vec3bool_equal1.y == true and vec3bool_equal1.z == true);
    const vec3bool_equal2 = vec3bool.equal(Vec3(bool).new(false, false, false));
    try testing.expect(vec3bool_equal2.x == false and vec3bool_equal2.y == true and vec3bool_equal2.z == false);

    const vec4bool_equal1 = vec4bool.equal(Vec4(bool).new(true, false, true, false));
    try testing.expect(vec4bool_equal1.x == true and vec4bool_equal1.y == true and vec4bool_equal1.z == true and vec4bool_equal1.w == true);
    const vec4bool_equal2 = vec4bool.equal(Vec4(bool).new(false, false, false, false));
    try testing.expect(vec4bool_equal2.x == false and vec4bool_equal2.y == true and vec4bool_equal2.z == false and vec4bool_equal2.w == true);
}

test "Vec.notEqual" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    const vec1f32_notEqual1 = vec1f32.notEqual(Vec1(f32).new(1));
    try testing.expect(vec1f32_notEqual1.x == false);
    const vec1f32_notEqual2 = vec1f32.notEqual(Vec1(f32).new(0));
    try testing.expect(vec1f32_notEqual2.x == true);

    const vec2f32_notEqual1 = vec2f32.notEqual(Vec2(f32).new(1, 2));
    try testing.expect(vec2f32_notEqual1.x == false and vec2f32_notEqual1.y == false);
    const vec2f32_notEqual2 = vec2f32.notEqual(Vec2(f32).new(0, 2));
    try testing.expect(vec2f32_notEqual2.x == true and vec2f32_notEqual2.y == false);

    const vec3f32_notEqual1 = vec3f32.notEqual(Vec3(f32).new(1, 2, 3));
    try testing.expect(vec3f32_notEqual1.x == false and vec3f32_notEqual1.y == false and vec3f32_notEqual1.z == false);
    const vec3f32_notEqual2 = vec3f32.notEqual(Vec3(f32).new(0, 2, 1));
    try testing.expect(vec3f32_notEqual2.x == true and vec3f32_notEqual2.y == false and vec3f32_notEqual2.z == true);

    const vec4f32_notEqual1 = vec4f32.notEqual(Vec4(f32).new(1, 2, 3, 4));
    try testing.expect(vec4f32_notEqual1.x == false and vec4f32_notEqual1.y == false and vec4f32_notEqual1.z == false and vec4f32_notEqual1.w == false);
    const vec4f32_notEqual2 = vec4f32.notEqual(Vec4(f32).new(0, 2, 1, 4));
    try testing.expect(vec4f32_notEqual2.x == true and vec4f32_notEqual2.y == false and vec4f32_notEqual2.z == true and vec4f32_notEqual2.w == false);

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    const vec1i32_notEqual1 = vec1i32.notEqual(Vec1(i32).new(1));
    try testing.expect(vec1i32_notEqual1.x == false);
    const vec1i32_notEqual2 = vec1i32.notEqual(Vec1(i32).new(0));
    try testing.expect(vec1i32_notEqual2.x == true);

    const vec2i32_notEqual1 = vec2i32.notEqual(Vec2(i32).new(1, 2));
    try testing.expect(vec2i32_notEqual1.x == false and vec2i32_notEqual1.y == false);
    const vec2i32_notEqual2 = vec2i32.notEqual(Vec2(i32).new(0, 2));
    try testing.expect(vec2i32_notEqual2.x == true and vec2i32_notEqual2.y == false);

    const vec3i32_notEqual1 = vec3i32.notEqual(Vec3(i32).new(1, 2, 3));
    try testing.expect(vec3i32_notEqual1.x == false and vec3i32_notEqual1.y == false and vec3i32_notEqual1.z == false);
    const vec3i32_notEqual2 = vec3i32.notEqual(Vec3(i32).new(0, 2, 1));
    try testing.expect(vec3i32_notEqual2.x == true and vec3i32_notEqual2.y == false and vec3i32_notEqual2.z == true);

    const vec4i32_notEqual1 = vec4i32.notEqual(Vec4(i32).new(1, 2, 3, 4));
    try testing.expect(vec4i32_notEqual1.x == false and vec4i32_notEqual1.y == false and vec4i32_notEqual1.z == false and vec4i32_notEqual1.w == false);
    const vec4i32_notEqual2 = vec4i32.notEqual(Vec4(i32).new(0, 2, 1, 4));
    try testing.expect(vec4i32_notEqual2.x == true and vec4i32_notEqual2.y == false and vec4i32_notEqual2.z == true and vec4i32_notEqual2.w == false);

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, false);
    const vec3bool = Vec3(bool).new(true, false, true);
    const vec4bool = Vec4(bool).new(true, false, true, false);

    const vec1bool_notEqual1 = vec1bool.notEqual(Vec1(bool).new(true));
    try testing.expect(vec1bool_notEqual1.x == false);
    const vec1bool_notEqual2 = vec1bool.notEqual(Vec1(bool).new(false));
    try testing.expect(vec1bool_notEqual2.x == true);

    const vec2bool_notEqual1 = vec2bool.notEqual(Vec2(bool).new(true, false));
    try testing.expect(vec2bool_notEqual1.x == false and vec2bool_notEqual1.y == false);
    const vec2bool_notEqual2 = vec2bool.notEqual(Vec2(bool).new(false, false));
    try testing.expect(vec2bool_notEqual2.x == true and vec2bool_notEqual2.y == false);

    const vec3bool_notEqual1 = vec3bool.notEqual(Vec3(bool).new(true, false, true));
    try testing.expect(vec3bool_notEqual1.x == false and vec3bool_notEqual1.y == false and vec3bool_notEqual1.z == false);
    const vec3bool_notEqual2 = vec3bool.notEqual(Vec3(bool).new(false, false, false));
    try testing.expect(vec3bool_notEqual2.x == true and vec3bool_notEqual2.y == false and vec3bool_notEqual2.z == true);

    const vec4bool_notEqual1 = vec4bool.notEqual(Vec4(bool).new(true, false, true, false));
    try testing.expect(vec4bool_notEqual1.x == false and vec4bool_notEqual1.y == false and vec4bool_notEqual1.z == false and vec4bool_notEqual1.w == false);
    const vec4bool_notEqual2 = vec4bool.notEqual(Vec4(bool).new(false, false, false, false));
    try testing.expect(vec4bool_notEqual2.x == true and vec4bool_notEqual2.y == false and vec4bool_notEqual2.z == true and vec4bool_notEqual2.w == false);
}

test "Vec.eql" {
    const vec1f32 = Vec1(f32).new(1);
    const vec2f32 = Vec2(f32).new(1, 2);
    const vec3f32 = Vec3(f32).new(1, 2, 3);
    const vec4f32 = Vec4(f32).new(1, 2, 3, 4);

    try testing.expect(vec1f32.eql(Vec1(f32).new(1)));
    try testing.expect(!vec1f32.eql(Vec1(f32).new(2)));
    try testing.expect(vec2f32.eql(Vec2(f32).new(1, 2)));
    try testing.expect(!vec2f32.eql(Vec2(f32).new(2, 2)));
    try testing.expect(vec3f32.eql(Vec3(f32).new(1, 2, 3)));
    try testing.expect(!vec3f32.eql(Vec3(f32).new(2, 2, 1)));
    try testing.expect(vec4f32.eql(Vec4(f32).new(1, 2, 3, 4)));
    try testing.expect(!vec4f32.eql(Vec4(f32).new(2, 2, 1, 4)));

    const vec1i32 = Vec1(i32).new(1);
    const vec2i32 = Vec2(i32).new(1, 2);
    const vec3i32 = Vec3(i32).new(1, 2, 3);
    const vec4i32 = Vec4(i32).new(1, 2, 3, 4);

    try testing.expect(vec1i32.eql(Vec1(i32).new(1)));
    try testing.expect(!vec1i32.eql(Vec1(i32).new(2)));
    try testing.expect(vec2i32.eql(Vec2(i32).new(1, 2)));
    try testing.expect(!vec2i32.eql(Vec2(i32).new(2, 2)));
    try testing.expect(vec3i32.eql(Vec3(i32).new(1, 2, 3)));
    try testing.expect(!vec3i32.eql(Vec3(i32).new(2, 2, 1)));
    try testing.expect(vec4i32.eql(Vec4(i32).new(1, 2, 3, 4)));
    try testing.expect(!vec4i32.eql(Vec4(i32).new(2, 2, 1, 4)));

    const vec1bool = Vec1(bool).new(true);
    const vec2bool = Vec2(bool).new(true, false);
    const vec3bool = Vec3(bool).new(true, false, true);
    const vec4bool = Vec4(bool).new(true, false, true, false);

    try testing.expect(vec1bool.eql(Vec1(bool).new(true)));
    try testing.expect(!vec1bool.eql(Vec1(bool).new(false)));
    try testing.expect(vec2bool.eql(Vec2(bool).new(true, false)));
    try testing.expect(!vec2bool.eql(Vec2(bool).new(false, false)));
    try testing.expect(vec3bool.eql(Vec3(bool).new(true, false, true)));
    try testing.expect(!vec3bool.eql(Vec3(bool).new(false, false, true)));
    try testing.expect(vec4bool.eql(Vec4(bool).new(true, false, true, false)));
    try testing.expect(!vec4bool.eql(Vec4(bool).new(false, true, false, false)));
}

test "Vec.add" {
    const vec1 = Vec1(f32).new(1).add(Vec1(f32).as(1));
    try testing.expect(vec1.x == 2);

    const vec2 = Vec2(f32).new(1, 2).add(Vec2(f32).as(1));
    try testing.expect(vec2.x == 2 and vec2.y == 3);

    const vec3 = Vec3(f32).new(1, 2, 3).add(Vec3(f32).as(1));
    try testing.expect(vec3.x == 2 and vec3.y == 3 and vec3.z == 4);

    const vec4 = Vec4(f32).new(1, 2, 3, 4).add(Vec4(f32).as(1));
    try testing.expect(vec4.x == 2 and vec4.y == 3 and vec4.z == 4 and vec4.w == 5);
}

test "Vec.sub" {
    const vec1 = Vec1(f32).new(1).sub(Vec1(f32).as(1));
    try testing.expect(vec1.x == 0);

    const vec2 = Vec2(f32).new(1, 2).sub(Vec2(f32).as(1));
    try testing.expect(vec2.x == 0 and vec2.y == 1);

    const vec3 = Vec3(f32).new(1, 2, 3).sub(Vec3(f32).as(1));
    try testing.expect(vec3.x == 0 and vec3.y == 1 and vec3.z == 2);

    const vec4 = Vec4(f32).new(1, 2, 3, 4).sub(Vec4(f32).as(1));
    try testing.expect(vec4.x == 0 and vec4.y == 1 and vec4.z == 2 and vec4.w == 3);
}

test "Vec.mul" {
    const vec1 = Vec1(f32).new(1.5).mul(Vec1(f32).as(2));
    try testing.expect(vec1.x == 3);

    const vec2 = Vec2(f32).new(1.5, 2.5).mul(Vec2(f32).as(2));
    try testing.expect(vec2.x == 3 and vec2.y == 5);

    const vec3 = Vec3(f32).new(1.5, 2.5, 3.5).mul(Vec3(f32).as(2));
    try testing.expect(vec3.x == 3 and vec3.y == 5 and vec3.z == 7);

    const vec4 = Vec4(f32).new(1.5, 2.5, 3.5, 4.5).mul(Vec4(f32).as(2));
    try testing.expect(vec4.x == 3 and vec4.y == 5 and vec4.z == 7 and vec4.w == 9);
}

test "Vec.div" {
    const vec1 = Vec1(f32).new(3).div(Vec1(f32).as(2));
    try testing.expect(vec1.x == 1.5);

    const vec2 = Vec2(f32).new(3, 5).div(Vec2(f32).as(2));
    try testing.expect(vec2.x == 1.5 and vec2.y == 2.5);

    const vec3 = Vec3(f32).new(3, 5, 7).div(Vec3(f32).as(2));
    try testing.expect(vec3.x == 1.5 and vec3.y == 2.5 and vec3.z == 3.5);

    const vec4 = Vec4(f32).new(3, 5, 7, 9).div(Vec4(f32).as(2));
    try testing.expect(vec4.x == 1.5 and vec4.y == 2.5 and vec4.z == 3.5 and vec4.w == 4.5);
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
