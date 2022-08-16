*Seaside-WebSocket-Core
isWebSocketSetupRequest
	"Return true when request can be considered a valid WebSocket setup request"
	
	^ self method = #GET
			and: [ (self headers at: 'upgrade' ifAbsent: [ ^ false ]) asLowercase = 'websocket' 
				and: [ (self headers at: 'connection' ifAbsent: [ ^ false ]) asLowercase = 'upgrade' 
					and: [ (self headers at: 'sec-websocket-version' ifAbsent: [ ^ false ]) = '13'
						and: [ self headers includesKey: 'sec-websocket-key' ] ] ] ]