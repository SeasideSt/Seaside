The session cookie protection filter ensures that the wrapped request handler only accepts requests from the same browser session. This filter is specifically useful to protect session hijacking when using the (default) query field session tracking strategy.

Because WAQueryFieldHandlerTrackingStrategy puts the Seaside session key in the url, a session can be easily hijacked by copying the url. This request filter prevents this by requiring a browser session cookie associated to the Seaside session. As a result, a copied Seaside url can only be used in the same browser session.

The use of this filter, in combination with WAQueryFieldHandlerTrackingStrategy, keeps the ability for a user to open multiple sessions of the same Seaside application in a single browser, while removing easy session hijacking. A malicious user that wants to hijack the session now needs both the url and the cookie.

The appropriate use of this filter is to add it to the session in the `initializeFilters` method of your session class. Only in this way, the session is protected from the first rendered application page onwards. See WASessionCookieProtectedSession class as an example.