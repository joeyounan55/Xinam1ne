#include "FileStream.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>

int memory_stream_copy_data(MemoryStream *originStream, uint64_t originOffset,
                            MemoryStream *targetStream, uint64_t targetOffset,
                            size_t size) {
    return -1;
}

int main() {
    FILE *tmp = tmpfile();
    if (!tmp) return 1;
    int fd = fileno(tmp);

    MemoryStream *stream = file_stream_init_from_file_descriptor(fd, 0, FILE_STREAM_SIZE_AUTO,
        FILE_STREAM_FLAG_WRITABLE | FILE_STREAM_FLAG_AUTO_EXPAND);
    if (!stream) return 1;

    const char data[] = { 'A', 'B', 'C', 'D' };
    int wr = stream->write(stream, 8, sizeof(data), data);
    assert(wr == sizeof(data));

    size_t size = 0;
    stream->getSize(stream, &size);
    assert(size == 12);

    lseek(fd, 0, SEEK_SET);
    char buf[12];
    memset(buf, 0, sizeof(buf));
    read(fd, buf, sizeof(buf));

    for (int i = 0; i < 8; i++) {
        assert(buf[i] == 0);
    }
    assert(memcmp(buf + 8, data, sizeof(data)) == 0);

    stream->free(stream);
    fclose(tmp);
    return 0;
}
