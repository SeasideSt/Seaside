A WAEmailErrorHandler is an error handler that sends out email messages with the stack strace. 

This class can be used as is by sending the class-side message #configureHandlerFrom:to:mailhost: to configure the from, to and mailhost to be used.

If you want to create a custom email handler, then subclass this class and override the #to, #from, and #handleDefault  messages.