#ifndef _MACH_MACH_TYPES_H_
#define _MACH_MACH_TYPES_H_

#include <stdint.h>
#include <mach/port.h>
#include <mach/kern_return.h>

typedef int             integer_t;
typedef int             natural_t;

typedef mach_port_t task_t;
typedef mach_port_t thread_t;
typedef mach_port_t host_t;
typedef mach_port_t vm_map_t;

typedef uint64_t mach_vm_address_t;
typedef uint64_t mach_vm_size_t;
typedef uint64_t vm_address_t;
typedef uint64_t vm_size_t;
typedef int      vm_prot_t;

typedef int cpu_type_t;
typedef int cpu_subtype_t;

typedef mach_port_t *thread_act_array_t;

typedef unsigned int mach_msg_type_number_t;

#endif /* _MACH_MACH_TYPES_H_ */
