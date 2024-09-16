# `protobuf-c` Runtime

This is the [protobuf-c runtime](https://github.com/protobuf-c/protobuf-c/tree/master/protobuf-c), packaged for [Zig](https://ziglang.org/).

## Status

This project only builds the `protobuf-c` runtime library. It does not build `protoc-c`, the corresponding protocol buffers C language code generator.

The runtime library depends only on a small amount of functionality from libc, so it should compile for most targets. Linux, macOS and Windows are tested by CI.

## Usage

First, update your `build.zig.zon`:

```sh
# Initialize a `zig build` project if you haven't already
zig init
# replace <refname> with the version you want to use, e.g. 1.5.0
zig fetch --save git+https://github.com/allyourcodebase/protobuf-c#<refname>
```

You can then use `protobuf_c` in your `build.zig` with:

```zig
const protobuf_c_dep = b.dependency("protobuf_c", .{
    .target = target,
    .optimize = optimize,
});
your_exe.linkLibrary(protobuf_c_dep.artifact("protobuf_c"));
```

## Version Support Matrix

|  Refname | protobuf-c Version | Zig `0.12.x` | Zig `0.13.x` | Zig `0.14.0-dev` |
|----------|--------------------|--------------|--------------|------------------|
| `1.5.0`  | `1.5.0`            | ✅           | ✅          | ✅              |
