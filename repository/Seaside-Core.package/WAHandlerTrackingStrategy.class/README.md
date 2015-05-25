I am a strategy of how reqeust handlers should be tracked by a WARegistry or subclass.

One important thing to remember a WARegistry can contain all kinds of request handlers. The most common case is a WAApplication that contains both WADocumentHandlers and WASessions. Some tracking methods may not be appropriate for some kinds of handlers (eg. a WADocumentHandler should never be tracked using a cookie). Some requests may have multiple keys (eg. a query field for a WADocumentHandler and a cookie for a WASession). It's the job of the strategy to take this into consideration.

The 'public' protocol contains the methods that a tracking strategy must implement. The 'private' protocol contains some utility methods that may be helpful implementing these methods.