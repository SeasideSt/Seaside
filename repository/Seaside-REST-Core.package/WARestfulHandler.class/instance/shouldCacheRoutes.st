private
shouldCacheRoutes
	"Answer a boolean if the routes should be cached by the receiver.
	Subclasses are supposed to override this method in such a way that routes are cached in production. This way the overhead of recreating the routes on every request is avoided. Recreating the routes may involve decompilation or parsing to get the method parameter names which may not be thread-safe.
	For development recreating the routes on every request makes for a better development experience as changes are immediately visible."

	^ false