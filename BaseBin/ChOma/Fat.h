#ifndef MACHO_H
#define MACHO_H

#include <stdio.h>

#ifdef __APPLE__
#include <libkern/OSByteOrder.h>
#else
#include <endian.h>
#include <byteswap.h>

#define OSSwapInt16(x) __builtin_bswap16(x)
#define OSSwapInt32(x) __builtin_bswap32(x)
#define OSSwapInt64(x) __builtin_bswap64(x)

#if __BYTE_ORDER == __LITTLE_ENDIAN
#define OSSwapHostToBigInt16(x) OSSwapInt16(x)
#define OSSwapHostToBigInt32(x) OSSwapInt32(x)
#define OSSwapHostToBigInt64(x) OSSwapInt64(x)
#define OSSwapBigToHostInt16(x) OSSwapInt16(x)
#define OSSwapBigToHostInt32(x) OSSwapInt32(x)
#define OSSwapBigToHostInt64(x) OSSwapInt64(x)
#define OSSwapHostToLittleInt16(x) (x)
#define OSSwapHostToLittleInt32(x) (x)
#define OSSwapHostToLittleInt64(x) (x)
#define OSSwapLittleToHostInt16(x) (x)
#define OSSwapLittleToHostInt32(x) (x)
#define OSSwapLittleToHostInt64(x) (x)
#else
#define OSSwapHostToBigInt16(x) (x)
#define OSSwapHostToBigInt32(x) (x)
#define OSSwapHostToBigInt64(x) (x)
#define OSSwapBigToHostInt16(x) (x)
#define OSSwapBigToHostInt32(x) (x)
#define OSSwapBigToHostInt64(x) (x)
#define OSSwapHostToLittleInt16(x) OSSwapInt16(x)
#define OSSwapHostToLittleInt32(x) OSSwapInt32(x)
#define OSSwapHostToLittleInt64(x) OSSwapInt64(x)
#define OSSwapLittleToHostInt16(x) OSSwapInt16(x)
#define OSSwapLittleToHostInt32(x) OSSwapInt32(x)
#define OSSwapLittleToHostInt64(x) OSSwapInt64(x)
#endif

#endif

#include <mach/mach.h>
#include <mach-o/loader.h>
#include <mach-o/fat.h>
#include <sys/stat.h>

#include "MemoryStream.h"
typedef struct MachO MachO;
typedef struct DyldSharedCache DyldSharedCache;
typedef struct DyldSharedCacheImage DyldSharedCacheImage;

// A Fat structure can either represent a fat file with multiple slices, in which the slices will be loaded into the slices attribute
// Or a single slice MachO, in which case it serves as a compatibility layer and the single slice will also be loaded into the slices attribute
typedef struct Fat
{
    MemoryStream *stream;
    MachO **slices;
    uint32_t slicesCount;
    int fileDescriptor;
} Fat;

int fat_read_at_offset(Fat *fat, uint64_t offset, size_t size, void *outBuf);

MemoryStream *fat_get_stream(Fat *fat);

// Initialise a Fat structure from a memory stream
Fat *fat_init_from_memory_stream(MemoryStream *stream);

// Initialise a FAT structure from a memory stream of something that is inside a dyld shared cache
Fat *fat_dsc_init_from_memory_stream(MemoryStream *stream, DyldSharedCache *containingCache, DyldSharedCacheImage *cacheImage);

// Initialise a FAT structure using the path to the file
Fat *fat_init_from_path(const char *filePath);

// Find macho with cputype and cpusubtype in Fat, returns NULL if not found
MachO *fat_find_slice(Fat *fat, cpu_type_t cputype, cpu_subtype_t cpusubtype);

// Enumerate all slices contained in Fat
void fat_enumerate_slices(Fat *fat, void (^enumBlock)(MachO *macho, bool *stop));

// If Fat only has a single slice, return it
MachO *fat_get_single_slice(Fat *fat);

// Create a Fat structure from an array of MachO structures
Fat *fat_create_for_macho_array(char *firstInputPath, MachO **machoArray, int machoArrayCount);

// Add a MachO to the Fat structure
int fat_add_macho(Fat *fat, MachO *macho);

// Free all elements of the Fat structure
void fat_free(Fat *fat);

#endif // MACHO_H