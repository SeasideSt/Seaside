initialization
createCache
	"To configure the continuation cache you must currently subclass WASession and
	override this method."
	^ WACache new
		setExpiryPolicy: (WARcLastAccessExpiryPolicy new);
		yourself