#ifndef _MACH_MESSAGE_H_
#define _MACH_MESSAGE_H_

#include <stdint.h>
#include <mach/port.h>

typedef uint32_t mach_msg_bits_t;
typedef uint32_t mach_msg_size_t;
typedef int32_t mach_msg_id_t;
typedef int mach_msg_return_t;
typedef unsigned int mach_msg_type_number_t;

typedef struct {
    mach_msg_bits_t msgh_bits;
    mach_msg_size_t msgh_size;
    mach_port_t msgh_remote_port;
    mach_port_t msgh_local_port;
    mach_msg_size_t msgh_reserved;
    mach_msg_id_t msgh_id;
} mach_msg_header_t;

#define MACH_MSG_TYPE_MAKE_SEND 20

#endif /* _MACH_MESSAGE_H_ */
