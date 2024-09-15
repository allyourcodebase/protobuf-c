const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("protobuf_c", .{});

    const lib = b.addStaticLibrary(.{
        .name = "protobuf_c",
        .target = target,
        .optimize = optimize,
    });

    lib.linkLibC();

    lib.addCSourceFiles(.{
        .root = upstream.path("protobuf-c"),
        .files = &.{"protobuf-c.c"},
        .flags = &.{},
    });

    lib.installHeader(
        upstream.path("protobuf-c/protobuf-c.h"),
        b.pathJoin(&.{ "protobuf-c", "protobuf-c.h" }),
    );

    b.installArtifact(lib);
}
