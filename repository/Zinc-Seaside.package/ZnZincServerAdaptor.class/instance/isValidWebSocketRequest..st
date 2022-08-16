private
isValidWebSocketRequest: request
	"Return true when request can be considered a valid WebSocket setup request"

	^ request method = #GET
			and: [ (request headers at: 'Upgrade' ifAbsent: [ ^ false ]) asLowercase = 'websocket' 
				and: [ (ZnWebSocketUtils containsConnectionUpgrade: request headers) 
					and: [ (request headers at: 'Sec-WebSocket-Version' ifAbsent: [ ^ false ]) = '13'
						and: [ request headers includesKey: 'Sec-WebSocket-Key' ] ] ] ]