#ifndef _MACH_MACH_INIT_H_
#define _MACH_MACH_INIT_H_

#include <mach/port.h>

mach_port_t mach_task_self(void);
mach_port_t mach_host_self(void);
mach_port_t mach_thread_self(void);

#endif /* _MACH_MACH_INIT_H_ */
