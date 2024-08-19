const std = @import("std");
const glm = @import("ziglm");
const testing = std.testing;
const concept = glm.concept;

test "isSignedIntegral(...)" {
    try testing.expect(concept.isSignedIntegral(i32) == true);
    try testing.expect(concept.isSignedIntegral(u32) == false);
    try testing.expect(concept.isSignedIntegral(f32) == false);
    try testing.expect(concept.isSignedIntegral(bool) == false);
}

test "isUnsignedIntegral(...)" {
    try testing.expect(concept.isUnsignedIntegral(i32) == false);
    try testing.expect(concept.isUnsignedIntegral(u32) == true);
    try testing.expect(concept.isUnsignedIntegral(f32) == false);
    try testing.expect(concept.isUnsignedIntegral(bool) == false);
}

test "isFloatingPoint(...)" {
    try testing.expect(concept.isFloatingPoint(i32) == false);
    try testing.expect(concept.isFloatingPoint(u32) == false);
    try testing.expect(concept.isFloatingPoint(f32) == true);
    try testing.expect(concept.isFloatingPoint(bool) == false);
}

test "isFloatingPoint32(...)" {
    try testing.expect(concept.isFloatingPoint32(i32) == false);
    try testing.expect(concept.isFloatingPoint32(u32) == false);
    try testing.expect(concept.isFloatingPoint32(f32) == true);
    try testing.expect(concept.isFloatingPoint32(f64) == false);
    try testing.expect(concept.isFloatingPoint32(bool) == false);
}

test "isSignedNumeric(...)" {
    try testing.expect(concept.isSignedNumeric(i32) == true);
    try testing.expect(concept.isSignedNumeric(u32) == false);
    try testing.expect(concept.isSignedNumeric(f32) == true);
    try testing.expect(concept.isSignedNumeric(bool) == false);
}

test "isBoolean(...)" {
    try testing.expect(concept.isBoolean(i32) == false);
    try testing.expect(concept.isBoolean(u32) == false);
    try testing.expect(concept.isBoolean(f32) == false);
    try testing.expect(concept.isBoolean(bool) == true);
}

test "isArithmetic(...)" {
    try testing.expect(concept.isArithmetic(i32) == true);
    try testing.expect(concept.isArithmetic(u32) == true);
    try testing.expect(concept.isArithmetic(f32) == true);
    try testing.expect(concept.isArithmetic(bool) == true);
}

test "isVec(...)" {
    try testing.expect(concept.isVec(f32) == false);
    try testing.expect(concept.isVec(i32) == false);

    try testing.expect(concept.isVec(glm.Vec1(f32)) == true);
    try testing.expect(concept.isVec(glm.Vec2(f32)) == true);
    try testing.expect(concept.isVec(glm.Vec3(f32)) == true);
    try testing.expect(concept.isVec(glm.Vec4(f32)) == true);

    try testing.expect(concept.isVec(glm.Mat2(f32)) == false);
    try testing.expect(concept.isVec(glm.Mat3(f32)) == false);
    try testing.expect(concept.isVec(glm.Mat4(f32)) == false);
}

test "isMat(...)" {
    try testing.expect(concept.isMat(f32) == false);
    try testing.expect(concept.isMat(i32) == false);

    try testing.expect(concept.isMat(glm.Vec1(f32)) == false);
    try testing.expect(concept.isMat(glm.Vec2(f32)) == false);
    try testing.expect(concept.isMat(glm.Vec3(f32)) == false);
    try testing.expect(concept.isMat(glm.Vec4(f32)) == false);

    try testing.expect(concept.isMat(glm.Mat2(f32)) == true);
    try testing.expect(concept.isMat(glm.Mat3(f32)) == true);
    try testing.expect(concept.isMat(glm.Mat4(f32)) == true);
}