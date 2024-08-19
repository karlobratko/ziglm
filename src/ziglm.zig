pub const concept = struct {
    pub usingnamespace @import("common/concept.zig");
    pub usingnamespace @import("types/vec/concept.zig");
    pub usingnamespace @import("types/mat/concept.zig");
};

pub const common = @import("common/functions/common.zig");
pub const exponential = @import("common/functions/exponential.zig");
pub const geometric = @import("common/functions/geometric.zig");
pub const trigonometric = @import("common/functions/trigonometric.zig");

pub usingnamespace @import("types/vec/vec.zig");
pub usingnamespace @import("types/mat/mat.zig");
