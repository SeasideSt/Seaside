An abstract component that renders an exception stack with temporary variables. Platforms should implement a concrete subclass and register that subclass when it is loaded.

By default this class renders only the top few stack frames, but offers the option to render all. It also offers the option to open a debugger in the image or to proceed with the execution and answers true and false, respectively.

