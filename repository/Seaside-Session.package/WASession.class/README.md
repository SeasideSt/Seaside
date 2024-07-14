I am a Seaside session. A new instance of me gets created when an user accesses an application for the first time and is persistent as long as the user is interacting with it.

This class is intended to be subclassed by applications that need global state (e.g. a logged-in user). Custom state can be added by creating instance variables and storing it there. The session can be retrieved by #session if inside a component or task or by evaluating: `WACurrentRequestContext session`

Session expiry is controlled by the `WAHashCache` instance holding on to the `WASession` instances in a `WAApplication` instance. If the session is expired, it is garbage collected by the system. To manually expire a session call #unregister.

A good way to clear all sessions is the following code:

WARegistry clearSessions.
WAPlatform current garbageCollect