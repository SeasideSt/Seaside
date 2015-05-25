accessing
realm
	"Answer the realm to be displayed in the authentication dialog."
	
	^ realm ifNil: [ realm := 'Seaside' ]