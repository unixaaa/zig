const std = @import("std");
const assert = std.debug.assert;
const io = std.io;
const str = std.str;

enum ET {
    SINT: i32,
    UINT: u32,

    pub fn print(a: &ET, buf: []u8) -> %usize {
        return switch (*a) {
            SINT => |x| { io.bufPrintInt(i32, buf, x) },
            UINT => |x| { io.bufPrintInt(u32, buf, x) },
        }
    }
}

fn enumWithMembers() {
    @setFnTest(this, true);

    const a = ET.SINT { -42 };
    const b = ET.UINT { 42 };
    var buf: [20]u8 = undefined;

    assert(%%a.print(buf) == 3);
    assert(str.eql(buf[0...3], "-42"));

    assert(%%b.print(buf) == 2);
    assert(str.eql(buf[0...2], "42"));
}

