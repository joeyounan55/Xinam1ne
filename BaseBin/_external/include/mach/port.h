#ifndef _MACH_PORT_H_
#define _MACH_PORT_H_

#include <stdint.h>
#include <mach/kern_return.h>
#include <mach/boolean.h>

typedef uint32_t mach_port_t;
typedef mach_port_t mach_port_name_t;
typedef mach_port_t *mach_port_array_t;
typedef int mach_port_right_t;

typedef int mach_msg_type_name_t;

#define MACH_PORT_NULL 0
#define MACH_PORT_DEAD ((mach_port_t)~0)

#define MACH_PORT_RIGHT_SEND          ((mach_port_right_t)1)
#define MACH_PORT_RIGHT_RECEIVE       ((mach_port_right_t)2)
#define MACH_PORT_RIGHT_SEND_ONCE     ((mach_port_right_t)3)
#define MACH_PORT_RIGHT_PORT_SET      ((mach_port_right_t)4)
#define MACH_PORT_RIGHT_DEAD_NAME     ((mach_port_right_t)5)

#endif /* _MACH_PORT_H_ */
