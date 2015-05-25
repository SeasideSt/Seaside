I am a Seaside session. A new instance of me gets created when an user accesses an application for the first time and is persistent as long as the user is interacting with it.

This class is intended to be subclasses by applications that need global state, like a user. Custom state can be added by creating instance variables and storing it there. The session can be retrieved by #session if inside a component or task or by evaluating: WACurrentRequestContext session

If the session has not been used for #defaultTimeoutSeconds, it is garbage collected by the system. To manually expire a session call #expire.

A good way to clear all sessions is the following code:

WARegistry clearAllHandlers.
WAPlatform current garbageCollect