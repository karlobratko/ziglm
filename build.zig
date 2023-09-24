const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "zlm",
        .root_source_file = .{ .path = "src/zlm.zig" },
        .target = target,
        .optimize = optimize,
        .version = std.SemanticVersion{ .major = 1, .minor = 0, .patch = 0 },
        .single_threaded = true,
    });

    b.installArtifact(lib);

    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/zlm.zig" },
        .target = target,
        .optimize = optimize,
    });
    const run_main_tests = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);
}
