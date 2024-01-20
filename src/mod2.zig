const c = @cImport(@cInclude("glib/gprintf.h"));

pub const print = c.g_printf;
