#ifndef _MACH_MACH_H_
#define _MACH_MACH_H_

#include <mach/mach_types.h>
#include <mach/message.h>
#include <mach/mach_init.h>
#include <mach/mach_vm.h>

kern_return_t mach_port_allocate(mach_port_t task, mach_port_right_t right, mach_port_name_t *name);
kern_return_t mach_port_insert_right(mach_port_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t right);
kern_return_t mach_port_deallocate(mach_port_t task, mach_port_name_t name);
kern_return_t mach_ports_lookup(mach_port_t task, mach_port_t **names, mach_msg_type_number_t *nameCnt);
kern_return_t mach_ports_register(mach_port_t task, mach_port_array_t names, mach_msg_type_number_t nameCnt);
kern_return_t task_for_pid(mach_port_t target_tport, int pid, mach_port_name_t *task);

#endif /* _MACH_MACH_H_ */
