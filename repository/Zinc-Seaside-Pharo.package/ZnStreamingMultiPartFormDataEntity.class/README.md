I implement chunked reading of multipart/form-data requests. I use a ZnRingBuffer to reduce the number of operations and the amount of memory consumed during this.

I handle file parts by writing them to temporary files on disk in chunks, thus preventing the image from exhausting memory resources.