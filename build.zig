const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("protobuf_c", .{});

    const lib = b.addLibrary(.{
        .name = "protobuf_c",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });

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
