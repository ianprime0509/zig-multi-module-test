const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "exe",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = b.host,
    });
    b.installArtifact(exe);

    const mod1 = b.createModule(.{
        .root_source_file = .{ .path = "src/mod1.zig" },
        .target = b.host,
    });
    mod1.link_libc = true;
    mod1.linkSystemLibrary("glib-2.0", .{});
    exe.root_module.addImport("mod1", mod1);

    const mod2 = b.createModule(.{
        .root_source_file = .{ .path = "src/mod2.zig" },
        .target = b.host,
    });
    mod2.link_libc = true;
    mod2.linkSystemLibrary("glib-2.0", .{});
    exe.root_module.addImport("mod2", mod2);
}
