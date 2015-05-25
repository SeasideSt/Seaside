I am the default development error handler that displays the stack frames and adds the option to display a debugger.

I delegate the rendering to WAWalkback.

This handler uses Components and depends on having a valid Session. If an error occurs outside of the Session scope it will simply use the superclass behaviour, which should be to open a debugger.