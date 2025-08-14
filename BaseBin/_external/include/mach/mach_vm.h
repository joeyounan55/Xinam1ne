#ifndef _MACH_MACH_VM_H_
#define _MACH_MACH_VM_H_

#include <mach/mach_types.h>
#include <mach/vm_prot.h>
#include <mach/boolean.h>

typedef mach_port_t vm_map_t;

typedef kern_return_t (*mach_vm_allocate_fn)(vm_map_t, mach_vm_address_t *, mach_vm_size_t, int);

enum {
    VM_FLAGS_ANYWHERE    = 0x0001,
    VM_FLAGS_PURGABLE    = 0x0002,
    VM_FLAGS_RANDOM_ADDR = 0x0008
};

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags);
kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size);
kern_return_t mach_vm_protect(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size, boolean_t set_max, vm_prot_t new_prot);
kern_return_t vm_protect(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size, boolean_t set_max, vm_prot_t new_prot);
kern_return_t vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags);

#endif /* _MACH_MACH_VM_H_ */
