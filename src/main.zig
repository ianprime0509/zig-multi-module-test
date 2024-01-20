const mod1 = @import("mod1");
const mod2 = @import("mod2");

pub fn main() void {
    _ = mod1.print("Hello from mod1\n");
    _ = mod2.print("Hello from mod2\n");
}
