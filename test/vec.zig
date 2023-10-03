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

test "Vec.new(...)" {
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

test "Vec.as(...)" {
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

test "Vec.fromVec(...)" {
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

test "Vec.fromVector(...)" {
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

test "Vec.toVec(...)" {
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

test "Vec.toVector(...)" {
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

test "Vec.swizzle(...)" {
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

test "Vec.getAt(...)" {
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

test "Vec.setAt(...)" {
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

test "Vec.equal(...)" {
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

test "Vec.notEqual(...)" {
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

test "Vec.eql(...)" {
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

test "Vec.any(...)" {
    try testing.expect(Vec1(bool).as(true).any());
    try testing.expect(Vec2(bool).as(true).any());
    try testing.expect(Vec3(bool).as(true).any());
    try testing.expect(Vec4(bool).as(true).any());

    try testing.expect(!Vec1(bool).as(false).any());
    try testing.expect(!Vec2(bool).as(false).any());
    try testing.expect(!Vec3(bool).as(false).any());
    try testing.expect(!Vec4(bool).as(false).any());

    try testing.expect(Vec1(bool).new(true).any());
    try testing.expect(Vec2(bool).new(true, false).any());
    try testing.expect(Vec3(bool).new(true, false, true).any());
    try testing.expect(Vec4(bool).new(true, false, true, false).any());
}

test "Vec.all(...)" {
    try testing.expect(Vec1(bool).as(true).all());
    try testing.expect(Vec2(bool).as(true).all());
    try testing.expect(Vec3(bool).as(true).all());
    try testing.expect(Vec4(bool).as(true).all());

    try testing.expect(!Vec1(bool).as(false).all());
    try testing.expect(!Vec2(bool).as(false).all());
    try testing.expect(!Vec3(bool).as(false).all());
    try testing.expect(!Vec4(bool).as(false).all());

    try testing.expect(Vec1(bool).new(true).all());
    try testing.expect(!Vec2(bool).new(true, false).all());
    try testing.expect(!Vec3(bool).new(true, false, true).all());
    try testing.expect(!Vec4(bool).new(true, false, true, false).all());
}

test "Vec.not(...)" {
    try testing.expect(!Vec1(bool).as(true).not().all());
    try testing.expect(!Vec2(bool).as(true).not().all());
    try testing.expect(!Vec3(bool).as(true).not().all());
    try testing.expect(!Vec4(bool).as(true).not().all());

    try testing.expect(Vec1(bool).as(false).not().all());
    try testing.expect(Vec2(bool).as(false).not().all());
    try testing.expect(Vec3(bool).as(false).not().all());
    try testing.expect(Vec4(bool).as(false).not().all());

    try testing.expect(!Vec1(bool).new(true).not().all());
    try testing.expect(!Vec2(bool).new(true, false).not().all());
    try testing.expect(!Vec3(bool).new(true, false, true).not().all());
    try testing.expect(!Vec4(bool).new(true, false, true, false).not().all());
}

test "Vec.unit_x" {
    try testing.expect(Vec1(f32).unit_x.x == 1);
    try testing.expect(Vec2(f32).unit_x.x == 1 and Vec2(f32).unit_x.y == 0);
    try testing.expect(Vec3(f32).unit_x.x == 1 and Vec3(f32).unit_x.y == 0 and Vec3(f32).unit_x.z == 0);
    try testing.expect(Vec4(f32).unit_x.x == 1 and Vec4(f32).unit_x.y == 0 and Vec4(f32).unit_x.z == 0 and Vec4(f32).unit_x.w == 0);

    try testing.expect(Vec1(i32).unit_x.x == 1);
    try testing.expect(Vec2(i32).unit_x.x == 1 and Vec2(i32).unit_x.y == 0);
    try testing.expect(Vec3(i32).unit_x.x == 1 and Vec3(i32).unit_x.y == 0 and Vec3(i32).unit_x.z == 0);
    try testing.expect(Vec4(i32).unit_x.x == 1 and Vec4(i32).unit_x.y == 0 and Vec4(i32).unit_x.z == 0 and Vec4(i32).unit_x.w == 0);
}

test "Vec.unit_y" {
    try testing.expect(Vec2(f32).unit_y.x == 0 and Vec2(f32).unit_y.y == 1);
    try testing.expect(Vec3(f32).unit_y.x == 0 and Vec3(f32).unit_y.y == 1 and Vec3(f32).unit_y.z == 0);
    try testing.expect(Vec4(f32).unit_y.x == 0 and Vec4(f32).unit_y.y == 1 and Vec4(f32).unit_y.z == 0 and Vec4(f32).unit_y.w == 0);

    try testing.expect(Vec2(i32).unit_y.x == 0 and Vec2(i32).unit_y.y == 1);
    try testing.expect(Vec3(i32).unit_y.x == 0 and Vec3(i32).unit_y.y == 1 and Vec3(i32).unit_y.z == 0);
    try testing.expect(Vec4(i32).unit_y.x == 0 and Vec4(i32).unit_y.y == 1 and Vec4(i32).unit_y.z == 0 and Vec4(i32).unit_y.w == 0);
}

test "Vec.unit_z" {
    try testing.expect(Vec3(f32).unit_z.x == 0 and Vec3(f32).unit_z.y == 0 and Vec3(f32).unit_z.z == 1);
    try testing.expect(Vec4(f32).unit_z.x == 0 and Vec4(f32).unit_z.y == 0 and Vec4(f32).unit_z.z == 1 and Vec4(f32).unit_z.w == 0);

    try testing.expect(Vec3(i32).unit_z.x == 0 and Vec3(i32).unit_z.y == 0 and Vec3(i32).unit_z.z == 1);
    try testing.expect(Vec4(i32).unit_z.x == 0 and Vec4(i32).unit_z.y == 0 and Vec4(i32).unit_z.z == 1 and Vec4(i32).unit_z.w == 0);
}

test "Vec.unit_w" {
    try testing.expect(Vec4(f32).unit_w.x == 0 and Vec4(f32).unit_w.y == 0 and Vec4(f32).unit_w.z == 0 and Vec4(f32).unit_w.w == 1);

    try testing.expect(Vec4(i32).unit_w.x == 0 and Vec4(i32).unit_w.y == 0 and Vec4(i32).unit_w.z == 0 and Vec4(i32).unit_w.w == 1);
}

test "Vec.origin" {
    try testing.expect(Vec1(f32).origin.x == 0);
    try testing.expect(Vec2(f32).origin.x == 0 and Vec2(f32).origin.y == 0);
    try testing.expect(Vec3(f32).origin.x == 0 and Vec3(f32).origin.y == 0 and Vec3(f32).origin.z == 0);
    try testing.expect(Vec4(f32).origin.x == 0 and Vec4(f32).origin.y == 0 and Vec4(f32).origin.z == 0 and Vec4(f32).origin.w == 0);

    try testing.expect(Vec1(i32).origin.x == 0);
    try testing.expect(Vec2(i32).origin.x == 0 and Vec2(i32).origin.y == 0);
    try testing.expect(Vec3(i32).origin.x == 0 and Vec3(i32).origin.y == 0 and Vec3(i32).origin.z == 0);
    try testing.expect(Vec4(i32).origin.x == 0 and Vec4(i32).origin.y == 0 and Vec4(i32).origin.z == 0 and Vec4(i32).origin.w == 0);

    try testing.expect(Vec1(u32).origin.x == 0);
    try testing.expect(Vec2(u32).origin.x == 0 and Vec2(u32).origin.y == 0);
    try testing.expect(Vec3(u32).origin.x == 0 and Vec3(u32).origin.y == 0 and Vec3(u32).origin.z == 0);
    try testing.expect(Vec4(u32).origin.x == 0 and Vec4(u32).origin.y == 0 and Vec4(u32).origin.z == 0 and Vec4(u32).origin.w == 0);
}

test "Vec.add(...)" {
    const vec1f32 = Vec1(f32).new(1).add(Vec1(f32).as(1));
    try testing.expect(vec1f32.x == 2);

    const vec2f32 = Vec2(f32).new(1, 2).add(Vec2(f32).as(1));
    try testing.expect(vec2f32.x == 2 and vec2f32.y == 3);

    const vec3f32 = Vec3(f32).new(1, 2, 3).add(Vec3(f32).as(1));
    try testing.expect(vec3f32.x == 2 and vec3f32.y == 3 and vec3f32.z == 4);

    const vec4f32 = Vec4(f32).new(1, 2, 3, 4).add(Vec4(f32).as(1));
    try testing.expect(vec4f32.x == 2 and vec4f32.y == 3 and vec4f32.z == 4 and vec4f32.w == 5);

    const vec1i32 = Vec1(i32).new(1).add(Vec1(i32).as(1));
    try testing.expect(vec1i32.x == 2);

    const vec2i32 = Vec2(i32).new(1, 2).add(Vec2(i32).as(1));
    try testing.expect(vec2i32.x == 2 and vec2i32.y == 3);

    const vec3i32 = Vec3(i32).new(1, 2, 3).add(Vec3(i32).as(1));
    try testing.expect(vec3i32.x == 2 and vec3i32.y == 3 and vec3i32.z == 4);

    const vec4i32 = Vec4(i32).new(1, 2, 3, 4).add(Vec4(i32).as(1));
    try testing.expect(vec4i32.x == 2 and vec4i32.y == 3 and vec4i32.z == 4 and vec4i32.w == 5);

    const vec1u32 = Vec1(u32).new(1).add(Vec1(u32).as(1));
    try testing.expect(vec1u32.x == 2);

    const vec2u32 = Vec2(u32).new(1, 2).add(Vec2(u32).as(1));
    try testing.expect(vec2u32.x == 2 and vec2u32.y == 3);

    const vec3u32 = Vec3(u32).new(1, 2, 3).add(Vec3(u32).as(1));
    try testing.expect(vec3u32.x == 2 and vec3u32.y == 3 and vec3u32.z == 4);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).add(Vec4(u32).as(1));
    try testing.expect(vec4u32.x == 2 and vec4u32.y == 3 and vec4u32.z == 4 and vec4u32.w == 5);
}

test "Vec.adds(...)" {
    const vec1f32 = Vec1(f32).new(1).adds(1);
    try testing.expect(vec1f32.x == 2);

    const vec2f32 = Vec2(f32).new(1, 2).adds(1);
    try testing.expect(vec2f32.x == 2 and vec2f32.y == 3);

    const vec3f32 = Vec3(f32).new(1, 2, 3).adds(1);
    try testing.expect(vec3f32.x == 2 and vec3f32.y == 3 and vec3f32.z == 4);

    const vec4f32 = Vec4(f32).new(1, 2, 3, 4).adds(1);
    try testing.expect(vec4f32.x == 2 and vec4f32.y == 3 and vec4f32.z == 4 and vec4f32.w == 5);

    const vec1i32 = Vec1(i32).new(1).adds(1);
    try testing.expect(vec1i32.x == 2);

    const vec2i32 = Vec2(i32).new(1, 2).adds(1);
    try testing.expect(vec2i32.x == 2 and vec2i32.y == 3);

    const vec3i32 = Vec3(i32).new(1, 2, 3).adds(1);
    try testing.expect(vec3i32.x == 2 and vec3i32.y == 3 and vec3i32.z == 4);

    const vec4i32 = Vec4(i32).new(1, 2, 3, 4).adds(1);
    try testing.expect(vec4i32.x == 2 and vec4i32.y == 3 and vec4i32.z == 4 and vec4i32.w == 5);

    const vec1u32 = Vec1(u32).new(1).adds(1);
    try testing.expect(vec1u32.x == 2);

    const vec2u32 = Vec2(u32).new(1, 2).adds(1);
    try testing.expect(vec2u32.x == 2 and vec2u32.y == 3);

    const vec3u32 = Vec3(u32).new(1, 2, 3).adds(1);
    try testing.expect(vec3u32.x == 2 and vec3u32.y == 3 and vec3u32.z == 4);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).adds(1);
    try testing.expect(vec4u32.x == 2 and vec4u32.y == 3 and vec4u32.z == 4 and vec4u32.w == 5);
}

test "Vec.sub(...)" {
    const vec1f32 = Vec1(f32).new(1).sub(Vec1(f32).as(1));
    try testing.expect(vec1f32.x == 0);

    const vec2f32 = Vec2(f32).new(1, 2).sub(Vec2(f32).as(1));
    try testing.expect(vec2f32.x == 0 and vec2f32.y == 1);

    const vec3f32 = Vec3(f32).new(1, 2, 3).sub(Vec3(f32).as(1));
    try testing.expect(vec3f32.x == 0 and vec3f32.y == 1 and vec3f32.z == 2);

    const vec4f32 = Vec4(f32).new(1, 2, 3, 4).sub(Vec4(f32).as(1));
    try testing.expect(vec4f32.x == 0 and vec4f32.y == 1 and vec4f32.z == 2 and vec4f32.w == 3);

    const vec1i32 = Vec1(i32).new(1).sub(Vec1(i32).as(1));
    try testing.expect(vec1i32.x == 0);

    const vec2i32 = Vec2(i32).new(1, 2).sub(Vec2(i32).as(1));
    try testing.expect(vec2i32.x == 0 and vec2i32.y == 1);

    const vec3i32 = Vec3(i32).new(1, 2, 3).sub(Vec3(i32).as(1));
    try testing.expect(vec3i32.x == 0 and vec3i32.y == 1 and vec3i32.z == 2);

    const vec4i32 = Vec4(i32).new(1, 2, 3, 4).sub(Vec4(i32).as(1));
    try testing.expect(vec4i32.x == 0 and vec4i32.y == 1 and vec4i32.z == 2 and vec4i32.w == 3);

    const vec1u32 = Vec1(u32).new(1).sub(Vec1(u32).as(1));
    try testing.expect(vec1u32.x == 0);

    const vec2u32 = Vec2(u32).new(1, 2).sub(Vec2(u32).as(1));
    try testing.expect(vec2u32.x == 0 and vec2u32.y == 1);

    const vec3u32 = Vec3(u32).new(1, 2, 3).sub(Vec3(u32).as(1));
    try testing.expect(vec3u32.x == 0 and vec3u32.y == 1 and vec3u32.z == 2);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).sub(Vec4(u32).as(1));
    try testing.expect(vec4u32.x == 0 and vec4u32.y == 1 and vec4u32.z == 2 and vec4u32.w == 3);
}

test "Vec.subs(...)" {
    const vec1f32 = Vec1(f32).new(1).subs(1);
    try testing.expect(vec1f32.x == 0);

    const vec2f32 = Vec2(f32).new(1, 2).subs(1);
    try testing.expect(vec2f32.x == 0 and vec2f32.y == 1);

    const vec3f32 = Vec3(f32).new(1, 2, 3).subs(1);
    try testing.expect(vec3f32.x == 0 and vec3f32.y == 1 and vec3f32.z == 2);

    const vec4f32 = Vec4(f32).new(1, 2, 3, 4).subs(1);
    try testing.expect(vec4f32.x == 0 and vec4f32.y == 1 and vec4f32.z == 2 and vec4f32.w == 3);

    const vec1i32 = Vec1(i32).new(1).subs(1);
    try testing.expect(vec1i32.x == 0);

    const vec2i32 = Vec2(i32).new(1, 2).subs(1);
    try testing.expect(vec2i32.x == 0 and vec2i32.y == 1);

    const vec3i32 = Vec3(i32).new(1, 2, 3).subs(1);
    try testing.expect(vec3i32.x == 0 and vec3i32.y == 1 and vec3i32.z == 2);

    const vec4i32 = Vec4(i32).new(1, 2, 3, 4).subs(1);
    try testing.expect(vec4i32.x == 0 and vec4i32.y == 1 and vec4i32.z == 2 and vec4i32.w == 3);

    const vec1u32 = Vec1(u32).new(1).subs(1);
    try testing.expect(vec1u32.x == 0);

    const vec2u32 = Vec2(u32).new(1, 2).subs(1);
    try testing.expect(vec2u32.x == 0 and vec2u32.y == 1);

    const vec3u32 = Vec3(u32).new(1, 2, 3).subs(1);
    try testing.expect(vec3u32.x == 0 and vec3u32.y == 1 and vec3u32.z == 2);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).subs(1);
    try testing.expect(vec4u32.x == 0 and vec4u32.y == 1 and vec4u32.z == 2 and vec4u32.w == 3);
}

test "Vec.mul(...)" {
    const vec1f32 = Vec1(f32).new(-1.5).mul(Vec1(f32).as(2));
    try testing.expect(vec1f32.x == -3);

    const vec2f32 = Vec2(f32).new(-1.5, 2.5).mul(Vec2(f32).as(2));
    try testing.expect(vec2f32.x == -3 and vec2f32.y == 5);

    const vec3f32 = Vec3(f32).new(-1.5, 2.5, 3.5).mul(Vec3(f32).as(2));
    try testing.expect(vec3f32.x == -3 and vec3f32.y == 5 and vec3f32.z == 7);

    const vec4f32 = Vec4(f32).new(-1.5, 2.5, 3.5, 4.5).mul(Vec4(f32).as(2));
    try testing.expect(vec4f32.x == -3 and vec4f32.y == 5 and vec4f32.z == 7 and vec4f32.w == 9);

    const vec1i32 = Vec1(i32).new(-1).mul(Vec1(i32).as(2));
    try testing.expect(vec1i32.x == -2);

    const vec2i32 = Vec2(i32).new(-1, 2).mul(Vec2(i32).as(2));
    try testing.expect(vec2i32.x == -2 and vec2i32.y == 4);

    const vec3i32 = Vec3(i32).new(-1, 2, 3).mul(Vec3(i32).as(2));
    try testing.expect(vec3i32.x == -2 and vec3i32.y == 4 and vec3i32.z == 6);

    const vec4i32 = Vec4(i32).new(-1, 2, 3, 4).mul(Vec4(i32).as(2));
    try testing.expect(vec4i32.x == -2 and vec4i32.y == 4 and vec4i32.z == 6 and vec4i32.w == 8);

    const vec1u32 = Vec1(u32).new(1).mul(Vec1(u32).as(2));
    try testing.expect(vec1u32.x == 2);

    const vec2u32 = Vec2(u32).new(1, 2).mul(Vec2(u32).as(2));
    try testing.expect(vec2u32.x == 2 and vec2u32.y == 4);

    const vec3u32 = Vec3(u32).new(1, 2, 3).mul(Vec3(u32).as(2));
    try testing.expect(vec3u32.x == 2 and vec3u32.y == 4 and vec3u32.z == 6);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).mul(Vec4(u32).as(2));
    try testing.expect(vec4u32.x == 2 and vec4u32.y == 4 and vec4u32.z == 6 and vec4u32.w == 8);
}

test "Vec.muls(...)" {
    const vec1f32 = Vec1(f32).new(-1.5).muls(2);
    try testing.expect(vec1f32.x == -3);

    const vec2f32 = Vec2(f32).new(-1.5, 2.5).muls(2);
    try testing.expect(vec2f32.x == -3 and vec2f32.y == 5);

    const vec3f32 = Vec3(f32).new(-1.5, 2.5, 3.5).muls(2);
    try testing.expect(vec3f32.x == -3 and vec3f32.y == 5 and vec3f32.z == 7);

    const vec4f32 = Vec4(f32).new(-1.5, 2.5, 3.5, 4.5).muls(2);
    try testing.expect(vec4f32.x == -3 and vec4f32.y == 5 and vec4f32.z == 7 and vec4f32.w == 9);

    const vec1i32 = Vec1(i32).new(-1).muls(2);
    try testing.expect(vec1i32.x == -2);

    const vec2i32 = Vec2(i32).new(-1, 2).muls(2);
    try testing.expect(vec2i32.x == -2 and vec2i32.y == 4);

    const vec3i32 = Vec3(i32).new(-1, 2, 3).muls(2);
    try testing.expect(vec3i32.x == -2 and vec3i32.y == 4 and vec3i32.z == 6);

    const vec4i32 = Vec4(i32).new(-1, 2, 3, 4).muls(2);
    try testing.expect(vec4i32.x == -2 and vec4i32.y == 4 and vec4i32.z == 6 and vec4i32.w == 8);

    const vec1u32 = Vec1(u32).new(1).muls(2);
    try testing.expect(vec1u32.x == 2);

    const vec2u32 = Vec2(u32).new(1, 2).muls(2);
    try testing.expect(vec2u32.x == 2 and vec2u32.y == 4);

    const vec3u32 = Vec3(u32).new(1, 2, 3).muls(2);
    try testing.expect(vec3u32.x == 2 and vec3u32.y == 4 and vec3u32.z == 6);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).muls(2);
    try testing.expect(vec4u32.x == 2 and vec4u32.y == 4 and vec4u32.z == 6 and vec4u32.w == 8);
}

test "Vec.pow(...)" {
    const vec1f32 = Vec1(f32).new(-1.5).pow(Vec1(f32).as(2));
    try testing.expect(vec1f32.x == 2.25);

    const vec2f32 = Vec2(f32).new(-1.5, 2.5).pow(Vec2(f32).as(2));
    try testing.expect(vec2f32.x == 2.25 and vec2f32.y == 6.25);

    const vec3f32 = Vec3(f32).new(-1.5, 2.5, 3.5).pow(Vec3(f32).as(2));
    try testing.expect(vec3f32.x == 2.25 and vec3f32.y == 6.25 and vec3f32.z == 12.25);

    const vec4f32 = Vec4(f32).new(-1.5, 2.5, 3.5, 4.5).pow(Vec4(f32).as(2));
    try testing.expect(vec4f32.x == 2.25 and vec4f32.y == 6.25 and vec4f32.z == 12.25 and vec4f32.w == 20.25);

    const vec1i32 = Vec1(i32).new(-1).pow(Vec1(i32).as(2));
    try testing.expect(vec1i32.x == 1);

    const vec2i32 = Vec2(i32).new(-1, 2).pow(Vec2(i32).as(2));
    try testing.expect(vec2i32.x == 1 and vec2i32.y == 4);

    const vec3i32 = Vec3(i32).new(-1, 2, 3).pow(Vec3(i32).as(2));
    try testing.expect(vec3i32.x == 1 and vec3i32.y == 4 and vec3i32.z == 9);

    const vec4i32 = Vec4(i32).new(-1, 2, 3, 4).pow(Vec4(i32).as(2));
    try testing.expect(vec4i32.x == 1 and vec4i32.y == 4 and vec4i32.z == 9 and vec4i32.w == 16);

    const vec1u32 = Vec1(u32).new(1).pow(Vec1(u32).as(2));
    try testing.expect(vec1u32.x == 1);

    const vec2u32 = Vec2(u32).new(1, 2).pow(Vec2(u32).as(2));
    try testing.expect(vec2u32.x == 1 and vec2u32.y == 4);

    const vec3u32 = Vec3(u32).new(1, 2, 3).pow(Vec3(u32).as(2));
    try testing.expect(vec3u32.x == 1 and vec3u32.y == 4 and vec3u32.z == 9);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).pow(Vec4(u32).as(2));
    try testing.expect(vec4u32.x == 1 and vec4u32.y == 4 and vec4u32.z == 9 and vec4u32.w == 16);
}

test "Vec.pows(...)" {
    const vec1f32 = Vec1(f32).new(-1.5).pows(2);
    try testing.expect(vec1f32.x == 2.25);

    const vec2f32 = Vec2(f32).new(-1.5, 2.5).pows(2);
    try testing.expect(vec2f32.x == 2.25 and vec2f32.y == 6.25);

    const vec3f32 = Vec3(f32).new(-1.5, 2.5, 3.5).pows(2);
    try testing.expect(vec3f32.x == 2.25 and vec3f32.y == 6.25 and vec3f32.z == 12.25);

    const vec4f32 = Vec4(f32).new(-1.5, 2.5, 3.5, 4.5).pows(2);
    try testing.expect(vec4f32.x == 2.25 and vec4f32.y == 6.25 and vec4f32.z == 12.25 and vec4f32.w == 20.25);

    const vec1i32 = Vec1(i32).new(-1).pows(2);
    try testing.expect(vec1i32.x == 1);

    const vec2i32 = Vec2(i32).new(-1, 2).pows(2);
    try testing.expect(vec2i32.x == 1 and vec2i32.y == 4);

    const vec3i32 = Vec3(i32).new(-1, 2, 3).pows(2);
    try testing.expect(vec3i32.x == 1 and vec3i32.y == 4 and vec3i32.z == 9);

    const vec4i32 = Vec4(i32).new(-1, 2, 3, 4).pows(2);
    try testing.expect(vec4i32.x == 1 and vec4i32.y == 4 and vec4i32.z == 9 and vec4i32.w == 16);

    const vec1u32 = Vec1(u32).new(1).pows(2);
    try testing.expect(vec1u32.x == 1);

    const vec2u32 = Vec2(u32).new(1, 2).pows(2);
    try testing.expect(vec2u32.x == 1 and vec2u32.y == 4);

    const vec3u32 = Vec3(u32).new(1, 2, 3).pows(2);
    try testing.expect(vec3u32.x == 1 and vec3u32.y == 4 and vec3u32.z == 9);

    const vec4u32 = Vec4(u32).new(1, 2, 3, 4).pows(2);
    try testing.expect(vec4u32.x == 1 and vec4u32.y == 4 and vec4u32.z == 9 and vec4u32.w == 16);
}

test "Vec.dot(...)" {
    const dot1f32 = Vec1(f32).new(1.5).dot(Vec1(f32).new(1.5));
    try testing.expect(dot1f32 == 2.25);

    const dot2f32 = Vec2(f32).new(1.5, 2).dot(Vec2(f32).new(1.5, 2));
    try testing.expect(dot2f32 == 6.25);

    const dot3f32 = Vec3(f32).new(1.5, 2, 3).dot(Vec3(f32).new(1.5, 2, 3));
    try testing.expect(dot3f32 == 15.25);

    const dot4f32 = Vec4(f32).new(1.5, 2, 3, 4).dot(Vec4(f32).new(1.5, 2, 3, 4));
    try testing.expect(dot4f32 == 31.25);

    const dot1i32 = Vec1(i32).new(1).dot(Vec1(i32).new(1));
    try testing.expect(dot1i32 == 1);

    const dot2i32 = Vec2(i32).new(1, 2).dot(Vec2(i32).new(1, 2));
    try testing.expect(dot2i32 == 5);

    const dot3i32 = Vec3(i32).new(1, 2, 3).dot(Vec3(i32).new(1, 2, 3));
    try testing.expect(dot3i32 == 14);

    const dot4i32 = Vec4(i32).new(1, 2, 3, 4).dot(Vec4(i32).new(1, 2, 3, 4));
    try testing.expect(dot4i32 == 30);

    const dot1u32 = Vec1(i32).new(1).dot(Vec1(i32).new(1));
    try testing.expect(dot1u32 == 1);

    const dot2u32 = Vec2(i32).new(1, 2).dot(Vec2(i32).new(1, 2));
    try testing.expect(dot2u32 == 5);

    const dot3u32 = Vec3(i32).new(1, 2, 3).dot(Vec3(i32).new(1, 2, 3));
    try testing.expect(dot3u32 == 14);

    const dot4u32 = Vec4(i32).new(1, 2, 3, 4).dot(Vec4(i32).new(1, 2, 3, 4));
    try testing.expect(dot4u32 == 30);
}

test "Vec.sign(...)" {
    const vec1f32_sign = Vec1(f32).new(2.5).sign();
    try testing.expect(vec1f32_sign.x == 1);

    const vec2f32_sign = Vec2(f32).new(-2.5, 2.1).sign();
    try testing.expect(vec2f32_sign.x == -1 and vec2f32_sign.y == 1);

    const vec3f32_sign = Vec3(f32).new(-1.4, 0, 3.2).sign();
    try testing.expect(vec3f32_sign.x == -1 and vec3f32_sign.y == 0 and vec3f32_sign.z == 1);

    const vec4f32_sign = Vec4(f32).new(-6.3, 0, 2.8, -100.11).sign();
    try testing.expect(vec4f32_sign.x == -1 and vec4f32_sign.y == 0 and vec4f32_sign.z == 1 and vec4f32_sign.w == -1);

    const vec1i32_sign = Vec1(i32).new(2).sign();
    try testing.expect(vec1i32_sign.x == 1);

    const vec2i32_sign = Vec2(i32).new(-2, 2).sign();
    try testing.expect(vec2i32_sign.x == -1 and vec2i32_sign.y == 1);

    const vec3i32_sign = Vec3(i32).new(-2, 0, 2).sign();
    try testing.expect(vec3i32_sign.x == -1 and vec3i32_sign.y == 0 and vec3i32_sign.z == 1);

    const vec4i32_sign = Vec4(i32).new(-2, 0, 2, -100).sign();
    try testing.expect(vec4i32_sign.x == -1 and vec4i32_sign.y == 0 and vec4i32_sign.z == 1 and vec4i32_sign.w == -1);

    const vec1u32_sign = Vec1(u32).new(2).sign();
    try testing.expect(vec1u32_sign.x == 1);

    const vec2u32_sign = Vec2(u32).new(0, 2).sign();
    try testing.expect(vec2u32_sign.x == 0 and vec2u32_sign.y == 1);

    const vec3u32_sign = Vec3(u32).new(1, 0, 2).sign();
    try testing.expect(vec3u32_sign.x == 1 and vec3u32_sign.y == 0 and vec3u32_sign.z == 1);

    const vec4u32_sign = Vec4(u32).new(2, 0, 2, 0).sign();
    try testing.expect(vec4u32_sign.x == 1 and vec4u32_sign.y == 0 and vec4u32_sign.z == 1 and vec4u32_sign.w == 0);
}

test "Vec.mod(...)" {
    const vec1f32_mod = Vec1(f32).new(-5.5).mod(Vec1(f32).new(2));
    try testing.expect(vec1f32_mod.x == 0.5);

    const vec2f32_mod = Vec2(f32).new(-5.5, 5.5).mod(Vec2(f32).new(2, 2.5));
    try testing.expect(vec2f32_mod.x == 0.5 and vec2f32_mod.y == 0.5);

    const vec3f32_mod = Vec3(f32).new(-5.5, 5.5, 5).mod(Vec3(f32).new(2, 2.5, -2));
    try testing.expect(vec3f32_mod.x == 0.5 and vec3f32_mod.y == 0.5 and vec3f32_mod.z == 1);

    const vec4f32_mod = Vec4(f32).new(-5.5, 5.5, 5, 100).mod(Vec4(f32).new(2, 2.5, -2, 11));
    try testing.expect(vec4f32_mod.x == 0.5 and vec4f32_mod.y == 0.5 and vec4f32_mod.z == 1 and vec4f32_mod.w == 1);

    const vec1i32_mod = Vec1(i32).new(-5).mod(Vec1(i32).new(2));
    try testing.expect(vec1i32_mod.x == 1);

    const vec2i32_mod = Vec2(i32).new(-5, 5).mod(Vec2(i32).new(2, 2));
    try testing.expect(vec2i32_mod.x == 1 and vec2i32_mod.y == 1);

    const vec3i32_mod = Vec3(i32).new(-5, 5, 5).mod(Vec3(i32).new(2, 2, -2));
    try testing.expect(vec3i32_mod.x == 1 and vec3i32_mod.y == 1 and vec3i32_mod.z == -1);

    const vec4i32_mod = Vec4(i32).new(-5, 5, 5, 100).mod(Vec4(i32).new(2, 2, -2, 11));
    try testing.expect(vec4i32_mod.x == 1 and vec4i32_mod.y == 1 and vec4i32_mod.z == -1 and vec4i32_mod.w == 1);

    const vec1u32_mod = Vec1(u32).new(5).mod(Vec1(u32).new(2));
    try testing.expect(vec1u32_mod.x == 1);

    const vec2u32_mod = Vec2(u32).new(5, 5).mod(Vec2(u32).new(2, 2));
    try testing.expect(vec2u32_mod.x == 1 and vec2u32_mod.y == 1);

    const vec3u32_mod = Vec3(u32).new(5, 5, 5).mod(Vec3(u32).new(2, 2, 2));
    try testing.expect(vec3u32_mod.x == 1 and vec3u32_mod.y == 1 and vec3u32_mod.z == 1);

    const vec4u32_mod = Vec4(u32).new(5, 5, 5, 100).mod(Vec4(u32).new(2, 2, 2, 11));
    try testing.expect(vec4u32_mod.x == 1 and vec4u32_mod.y == 1 and vec4u32_mod.z == 1 and vec4u32_mod.w == 1);
}

test "Vec.mods(...)" {
    const vec1f32_mods = Vec1(f32).new(-5.5).mods(2);
    try testing.expect(vec1f32_mods.x == 0.5);

    const vec2f32_mods = Vec2(f32).new(-5.5, 5.5).mods(2);
    try testing.expect(vec2f32_mods.x == 0.5 and vec2f32_mods.y == 1.5);

    const vec3f32_mods = Vec3(f32).new(-5.5, 5.5, 5).mods(2);
    try testing.expect(vec3f32_mods.x == 0.5 and vec3f32_mods.y == 1.5 and vec3f32_mods.z == 1);

    const vec4f32_mods = Vec4(f32).new(-5.5, 5.5, 5, 100).mods(2);
    try testing.expect(vec4f32_mods.x == 0.5 and vec4f32_mods.y == 1.5 and vec4f32_mods.z == 1 and vec4f32_mods.w == 0);

    const vec1i32_mods = Vec1(i32).new(-5).mods(2);
    try testing.expect(vec1i32_mods.x == 1);

    const vec2i32_mods = Vec2(i32).new(-5, 5).mods(2);
    try testing.expect(vec2i32_mods.x == 1 and vec2i32_mods.y == 1);

    const vec3i32_mods = Vec3(i32).new(-5, 5, 5).mods(2);
    try testing.expect(vec3i32_mods.x == 1 and vec3i32_mods.y == 1 and vec3i32_mods.z == 1);

    const vec4i32_mods = Vec4(i32).new(-5, 5, 5, 100).mods(2);
    try testing.expect(vec4i32_mods.x == 1 and vec4i32_mods.y == 1 and vec4i32_mods.z == 1 and vec4i32_mods.w == 0);

    const vec1u32_mods = Vec1(u32).new(5).mods(2);
    try testing.expect(vec1u32_mods.x == 1);

    const vec2u32_mods = Vec2(u32).new(5, 5).mods(2);
    try testing.expect(vec2u32_mods.x == 1 and vec2u32_mods.y == 1);

    const vec3u32_mods = Vec3(u32).new(5, 5, 5).mods(2);
    try testing.expect(vec3u32_mods.x == 1 and vec3u32_mods.y == 1 and vec3u32_mods.z == 1);

    const vec4u32_mods = Vec4(u32).new(5, 5, 5, 100).mods(2);
    try testing.expect(vec4u32_mods.x == 1 and vec4u32_mods.y == 1 and vec4u32_mods.z == 1 and vec4u32_mods.w == 0);
}

test "Vec.min(...)" {
    const vec1f32_min = Vec1(f32).new(1).min(Vec1(f32).new(-1.5));
    try testing.expect(vec1f32_min.x == -1.5);

    const vec2f32_min = Vec2(f32).new(1, -0.5).min(Vec2(f32).new(-1.5, 2.5));
    try testing.expect(vec2f32_min.x == -1.5 and vec2f32_min.y == -0.5);

    const vec3f32_min = Vec3(f32).new(1, -0.5, 0.5).min(Vec3(f32).new(-1.5, 2.5, 0.5));
    try testing.expect(vec3f32_min.x == -1.5 and vec3f32_min.y == -0.5 and vec3f32_min.z == 0.5);

    const vec4f32_min = Vec4(f32).new(1, -0.5, 0.5, -0).min(Vec4(f32).new(-1.5, 2.5, 0.5, 0));
    try testing.expect(vec4f32_min.x == -1.5 and vec4f32_min.y == -0.5 and vec4f32_min.z == 0.5 and vec4f32_min.w == 0);

    const vec1i32_min = Vec1(i32).new(1).min(Vec1(i32).new(-1));
    try testing.expect(vec1i32_min.x == -1);

    const vec2i32_min = Vec2(i32).new(1, -100).min(Vec2(i32).new(-1, 2));
    try testing.expect(vec2i32_min.x == -1 and vec2i32_min.y == -100);

    const vec3i32_min = Vec3(i32).new(1, -100, 0).min(Vec3(i32).new(-1, 2, 0));
    try testing.expect(vec3i32_min.x == -1 and vec3i32_min.y == -100 and vec3i32_min.z == 0);

    const vec4i32_min = Vec4(i32).new(1, -100, 0, -100).min(Vec4(i32).new(-1, 2, 0, 0));
    try testing.expect(vec4i32_min.x == -1 and vec4i32_min.y == -100 and vec4i32_min.z == 0 and vec4i32_min.w == -100);

    const vec1u32_min = Vec1(u32).new(1).min(Vec1(u32).new(100));
    try testing.expect(vec1u32_min.x == 1);

    const vec2u32_min = Vec2(u32).new(1, 20).min(Vec2(u32).new(10, 1));
    try testing.expect(vec2u32_min.x == 1 and vec2u32_min.y == 1);

    const vec3u32_min = Vec3(u32).new(1, 2, 3).min(Vec3(u32).new(3, 2, 1));
    try testing.expect(vec3u32_min.x == 1 and vec3u32_min.y == 2 and vec3u32_min.z == 1);

    const vec4u32_min = Vec4(u32).new(1, 2, 3, 4).min(Vec4(u32).new(4, 3, 2, 1));
    try testing.expect(vec4u32_min.x == 1 and vec4u32_min.y == 2 and vec4u32_min.z == 2 and vec4u32_min.w == 1);
}

test "Vec.mins(...)" {
    const vec1f32_mins = Vec1(f32).new(1).mins(-1.5);
    try testing.expect(vec1f32_mins.x == -1.5);

    const vec2f32_mins = Vec2(f32).new(1, -0.5).mins(0);
    try testing.expect(vec2f32_mins.x == 0 and vec2f32_mins.y == -0.5);

    const vec3f32_mins = Vec3(f32).new(1, -0.5, 0.5).mins(0.75);
    try testing.expect(vec3f32_mins.x == 0.75 and vec3f32_mins.y == -0.5 and vec3f32_mins.z == 0.5);

    const vec4f32_mins = Vec4(f32).new(1, -0.5, 0.5, -0).mins(0);
    try testing.expect(vec4f32_mins.x == 0 and vec4f32_mins.y == -0.5 and vec4f32_mins.z == 0 and vec4f32_mins.w == 0);

    const vec1i32_mins = Vec1(i32).new(1).mins(-1);
    try testing.expect(vec1i32_mins.x == -1);

    const vec2i32_mins = Vec2(i32).new(1, -100).mins(-1);
    try testing.expect(vec2i32_mins.x == -1 and vec2i32_mins.y == -100);

    const vec3i32_mins = Vec3(i32).new(1, -100, 0).mins(-1);
    try testing.expect(vec3i32_mins.x == -1 and vec3i32_mins.y == -100 and vec3i32_mins.z == -1);

    const vec4i32_mins = Vec4(i32).new(1, -100, 0, -100).mins(0);
    try testing.expect(vec4i32_mins.x == 0 and vec4i32_mins.y == -100 and vec4i32_mins.z == 0 and vec4i32_mins.w == -100);

    const vec1u32_mins = Vec1(u32).new(1).mins(100);
    try testing.expect(vec1u32_mins.x == 1);

    const vec2u32_mins = Vec2(u32).new(1, 20).mins(0);
    try testing.expect(vec2u32_mins.x == 0 and vec2u32_mins.y == 0);

    const vec3u32_mins = Vec3(u32).new(1, 2, 3).mins(2);
    try testing.expect(vec3u32_mins.x == 1 and vec3u32_mins.y == 2 and vec3u32_mins.z == 2);

    const vec4u32_mins = Vec4(u32).new(1, 2, 3, 4).mins(3);
    try testing.expect(vec4u32_mins.x == 1 and vec4u32_mins.y == 2 and vec4u32_mins.z == 3 and vec4u32_mins.w == 3);
}

test "Vec.max(...)" {
    const vec1f32_max = Vec1(f32).new(1).max(Vec1(f32).new(-1.5));
    try testing.expect(vec1f32_max.x == 1);

    const vec2f32_max = Vec2(f32).new(1, -0.5).max(Vec2(f32).new(-1.5, 2.5));
    try testing.expect(vec2f32_max.x == 1 and vec2f32_max.y == 2.5);

    const vec3f32_max = Vec3(f32).new(1, -0.5, 0.5).max(Vec3(f32).new(-1.5, 2.5, 0.5));
    try testing.expect(vec3f32_max.x == 1 and vec3f32_max.y == 2.5 and vec3f32_max.z == 0.5);

    const vec4f32_max = Vec4(f32).new(1, -0.5, 0.5, -0).max(Vec4(f32).new(-1.5, 2.5, 0.5, 0));
    try testing.expect(vec4f32_max.x == 1 and vec4f32_max.y == 2.5 and vec4f32_max.z == 0.5 and vec4f32_max.w == 0);

    const vec1i32_max = Vec1(i32).new(1).max(Vec1(i32).new(-1));
    try testing.expect(vec1i32_max.x == 1);

    const vec2i32_max = Vec2(i32).new(1, -100).max(Vec2(i32).new(-1, 2));
    try testing.expect(vec2i32_max.x == 1 and vec2i32_max.y == 2);

    const vec3i32_max = Vec3(i32).new(1, -100, 0).max(Vec3(i32).new(-1, 2, 0));
    try testing.expect(vec3i32_max.x == 1 and vec3i32_max.y == 2 and vec3i32_max.z == 0);

    const vec4i32_max = Vec4(i32).new(1, -100, 0, -100).max(Vec4(i32).new(-1, 2, 0, 0));
    try testing.expect(vec4i32_max.x == 1 and vec4i32_max.y == 2 and vec4i32_max.z == 0 and vec4i32_max.w == 0);

    const vec1u32_max = Vec1(u32).new(1).max(Vec1(u32).new(100));
    try testing.expect(vec1u32_max.x == 100);

    const vec2u32_max = Vec2(u32).new(1, 20).max(Vec2(u32).new(10, 1));
    try testing.expect(vec2u32_max.x == 10 and vec2u32_max.y == 20);

    const vec3u32_max = Vec3(u32).new(1, 2, 3).max(Vec3(u32).new(3, 2, 1));
    try testing.expect(vec3u32_max.x == 3 and vec3u32_max.y == 2 and vec3u32_max.z == 3);

    const vec4u32_max = Vec4(u32).new(1, 2, 3, 4).max(Vec4(u32).new(4, 3, 2, 1));
    try testing.expect(vec4u32_max.x == 4 and vec4u32_max.y == 3 and vec4u32_max.z == 3 and vec4u32_max.w == 4);
}

test "Vec.maxs(...)" {
    const vec1f32_maxs = Vec1(f32).new(1).maxs(-1.5);
    try testing.expect(vec1f32_maxs.x == 1);

    const vec2f32_maxs = Vec2(f32).new(1, -0.5).maxs(0);
    try testing.expect(vec2f32_maxs.x == 1 and vec2f32_maxs.y == 0);

    const vec3f32_maxs = Vec3(f32).new(1, -0.5, 0.5).maxs(0.75);
    try testing.expect(vec3f32_maxs.x == 1 and vec3f32_maxs.y == 0.75 and vec3f32_maxs.z == 0.75);

    const vec4f32_maxs = Vec4(f32).new(1, -0.5, 0.5, -0).maxs(0);
    try testing.expect(vec4f32_maxs.x == 1 and vec4f32_maxs.y == 0 and vec4f32_maxs.z == 0.5 and vec4f32_maxs.w == 0);

    const vec1i32_maxs = Vec1(i32).new(1).maxs(-1);
    try testing.expect(vec1i32_maxs.x == 1);

    const vec2i32_maxs = Vec2(i32).new(1, -100).maxs(-1);
    try testing.expect(vec2i32_maxs.x == 1 and vec2i32_maxs.y == -1);

    const vec3i32_maxs = Vec3(i32).new(1, -100, 0).maxs(-1);
    try testing.expect(vec3i32_maxs.x == 1 and vec3i32_maxs.y == -1 and vec3i32_maxs.z == 0);

    const vec4i32_maxs = Vec4(i32).new(1, -100, 0, -100).maxs(0);
    try testing.expect(vec4i32_maxs.x == 1 and vec4i32_maxs.y == 0 and vec4i32_maxs.z == 0 and vec4i32_maxs.w == 0);

    const vec1u32_maxs = Vec1(u32).new(1).maxs(100);
    try testing.expect(vec1u32_maxs.x == 100);

    const vec2u32_maxs = Vec2(u32).new(1, 20).maxs(0);
    try testing.expect(vec2u32_maxs.x == 1 and vec2u32_maxs.y == 20);

    const vec3u32_maxs = Vec3(u32).new(1, 2, 3).maxs(2);
    try testing.expect(vec3u32_maxs.x == 2 and vec3u32_maxs.y == 2 and vec3u32_maxs.z == 3);

    const vec4u32_maxs = Vec4(u32).new(1, 2, 3, 4).maxs(3);
    try testing.expect(vec4u32_maxs.x == 3 and vec4u32_maxs.y == 3 and vec4u32_maxs.z == 3 and vec4u32_maxs.w == 4);
}

test "Vec.clamp(...)" {
    const vec1f32_clamp = Vec1(f32).new(0).clamp(Vec1(f32).as(-1.5), Vec1(f32).as(1.5));
    try testing.expect(vec1f32_clamp.x == 0);

    const vec2f32_clamp = Vec2(f32).new(0, 2.5).clamp(Vec2(f32).as(-1.5), Vec2(f32).as(1.5));
    try testing.expect(vec2f32_clamp.x == 0 and vec2f32_clamp.y == 1.5);

    const vec3f32_clamp = Vec3(f32).new(0, 2.5, -2.5).clamp(Vec3(f32).as(-1.5), Vec3(f32).as(1.5));
    try testing.expect(vec3f32_clamp.x == 0 and vec3f32_clamp.y == 1.5 and vec3f32_clamp.z == -1.5);

    const vec4f32_clamp = Vec4(f32).new(0, 2.5, -2.5, 1.5).clamp(Vec4(f32).as(-1.5), Vec4(f32).as(1.5));
    try testing.expect(vec4f32_clamp.x == 0 and vec4f32_clamp.y == 1.5 and vec4f32_clamp.z == -1.5 and vec4f32_clamp.w == 1.5);

    const vec1i32_clamp = Vec1(i32).new(0).clamp(Vec1(i32).as(-1), Vec1(i32).as(1));
    try testing.expect(vec1i32_clamp.x == 0);

    const vec2i32_clamp = Vec2(i32).new(0, 2).clamp(Vec2(i32).as(-1), Vec2(i32).as(1));
    try testing.expect(vec2i32_clamp.x == 0 and vec2i32_clamp.y == 1);

    const vec3i32_clamp = Vec3(i32).new(0, 2, -2).clamp(Vec3(i32).as(-1), Vec3(i32).as(1));
    try testing.expect(vec3i32_clamp.x == 0 and vec3i32_clamp.y == 1 and vec3i32_clamp.z == -1);

    const vec4i32_clamp = Vec4(i32).new(0, 2, -2, 1).clamp(Vec4(i32).as(-1), Vec4(i32).as(1));
    try testing.expect(vec4i32_clamp.x == 0 and vec4i32_clamp.y == 1 and vec4i32_clamp.z == -1 and vec4i32_clamp.w == 1);

    const vec1u32_clamp = Vec1(u32).new(3).clamp(Vec1(u32).as(2), Vec1(u32).as(4));
    try testing.expect(vec1u32_clamp.x == 3);

    const vec2u32_clamp = Vec2(u32).new(3, 5).clamp(Vec2(u32).as(2), Vec2(u32).as(4));
    try testing.expect(vec2u32_clamp.x == 3 and vec2u32_clamp.y == 4);

    const vec3u32_clamp = Vec3(u32).new(3, 5, 1).clamp(Vec3(u32).as(2), Vec3(u32).as(4));
    try testing.expect(vec3u32_clamp.x == 3 and vec3u32_clamp.y == 4 and vec3u32_clamp.z == 2);

    const vec4u32_clamp = Vec4(u32).new(3, 5, 1, 4).clamp(Vec4(u32).as(2), Vec4(u32).as(4));
    try testing.expect(vec4u32_clamp.x == 3 and vec4u32_clamp.y == 4 and vec4u32_clamp.z == 2 and vec4u32_clamp.w == 4);
}

test "Vec.clamps(...)" {
    const vec1f32_clamps = Vec1(f32).new(0).clamps(-1.5, 1.5);
    try testing.expect(vec1f32_clamps.x == 0);

    const vec2f32_clamps = Vec2(f32).new(0, 2.5).clamps(-1.5, 1.5);
    try testing.expect(vec2f32_clamps.x == 0 and vec2f32_clamps.y == 1.5);

    const vec3f32_clamps = Vec3(f32).new(0, 2.5, -2.5).clamps(-1.5, 1.5);
    try testing.expect(vec3f32_clamps.x == 0 and vec3f32_clamps.y == 1.5 and vec3f32_clamps.z == -1.5);

    const vec4f32_clamps = Vec4(f32).new(0, 2.5, -2.5, 1.5).clamps(-1.5, 1.5);
    try testing.expect(vec4f32_clamps.x == 0 and vec4f32_clamps.y == 1.5 and vec4f32_clamps.z == -1.5 and vec4f32_clamps.w == 1.5);

    const vec1i32_clamps = Vec1(i32).new(0).clamps(-1, 1);
    try testing.expect(vec1i32_clamps.x == 0);

    const vec2i32_clamps = Vec2(i32).new(0, 2).clamps(-1, 1);
    try testing.expect(vec2i32_clamps.x == 0 and vec2i32_clamps.y == 1);

    const vec3i32_clamps = Vec3(i32).new(0, 2, -2).clamps(-1, 1);
    try testing.expect(vec3i32_clamps.x == 0 and vec3i32_clamps.y == 1 and vec3i32_clamps.z == -1);

    const vec4i32_clamps = Vec4(i32).new(0, 2, -2, 1).clamps(-1, 1);
    try testing.expect(vec4i32_clamps.x == 0 and vec4i32_clamps.y == 1 and vec4i32_clamps.z == -1 and vec4i32_clamps.w == 1);

    const vec1u32_clamps = Vec1(u32).new(3).clamps(2, 4);
    try testing.expect(vec1u32_clamps.x == 3);

    const vec2u32_clamps = Vec2(u32).new(3, 5).clamps(2, 4);
    try testing.expect(vec2u32_clamps.x == 3 and vec2u32_clamps.y == 4);

    const vec3u32_clamps = Vec3(u32).new(3, 5, 1).clamps(2, 4);
    try testing.expect(vec3u32_clamps.x == 3 and vec3u32_clamps.y == 4 and vec3u32_clamps.z == 2);

    const vec4u32_clamps = Vec4(u32).new(3, 5, 1, 4).clamps(2, 4);
    try testing.expect(vec4u32_clamps.x == 3 and vec4u32_clamps.y == 4 and vec4u32_clamps.z == 2 and vec4u32_clamps.w == 4);
}

test "Vec.step(...)" {
    const vec1f32_step = Vec1(f32).as(1).step(Vec1(f32).new(0.5));
    try testing.expect(vec1f32_step.x == 0);

    const vec2f32_step = Vec2(f32).as(1).step(Vec2(f32).new(0.5, 1));
    try testing.expect(vec2f32_step.x == 0 and vec2f32_step.y == 1);

    const vec3f32_step = Vec3(f32).as(1).step(Vec3(f32).new(0.5, 1, 1.5));
    try testing.expect(vec3f32_step.x == 0 and vec3f32_step.y == 1 and vec3f32_step.z == 1);

    const vec4f32_step = Vec4(f32).as(1).step(Vec4(f32).new(0.5, 1, 1.5, 2));
    try testing.expect(vec4f32_step.x == 0 and vec4f32_step.y == 1 and vec4f32_step.z == 1 and vec4f32_step.w == 1);

    const vec1i32_step = Vec1(i32).as(1).step(Vec1(i32).new(0));
    try testing.expect(vec1i32_step.x == 0);

    const vec2i32_step = Vec2(i32).as(1).step(Vec2(i32).new(0, -1));
    try testing.expect(vec2i32_step.x == 0 and vec2i32_step.y == 0);

    const vec3i32_step = Vec3(i32).as(1).step(Vec3(i32).new(0, -1, 1));
    try testing.expect(vec3i32_step.x == 0 and vec3i32_step.y == 0 and vec3i32_step.z == 1);

    const vec4i32_step = Vec4(i32).as(1).step(Vec4(i32).new(0, -1, 1, 2));
    try testing.expect(vec4i32_step.x == 0 and vec4i32_step.y == 0 and vec4i32_step.z == 1 and vec4i32_step.w == 1);

    const vec1u32_step = Vec1(u32).as(1).step(Vec1(u32).new(0));
    try testing.expect(vec1u32_step.x == 0);

    const vec2u32_step = Vec2(u32).as(1).step(Vec2(u32).new(0, 1));
    try testing.expect(vec2u32_step.x == 0 and vec2u32_step.y == 1);

    const vec3u32_step = Vec3(u32).as(1).step(Vec3(u32).new(0, 1, 1));
    try testing.expect(vec3u32_step.x == 0 and vec3u32_step.y == 1 and vec3u32_step.z == 1);

    const vec4u32_step = Vec4(u32).as(1).step(Vec4(u32).new(0, 1, 1, 2));
    try testing.expect(vec4u32_step.x == 0 and vec4u32_step.y == 1 and vec4u32_step.z == 1 and vec4u32_step.w == 1);
}

test "Vec.steps(...)" {
    const vec1f32_steps = Vec1(f32).steps(1, Vec1(f32).new(0.5));
    try testing.expect(vec1f32_steps.x == 0);

    const vec2f32_steps = Vec2(f32).steps(1, Vec2(f32).new(0.5, 1));
    try testing.expect(vec2f32_steps.x == 0 and vec2f32_steps.y == 1);

    const vec3f32_steps = Vec3(f32).steps(1, Vec3(f32).new(0.5, 1, 1.5));
    try testing.expect(vec3f32_steps.x == 0 and vec3f32_steps.y == 1 and vec3f32_steps.z == 1);

    const vec4f32_steps = Vec4(f32).steps(1, Vec4(f32).new(0.5, 1, 1.5, 2));
    try testing.expect(vec4f32_steps.x == 0 and vec4f32_steps.y == 1 and vec4f32_steps.z == 1 and vec4f32_steps.w == 1);

    const vec1i32_steps = Vec1(i32).steps(1, Vec1(i32).new(0));
    try testing.expect(vec1i32_steps.x == 0);

    const vec2i32_steps = Vec2(i32).steps(1, Vec2(i32).new(0, -1));
    try testing.expect(vec2i32_steps.x == 0 and vec2i32_steps.y == 0);

    const vec3i32_steps = Vec3(i32).steps(1, Vec3(i32).new(0, -1, 1));
    try testing.expect(vec3i32_steps.x == 0 and vec3i32_steps.y == 0 and vec3i32_steps.z == 1);

    const vec4i32_steps = Vec4(i32).steps(1, Vec4(i32).new(0, -1, 1, 2));
    try testing.expect(vec4i32_steps.x == 0 and vec4i32_steps.y == 0 and vec4i32_steps.z == 1 and vec4i32_steps.w == 1);

    const vec1u32_steps = Vec1(u32).steps(1, Vec1(u32).new(0));
    try testing.expect(vec1u32_steps.x == 0);

    const vec2u32_steps = Vec2(u32).steps(1, Vec2(u32).new(0, 1));
    try testing.expect(vec2u32_steps.x == 0 and vec2u32_steps.y == 1);

    const vec3u32_steps = Vec3(u32).steps(1, Vec3(u32).new(0, 1, 1));
    try testing.expect(vec3u32_steps.x == 0 and vec3u32_steps.y == 1 and vec3u32_steps.z == 1);

    const vec4u32_steps = Vec4(u32).steps(1, Vec4(u32).new(0, 1, 1, 2));
    try testing.expect(vec4u32_steps.x == 0 and vec4u32_steps.y == 1 and vec4u32_steps.z == 1 and vec4u32_steps.w == 1);
}

test "Vec.lessThan(...)" {
    const vec1f32_lessThan = Vec1(f32).new(-1).lessThan(Vec1(f32).as(0));
    try testing.expect(vec1f32_lessThan.x == true);

    const vec2f32_lessThan = Vec2(f32).new(-1, -0.5).lessThan(Vec2(f32).as(0));
    try testing.expect(vec2f32_lessThan.x == true and vec2f32_lessThan.y == true);

    const vec3f32_lessThan = Vec3(f32).new(-1, -0.5, 0).lessThan(Vec3(f32).as(0));
    try testing.expect(vec3f32_lessThan.x == true and vec3f32_lessThan.y == true and vec3f32_lessThan.z == false);

    const vec4f32_lessThan = Vec4(f32).new(-1, -0.5, 0, 0.5).lessThan(Vec4(f32).as(0));
    try testing.expect(vec4f32_lessThan.x == true and vec4f32_lessThan.y == true and vec4f32_lessThan.z == false and vec4f32_lessThan.w == false);

    const vec1i32_lessThan = Vec1(i32).new(-1).lessThan(Vec1(i32).as(0));
    try testing.expect(vec1i32_lessThan.x == true);

    const vec2i32_lessThan = Vec2(i32).new(-1, 0).lessThan(Vec2(i32).as(0));
    try testing.expect(vec2i32_lessThan.x == true and vec2i32_lessThan.y == false);

    const vec3i32_lessThan = Vec3(i32).new(-1, 0, 1).lessThan(Vec3(i32).as(0));
    try testing.expect(vec3i32_lessThan.x == true and vec3i32_lessThan.y == false and vec3i32_lessThan.z == false);

    const vec4i32_lessThan = Vec4(i32).new(-1, 0, 1, 2).lessThan(Vec4(i32).as(0));
    try testing.expect(vec4i32_lessThan.x == true and vec4i32_lessThan.y == false and vec4i32_lessThan.z == false and vec4i32_lessThan.w == false);

    const vec1u32_lessThan = Vec1(u32).new(0).lessThan(Vec1(u32).as(1));
    try testing.expect(vec1u32_lessThan.x == true);

    const vec2u32_lessThan = Vec2(u32).new(0, 1).lessThan(Vec2(u32).as(1));
    try testing.expect(vec2u32_lessThan.x == true and vec2u32_lessThan.y == false);

    const vec3u32_lessThan = Vec3(u32).new(0, 1, 2).lessThan(Vec3(u32).as(1));
    try testing.expect(vec3u32_lessThan.x == true and vec3u32_lessThan.y == false and vec3u32_lessThan.z == false);

    const vec4u32_lessThan = Vec4(u32).new(0, 1, 2, 3).lessThan(Vec4(u32).as(1));
    try testing.expect(vec4u32_lessThan.x == true and vec4u32_lessThan.y == false and vec4u32_lessThan.z == false and vec4u32_lessThan.w == false);
}

test "Vec.lessThanEqual(...)" {
    const vec1f32_lessThanEqual = Vec1(f32).new(-1).lessThanEqual(Vec1(f32).as(0));
    try testing.expect(vec1f32_lessThanEqual.x == true);

    const vec2f32_lessThanEqual = Vec2(f32).new(-1, -0.5).lessThanEqual(Vec2(f32).as(0));
    try testing.expect(vec2f32_lessThanEqual.x == true and vec2f32_lessThanEqual.y == true);

    const vec3f32_lessThanEqual = Vec3(f32).new(-1, -0.5, 0).lessThanEqual(Vec3(f32).as(0));
    try testing.expect(vec3f32_lessThanEqual.x == true and vec3f32_lessThanEqual.y == true and vec3f32_lessThanEqual.z == true);

    const vec4f32_lessThanEqual = Vec4(f32).new(-1, -0.5, 0, 0.5).lessThanEqual(Vec4(f32).as(0));
    try testing.expect(vec4f32_lessThanEqual.x == true and vec4f32_lessThanEqual.y == true and vec4f32_lessThanEqual.z == true and vec4f32_lessThanEqual.w == false);

    const vec1i32_lessThanEqual = Vec1(i32).new(-1).lessThanEqual(Vec1(i32).as(0));
    try testing.expect(vec1i32_lessThanEqual.x == true);

    const vec2i32_lessThanEqual = Vec2(i32).new(-1, 0).lessThanEqual(Vec2(i32).as(0));
    try testing.expect(vec2i32_lessThanEqual.x == true and vec2i32_lessThanEqual.y == true);

    const vec3i32_lessThanEqual = Vec3(i32).new(-1, 0, 1).lessThanEqual(Vec3(i32).as(0));
    try testing.expect(vec3i32_lessThanEqual.x == true and vec3i32_lessThanEqual.y == true and vec3i32_lessThanEqual.z == false);

    const vec4i32_lessThanEqual = Vec4(i32).new(-1, 0, 1, 2).lessThanEqual(Vec4(i32).as(0));
    try testing.expect(vec4i32_lessThanEqual.x == true and vec4i32_lessThanEqual.y == true and vec4i32_lessThanEqual.z == false and vec4i32_lessThanEqual.w == false);

    const vec1u32_lessThanEqual = Vec1(u32).new(0).lessThanEqual(Vec1(u32).as(1));
    try testing.expect(vec1u32_lessThanEqual.x == true);

    const vec2u32_lessThanEqual = Vec2(u32).new(0, 1).lessThanEqual(Vec2(u32).as(1));
    try testing.expect(vec2u32_lessThanEqual.x == true and vec2u32_lessThanEqual.y == true);

    const vec3u32_lessThanEqual = Vec3(u32).new(0, 1, 2).lessThanEqual(Vec3(u32).as(1));
    try testing.expect(vec3u32_lessThanEqual.x == true and vec3u32_lessThanEqual.y == true and vec3u32_lessThanEqual.z == false);

    const vec4u32_lessThanEqual = Vec4(u32).new(0, 1, 2, 3).lessThanEqual(Vec4(u32).as(1));
    try testing.expect(vec4u32_lessThanEqual.x == true and vec4u32_lessThanEqual.y == true and vec4u32_lessThanEqual.z == false and vec4u32_lessThanEqual.w == false);
}

test "Vec.greaterThan(...)" {
    const vec1f32_greaterThan = Vec1(f32).new(-1).greaterThan(Vec1(f32).as(0));
    try testing.expect(vec1f32_greaterThan.x == false);

    const vec2f32_greaterThan = Vec2(f32).new(-1, -0.5).greaterThan(Vec2(f32).as(0));
    try testing.expect(vec2f32_greaterThan.x == false and vec2f32_greaterThan.y == false);

    const vec3f32_greaterThan = Vec3(f32).new(-1, -0.5, 0).greaterThan(Vec3(f32).as(0));
    try testing.expect(vec3f32_greaterThan.x == false and vec3f32_greaterThan.y == false and vec3f32_greaterThan.z == false);

    const vec4f32_greaterThan = Vec4(f32).new(-1, -0.5, 0, 0.5).greaterThan(Vec4(f32).as(0));
    try testing.expect(vec4f32_greaterThan.x == false and vec4f32_greaterThan.y == false and vec4f32_greaterThan.z == false and vec4f32_greaterThan.w == true);

    const vec1i32_greaterThan = Vec1(i32).new(-1).greaterThan(Vec1(i32).as(0));
    try testing.expect(vec1i32_greaterThan.x == false);

    const vec2i32_greaterThan = Vec2(i32).new(-1, 0).greaterThan(Vec2(i32).as(0));
    try testing.expect(vec2i32_greaterThan.x == false and vec2i32_greaterThan.y == false);

    const vec3i32_greaterThan = Vec3(i32).new(-1, 0, 1).greaterThan(Vec3(i32).as(0));
    try testing.expect(vec3i32_greaterThan.x == false and vec3i32_greaterThan.y == false and vec3i32_greaterThan.z == true);

    const vec4i32_greaterThan = Vec4(i32).new(-1, 0, 1, 2).greaterThan(Vec4(i32).as(0));
    try testing.expect(vec4i32_greaterThan.x == false and vec4i32_greaterThan.y == false and vec4i32_greaterThan.z == true and vec4i32_greaterThan.w == true);

    const vec1u32_greaterThan = Vec1(u32).new(0).greaterThan(Vec1(u32).as(1));
    try testing.expect(vec1u32_greaterThan.x == false);

    const vec2u32_greaterThan = Vec2(u32).new(0, 1).greaterThan(Vec2(u32).as(1));
    try testing.expect(vec2u32_greaterThan.x == false and vec2u32_greaterThan.y == false);

    const vec3u32_greaterThan = Vec3(u32).new(0, 1, 2).greaterThan(Vec3(u32).as(1));
    try testing.expect(vec3u32_greaterThan.x == false and vec3u32_greaterThan.y == false and vec3u32_greaterThan.z == true);

    const vec4u32_greaterThan = Vec4(u32).new(0, 1, 2, 3).greaterThan(Vec4(u32).as(1));
    try testing.expect(vec4u32_greaterThan.x == false and vec4u32_greaterThan.y == false and vec4u32_greaterThan.z == true and vec4u32_greaterThan.w == true);
}

test "Vec.greaterThanEqual(...)" {
    const vec1f32_greaterThanEqual = Vec1(f32).new(-1).greaterThanEqual(Vec1(f32).as(0));
    try testing.expect(vec1f32_greaterThanEqual.x == false);

    const vec2f32_greaterThanEqual = Vec2(f32).new(-1, -0.5).greaterThanEqual(Vec2(f32).as(0));
    try testing.expect(vec2f32_greaterThanEqual.x == false and vec2f32_greaterThanEqual.y == false);

    const vec3f32_greaterThanEqual = Vec3(f32).new(-1, -0.5, 0).greaterThanEqual(Vec3(f32).as(0));
    try testing.expect(vec3f32_greaterThanEqual.x == false and vec3f32_greaterThanEqual.y == false and vec3f32_greaterThanEqual.z == true);

    const vec4f32_greaterThanEqual = Vec4(f32).new(-1, -0.5, 0, 0.5).greaterThanEqual(Vec4(f32).as(0));
    try testing.expect(vec4f32_greaterThanEqual.x == false and vec4f32_greaterThanEqual.y == false and vec4f32_greaterThanEqual.z == true and vec4f32_greaterThanEqual.w == true);

    const vec1i32_greaterThanEqual = Vec1(i32).new(-1).greaterThanEqual(Vec1(i32).as(0));
    try testing.expect(vec1i32_greaterThanEqual.x == false);

    const vec2i32_greaterThanEqual = Vec2(i32).new(-1, 0).greaterThanEqual(Vec2(i32).as(0));
    try testing.expect(vec2i32_greaterThanEqual.x == false and vec2i32_greaterThanEqual.y == true);

    const vec3i32_greaterThanEqual = Vec3(i32).new(-1, 0, 1).greaterThanEqual(Vec3(i32).as(0));
    try testing.expect(vec3i32_greaterThanEqual.x == false and vec3i32_greaterThanEqual.y == true and vec3i32_greaterThanEqual.z == true);

    const vec4i32_greaterThanEqual = Vec4(i32).new(-1, 0, 1, 2).greaterThanEqual(Vec4(i32).as(0));
    try testing.expect(vec4i32_greaterThanEqual.x == false and vec4i32_greaterThanEqual.y == true and vec4i32_greaterThanEqual.z == true and vec4i32_greaterThanEqual.w == true);

    const vec1u32_greaterThanEqual = Vec1(u32).new(0).greaterThanEqual(Vec1(u32).as(1));
    try testing.expect(vec1u32_greaterThanEqual.x == false);

    const vec2u32_greaterThanEqual = Vec2(u32).new(0, 1).greaterThanEqual(Vec2(u32).as(1));
    try testing.expect(vec2u32_greaterThanEqual.x == false and vec2u32_greaterThanEqual.y == true);

    const vec3u32_greaterThanEqual = Vec3(u32).new(0, 1, 2).greaterThanEqual(Vec3(u32).as(1));
    try testing.expect(vec3u32_greaterThanEqual.x == false and vec3u32_greaterThanEqual.y == true and vec3u32_greaterThanEqual.z == true);

    const vec4u32_greaterThanEqual = Vec4(u32).new(0, 1, 2, 3).greaterThanEqual(Vec4(u32).as(1));
    try testing.expect(vec4u32_greaterThanEqual.x == false and vec4u32_greaterThanEqual.y == true and vec4u32_greaterThanEqual.z == true and vec4u32_greaterThanEqual.w == true);
}

test "Vec.abs(...)" {
    const vec1f32_abs = Vec1(f32).new(-1).abs();
    try testing.expect(vec1f32_abs.x == 1);

    const vec2f32_abs = Vec2(f32).new(-1, -0.5).abs();
    try testing.expect(vec2f32_abs.x == 1 and vec2f32_abs.y == 0.5);

    const vec3f32_abs = Vec3(f32).new(-1, -0.5, 0).abs();
    try testing.expect(vec3f32_abs.x == 1 and vec3f32_abs.y == 0.5 and vec3f32_abs.z == 0);

    const vec4f32_abs = Vec4(f32).new(-1, -0.5, 0, 0.5).abs();
    try testing.expect(vec4f32_abs.x == 1 and vec4f32_abs.y == 0.5 and vec4f32_abs.z == 0 and vec4f32_abs.w == 0.5);

    const vec1i32_abs = Vec1(i32).new(-2).abs();
    try testing.expect(vec1i32_abs.x == 2);

    const vec2i32_abs = Vec2(i32).new(-2, -1).abs();
    try testing.expect(vec2i32_abs.x == 2 and vec2i32_abs.y == 1);

    const vec3i32_abs = Vec3(i32).new(-2, -1, 0).abs();
    try testing.expect(vec3i32_abs.x == 2 and vec3i32_abs.y == 1 and vec3i32_abs.z == 0);

    const vec4i32_abs = Vec4(i32).new(-2, -1, 0, 1).abs();
    try testing.expect(vec4i32_abs.x == 2 and vec4i32_abs.y == 1 and vec4i32_abs.z == 0 and vec4i32_abs.w == 1);
}

test "Vec.neg(...)" {
    const vec1f32_neg = Vec1(f32).new(-1).neg();
    try testing.expect(vec1f32_neg.x == 1);

    const vec2f32_neg = Vec2(f32).new(-1, -0.5).neg();
    try testing.expect(vec2f32_neg.x == 1 and vec2f32_neg.y == 0.5);

    const vec3f32_neg = Vec3(f32).new(-1, -0.5, 0).neg();
    try testing.expect(vec3f32_neg.x == 1 and vec3f32_neg.y == 0.5 and vec3f32_neg.z == 0);

    const vec4f32_neg = Vec4(f32).new(-1, -0.5, 0, 0.5).neg();
    try testing.expect(vec4f32_neg.x == 1 and vec4f32_neg.y == 0.5 and vec4f32_neg.z == 0 and vec4f32_neg.w == -0.5);

    const vec1i32_neg = Vec1(i32).new(-2).neg();
    try testing.expect(vec1i32_neg.x == 2);

    const vec2i32_neg = Vec2(i32).new(-2, -1).neg();
    try testing.expect(vec2i32_neg.x == 2 and vec2i32_neg.y == 1);

    const vec3i32_neg = Vec3(i32).new(-2, -1, 0).neg();
    try testing.expect(vec3i32_neg.x == 2 and vec3i32_neg.y == 1 and vec3i32_neg.z == 0);

    const vec4i32_neg = Vec4(i32).new(-2, -1, 0, 1).neg();
    try testing.expect(vec4i32_neg.x == 2 and vec4i32_neg.y == 1 and vec4i32_neg.z == 0 and vec4i32_neg.w == -1);
}

test "Vec.reflect(...)" {
    const inc1f32 = Vec1(f32).new(2);
    const norm1f32 = Vec1(f32).new(1);
    const vec1f32_reflect = inc1f32.reflect(norm1f32);
    const vec1f32_cmp = inc1f32.sub(norm1f32.muls(norm1f32.dot(inc1f32) * 2));
    try testing.expect(vec1f32_reflect.x == vec1f32_cmp.x);

    const inc2f32 = Vec2(f32).new(0.3, 0.4);
    const norm2f32 = Vec2(f32).new(0.83, 0.55);
    const vec2f32_reflect = inc2f32.reflect(norm2f32);
    const vec2f32_cmp = inc2f32.sub(norm2f32.muls(norm2f32.dot(inc2f32) * 2));
    try testing.expect(vec2f32_reflect.x == vec2f32_cmp.x and vec2f32_reflect.y == vec2f32_cmp.y);

    const inc3f32 = Vec3(f32).new(3, 2, 6);
    const norm3f32 = Vec3(f32).new(0.5, 0.4, 0.3);
    const vec3f32_reflect = inc3f32.reflect(norm3f32);
    const vec3f32_cmp = inc3f32.sub(norm3f32.muls(norm3f32.dot(inc3f32) * 2));
    try testing.expect(vec3f32_reflect.x == vec3f32_cmp.x and vec3f32_reflect.y == vec3f32_cmp.y and vec3f32_reflect.z == vec3f32_cmp.z);

    const inc4f32 = Vec4(f32).new(3, 2, 6, 8);
    const norm4f32 = Vec4(f32).new(0.18, 0.37, 0.55, 0.73);
    const vec4f32_reflect = inc4f32.reflect(norm4f32);
    const vec4f32_cmp = inc4f32.sub(norm4f32.muls(norm4f32.dot(inc4f32) * 2));
    try testing.expect(vec4f32_reflect.x == vec4f32_cmp.x and vec4f32_reflect.y == vec4f32_cmp.y and vec4f32_reflect.z == vec4f32_cmp.z and vec4f32_reflect.w == vec4f32_cmp.w);

    const inc1i32 = Vec1(i32).new(1);
    const norm1i32 = Vec1(i32).new(1);
    const vec1i32_reflect = inc1i32.reflect(norm1i32);
    const vec1i32_cmp = inc1i32.sub(norm1i32.muls(norm1i32.dot(inc1i32) * 2));
    try testing.expect(vec1i32_reflect.x == vec1i32_cmp.x);

    const inc2i32 = Vec2(i32).new(2, 1);
    const norm2i32 = Vec2(i32).new(1, 0);
    const vec2i32_reflect = inc2i32.reflect(norm2i32);
    const vec2i32_cmp = inc2i32.sub(norm2i32.muls(norm2i32.dot(inc2i32) * 2));
    try testing.expect(vec2i32_reflect.x == vec2i32_cmp.x and vec2i32_reflect.y == vec2i32_cmp.y);

    const inc3i32 = Vec3(i32).new(3, 2, 1);
    const norm3i32 = Vec3(i32).new(1, 0, 0);
    const vec3i32_reflect = inc3i32.reflect(norm3i32);
    const vec3i32_cmp = inc3i32.sub(norm3i32.muls(norm3i32.dot(inc3i32) * 2));
    try testing.expect(vec3i32_reflect.x == vec3i32_cmp.x and vec3i32_reflect.y == vec3i32_cmp.y and vec3i32_reflect.z == vec3i32_cmp.z);

    const inc4i32 = Vec4(i32).new(4, 3, 2, 1);
    const norm4i32 = Vec4(i32).new(1, 0, 0, 0);
    const vec4i32_reflect = inc4i32.reflect(norm4i32);
    const vec4i32_cmp = inc4i32.sub(norm4i32.muls(norm4i32.dot(inc4i32) * 2));
    try testing.expect(vec4i32_reflect.x == vec4i32_cmp.x and vec4i32_reflect.y == vec4i32_cmp.y and vec4i32_reflect.z == vec4i32_cmp.z and vec4i32_reflect.w == vec4i32_cmp.w);
}

test "Vec.faceforward(...)" {
    const ori1f32 = Vec1(f32).new(0.32);
    const inc1f32 = Vec1(f32).new(0.23);
    const ref1f32 = Vec1(f32).new(-1.18);
    const vec1f32_ff = ori1f32.faceforward(inc1f32, ref1f32);
    try testing.expect(vec1f32_ff.x == ori1f32.x);

    const ori2f32 = Vec2(f32).new(0.52, 0.11);
    const inc2f32 = Vec2(f32).new(0.88, 1.83);
    const ref2f32 = Vec2(f32).new(-1.94, 3.14);
    const vec2f32_ff = ori2f32.faceforward(inc2f32, ref2f32);
    try testing.expect(vec2f32_ff.x == -ori2f32.x and vec2f32_ff.y == -ori2f32.y);

    const ori3f32 = Vec3(f32).new(0.52, 0.11, 0.33);
    const inc3f32 = Vec3(f32).new(0.88, 1.83, 1.32);
    const ref3f32 = Vec3(f32).new(-1.94, 3.14, -1.33);
    const vec3f32_ff = ori3f32.faceforward(inc3f32, ref3f32);
    try testing.expect(vec3f32_ff.x == -ori3f32.x and vec3f32_ff.y == -ori3f32.y and vec3f32_ff.z == -ori3f32.z);

    const ori4f32 = Vec4(f32).new(0.52, 0.11, 0.33, 0.11);
    const inc4f32 = Vec4(f32).new(0.88, 1.83, 1.32, -3);
    const ref4f32 = Vec4(f32).new(-1.94, 3.14, -1.33, 1);
    const vec4f32_ff = ori4f32.faceforward(inc4f32, ref4f32);
    try testing.expect(vec4f32_ff.x == ori4f32.x and vec4f32_ff.y == ori4f32.y and vec4f32_ff.z == ori4f32.z and vec4f32_ff.w == ori4f32.w);
}

test "Vec.div(...)" {
    const vec1f32_div = Vec1(f32).new(3).div(Vec1(f32).as(2));
    try testing.expect(vec1f32_div.x == 1.5);

    const vec2f32_div = Vec2(f32).new(3, 5).div(Vec2(f32).as(2));
    try testing.expect(vec2f32_div.x == 1.5 and vec2f32_div.y == 2.5);

    const vec3f32_div = Vec3(f32).new(3, 5, 7).div(Vec3(f32).as(2));
    try testing.expect(vec3f32_div.x == 1.5 and vec3f32_div.y == 2.5 and vec3f32_div.z == 3.5);

    const vec4f32_div = Vec4(f32).new(3, 5, 7, 9).div(Vec4(f32).as(2));
    try testing.expect(vec4f32_div.x == 1.5 and vec4f32_div.y == 2.5 and vec4f32_div.z == 3.5 and vec4f32_div.w == 4.5);
}

test "Vec.divs(...)" {
    const vec1f32_divs = Vec1(f32).new(3).divs(2);
    try testing.expect(vec1f32_divs.x == 1.5);

    const vec2f32_divs = Vec2(f32).new(3, 5).divs(2);
    try testing.expect(vec2f32_divs.x == 1.5 and vec2f32_divs.y == 2.5);

    const vec3f32_divs = Vec3(f32).new(3, 5, 7).divs(2);
    try testing.expect(vec3f32_divs.x == 1.5 and vec3f32_divs.y == 2.5 and vec3f32_divs.z == 3.5);

    const vec4f32_divs = Vec4(f32).new(3, 5, 7, 9).divs(2);
    try testing.expect(vec4f32_divs.x == 1.5 and vec4f32_divs.y == 2.5 and vec4f32_divs.z == 3.5 and vec4f32_divs.w == 4.5);
}

test "Vec.length(...)" {
    const length1 = Vec1(f32).new(1).length();
    try testing.expect(length1 == @sqrt(1.0 * 1.0));

    const length2 = Vec2(f32).new(1, 2).length();
    try testing.expect(length2 == @sqrt(1.0 * 1.0 + 2.0 * 2.0));

    const length3 = Vec3(f32).new(1, 2, 3).length();
    try testing.expect(length3 == @sqrt(1.0 * 1.0 + 2.0 * 2.0 + 3.0 * 3.0));

    const length4 = Vec4(f32).new(1, 2, 3, 4).length();
    try testing.expect(length4 == @sqrt(1.0 * 1.0 + 2.0 * 2.0 + 3.0 * 3.0 + 4.0 * 4.0));
}

test "Vec.distance(...)" {
    const distance1 = Vec1(f32).new(1).distance(Vec1(f32).new(2));
    try testing.expect(distance1 == @sqrt((1.0 - 2.0) * (1.0 - 2.0)));

    const distance2 = Vec2(f32).new(1, 2).distance(Vec2(f32).new(2, 3));
    try testing.expect(distance2 == @sqrt((1.0 - 2.0) * (1.0 - 2.0) + (2.0 - 3.0) * (2.0 - 3.0)));

    const distance3 = Vec3(f32).new(1, 2, 3).distance(Vec3(f32).new(2, 3, 4));
    try testing.expect(distance3 == @sqrt((1.0 - 2.0) * (1.0 - 2.0) + (2.0 - 3.0) * (2.0 - 3.0) + (3.0 - 4.0) * (3.0 - 4.0)));

    const distance4 = Vec4(f32).new(1, 2, 3, 4).distance(Vec4(f32).new(2, 3, 4, 5));
    try testing.expect(distance4 == @sqrt((1.0 - 2.0) * (1.0 - 2.0) + (2.0 - 3.0) * (2.0 - 3.0) + (3.0 - 4.0) * (3.0 - 4.0) + (4.0 - 5.0) * (4.0 - 5.0)));
}

test "Vec.normalize(...)" {
    const vec1f32_norm = Vec1(f32).new(1).normalize();
    try testing.expectApproxEqAbs(@as(f32, 1.0), vec1f32_norm.x, 0.01);

    const vec2f32_norm = Vec2(f32).new(1, 2).normalize();
    try testing.expectApproxEqAbs(@as(f32, 0.447214), vec2f32_norm.x, 0.001);
    try testing.expectApproxEqAbs(@as(f32, 0.894427), vec2f32_norm.y, 0.001);

    const vec3f32_norm = Vec3(f32).new(1, 2, 3).normalize();
    try testing.expectApproxEqAbs(@as(f32, 0.267261), vec3f32_norm.x, 0.001);
    try testing.expectApproxEqAbs(@as(f32, 0.534522), vec3f32_norm.y, 0.001);
    try testing.expectApproxEqAbs(@as(f32, 0.801784), vec3f32_norm.z, 0.001);

    const vec4f32_norm = Vec4(f32).new(1, 2, 3, 4).normalize();
    try testing.expectApproxEqAbs(@as(f32, 0.182574), vec4f32_norm.x, 0.001);
    try testing.expectApproxEqAbs(@as(f32, 0.365148), vec4f32_norm.y, 0.001);
    try testing.expectApproxEqAbs(@as(f32, 0.547723), vec4f32_norm.z, 0.001);
    try testing.expectApproxEqAbs(@as(f32, 0.730297), vec4f32_norm.w, 0.001);

    const vec1f64_norm = Vec1(f64).new(1).normalize();
    try testing.expectApproxEqAbs(@as(f64, 1.0), vec1f64_norm.x, 0.000001);

    const vec2f64_norm = Vec2(f64).new(1, 2).normalize();
    try testing.expectApproxEqAbs(@as(f64, 0.447214), vec2f64_norm.x, 0.000001);
    try testing.expectApproxEqAbs(@as(f64, 0.894427), vec2f64_norm.y, 0.000001);

    const vec3f64_norm = Vec3(f64).new(1, 2, 3).normalize();
    try testing.expectApproxEqAbs(@as(f64, 0.267261), vec3f64_norm.x, 0.000001);
    try testing.expectApproxEqAbs(@as(f64, 0.534522), vec3f64_norm.y, 0.000001);
    try testing.expectApproxEqAbs(@as(f64, 0.801784), vec3f64_norm.z, 0.000001);

    const vec4f64_norm = Vec4(f64).new(1, 2, 3, 4).normalize();
    try testing.expectApproxEqAbs(@as(f64, 0.182574), vec4f64_norm.x, 0.000001);
    try testing.expectApproxEqAbs(@as(f64, 0.365148), vec4f64_norm.y, 0.000001);
    try testing.expectApproxEqAbs(@as(f64, 0.547723), vec4f64_norm.z, 0.000001);
    try testing.expectApproxEqAbs(@as(f64, 0.730297), vec4f64_norm.w, 0.000001);
}

test "Vec.refract(...)" {
    const vec2f32_refract = Vec2(f32).new(0.0, -1.0).refract(Vec2(f32).new(0.0, 1.0), 0.5);
    try testing.expectApproxEqAbs(@as(f32, 0.0), vec2f32_refract.x, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, -1.0), vec2f32_refract.y, std.math.floatEps(f32));
}

test "Vec.floor(...)" {
    const vec1f32_floor = Vec1(f32).new(1.0).floor();
    try testing.expectEqualDeep(Vec1(f32).new(1.0), vec1f32_floor);

    const vec2f32_floor = Vec2(f32).new(1.0, 2.2).floor();
    try testing.expectEqualDeep(Vec2(f32).new(1.0, 2.0), vec2f32_floor);

    const vec3f32_floor = Vec3(f32).new(1.0, 2.3, 3.5).floor();
    try testing.expectEqualDeep(Vec3(f32).new(1.0, 2.0, 3.0), vec3f32_floor);

    const vec4f32_floor = Vec4(f32).new(1.0, 2.3, 3.5, 4.8).floor();
    try testing.expectEqualDeep(Vec4(f32).new(1.0, 2.0, 3.0, 4.0), vec4f32_floor);
}

test "Vec.ceil(...)" {
    const vec1f32_ceil = Vec1(f32).new(1.0).ceil();
    try testing.expectEqualDeep(Vec1(f32).new(1.0), vec1f32_ceil);

    const vec2f32_ceil = Vec2(f32).new(1.0, 2.2).ceil();
    try testing.expectEqualDeep(Vec2(f32).new(1.0, 3.0), vec2f32_ceil);

    const vec3f32_ceil = Vec3(f32).new(1.0, 2.3, 3.5).ceil();
    try testing.expectEqualDeep(Vec3(f32).new(1.0, 3.0, 4.0), vec3f32_ceil);

    const vec4f32_ceil = Vec4(f32).new(1.0, 2.3, 3.5, 4.8).ceil();
    try testing.expectEqualDeep(Vec4(f32).new(1.0, 3.0, 4.0, 5.0), vec4f32_ceil);
}

test "Vec.fract(...)" {
    const vec1f32_fract = Vec1(f32).new(1.0).fract();
    try testing.expectApproxEqAbs(@as(f32, 0.0), vec1f32_fract.x, 0.000001);

    const vec2f32_fract = Vec2(f32).new(1.0, 2.2).fract();
    try testing.expectApproxEqAbs(@as(f32, 0.0), vec2f32_fract.x, 0.000001);
    try testing.expectApproxEqAbs(@as(f32, 0.2), vec2f32_fract.y, 0.000001);

    const vec3f32_fract = Vec3(f32).new(1.0, 2.2, 3.5).fract();
    try testing.expectApproxEqAbs(@as(f32, 0.0), vec3f32_fract.x, 0.000001);
    try testing.expectApproxEqAbs(@as(f32, 0.2), vec3f32_fract.y, 0.000001);
    try testing.expectApproxEqAbs(@as(f32, 0.5), vec3f32_fract.z, 0.000001);

    const vec4f32_fract = Vec4(f32).new(1.0, 2.2, 3.5, 4.8).fract();
    try testing.expectApproxEqAbs(@as(f32, 0.0), vec4f32_fract.x, 0.000001);
    try testing.expectApproxEqAbs(@as(f32, 0.2), vec4f32_fract.y, 0.000001);
    try testing.expectApproxEqAbs(@as(f32, 0.5), vec4f32_fract.z, 0.000001);
    try testing.expectApproxEqAbs(@as(f32, 0.8), vec4f32_fract.w, 0.000001);
}

test "Vec.mix(...)" {
    const vec3f32_mix = Vec3(f32).new(2.0, 4.0, 6.0).mix(Vec3(f32).new(3.0, 6.0, 3.0), Vec3(f32).as(0.2));
    try testing.expectApproxEqAbs(@as(f32, 2.2), vec3f32_mix.x, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, 4.4), vec3f32_mix.y, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, 5.4), vec3f32_mix.z, std.math.floatEps(f32));
}

test "Vec.mixs(...)" {
    const vec3f32_mixs = Vec3(f32).new(2.0, 4.0, 6.0).mixs(Vec3(f32).new(3.0, 6.0, 3.0), 0.2);
    try testing.expectApproxEqAbs(@as(f32, 2.2), vec3f32_mixs.x, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, 4.4), vec3f32_mixs.y, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, 5.4), vec3f32_mixs.z, std.math.floatEps(f32));
}

