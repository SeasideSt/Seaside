This is an abstract implementation of a web-based object inspector. Platforms should implement their own subclasses, specifying behaviour for all unimplemented methods.

Note that #openNativeInspectorOn: on the class-side also needs to be implemented.

Also subclasses probably want to implement #initialize and #unload on the class-side to call 'self select' and 'self unselect' respectively. This will ensure they are registered as the current implementation when they are loaded.