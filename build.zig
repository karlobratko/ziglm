const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "ziglm",
        .root_source_file = .{ .path = "src/ziglm.zig" },
        .target = target,
        .optimize = optimize,
        .version = std.SemanticVersion{ .major = 1, .minor = 0, .patch = 0 },
        .single_threaded = true,
    });

    b.installArtifact(lib);

    const ziglm = b.addModule("ziglm", .{ .source_file = .{ .path = "src/ziglm.zig" } });

    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "test/tests.zig" },
        .target = target,
        .optimize = optimize,
    });
    main_tests.addModule("ziglm", ziglm);
    const run_main_tests = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);
}