test "Vec.smoothstep(...)" {
    const vec3f32_ss = Vec2(f32).smoothstep(Vec2(f32).as(0.0), Vec2(f32).as(1.0), Vec2(f32).new(0.5, 0.5));
    try testing.expectApproxEqAbs(@as(f32, 0.5), vec3f32_ss.x, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, 0.5), vec3f32_ss.y, std.math.floatEps(f32));
}

test "Vec.smoothsteps(...)" {
    const vec3f32_ss = Vec2(f32).smoothsteps(0.0, 1.0, Vec2(f32).new(0.5, 0.5));
    try testing.expectApproxEqAbs(@as(f32, 0.5), vec3f32_ss.x, std.math.floatEps(f32));
    try testing.expectApproxEqAbs(@as(f32, 0.5), vec3f32_ss.y, std.math.floatEps(f32));
}

test "Vec.approxEqAbs" {
    const vec1f32_aea = Vec1(f32).new(1.1).approxEqAbs(Vec1(f32).new(1.09), 0.01);
    try testing.expect(vec1f32_aea);

    const vec2f32_aea = Vec2(f32).new(1.1, 2.2).approxEqAbs(Vec2(f32).new(1.09, 2.18), 0.01);
    try testing.expect(!vec2f32_aea);
}

test "Vec.radians" {
    const vec1f32_rad = Vec1(f32).new(180.0).radians();
    try testing.expectApproxEqAbs(@as(f32, std.math.pi), vec1f32_rad.x, std.math.floatEps(f32));
}

test "Vec.degrees" {
    const vec1f32_deg = Vec1(f32).new(std.math.pi).degrees();
    try testing.expectApproxEqAbs(@as(f32, 180.0), vec1f32_deg.x, std.math.floatEps(f32));
}
