#if os(Linux)
// Minimal Mach-O type and constant definitions to allow building on non-Darwin
// platforms where the `MachO` and `Darwin` modules are unavailable.

public let MH_MAGIC_64: UInt32 = 0xfeedfacf
public let LC_BUILD_VERSION: UInt32 = 0x32
public let LC_MAIN: UInt32 = 0x80000028
public let PLATFORM_DRIVERKIT: UInt32 = 0x6

public struct mach_header_64 {
    public var magic: UInt32
    public var cputype: Int32
    public var cpusubtype: Int32
    public var filetype: UInt32
    public var ncmds: UInt32
    public var sizeofcmds: UInt32
    public var flags: UInt32
    public var reserved: UInt32
}

public struct load_command {
    public var cmd: UInt32
    public var cmdsize: UInt32
}

public struct build_version_command {
    public var cmd: UInt32
    public var cmdsize: UInt32
    public var platform: UInt32
    public var minos: UInt32
    public var sdk: UInt32
    public var ntools: UInt32
}

public struct entry_point_command {
    public var cmd: UInt32
    public var cmdsize: UInt32
    public var entryoff: UInt64
    public var stacksize: UInt64
}
#endif

