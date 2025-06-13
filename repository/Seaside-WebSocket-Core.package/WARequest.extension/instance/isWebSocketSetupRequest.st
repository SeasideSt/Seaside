*Seaside-WebSocket-Core
isWebSocketSetupRequest
	"Return true when request can be considered a valid WebSocket setup request"
	
	^ self isGet
			and: [ (self headerAt: 'upgrade' ifAbsent: [ ^ false ]) asLowercase = 'websocket' 
				and: [ (self headerAt: 'connection' ifAbsent: [ ^ false ]) asLowercase = 'upgrade' 
					and: [ (self headerAt: 'sec-websocket-version' ifAbsent: [ ^ false ]) = '13'
						and: [ self headers includesKey: 'sec-websocket-key' ] ] ] ]