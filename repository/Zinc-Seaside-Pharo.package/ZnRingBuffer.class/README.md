I am an implementation of a ring buffer, i.e. a buffer where the start index can be moved along a virtual ring.

I buffer a fixed amount of data and provide array like access to it.

Users use me mostly like an array. My only interesting method is #moveStartTo:, which moves the start index of the
buffer to the specified position. Example:

buffer
	at: 1 put: 1;
	at: 2 put: 2;
	at: 1. "----> 1"
	
buffer
	moveStartTo: 2;
	at: 1 "----> 2"