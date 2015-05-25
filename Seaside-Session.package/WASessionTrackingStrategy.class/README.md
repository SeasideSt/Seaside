I am the abstract base class for tracking strategies that track sessions differently from other request handlers (mostly WADocumentHandlers).

Concrete implementsions have to take care that expired document handlers don't expire sessions.