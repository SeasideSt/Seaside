Class {
	#name : 'WAWebSocketTurboStreamPusherOutsideOfRequest',
	#superclass : 'WAWebSocketTurboStreamPusher',
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'private' }
WAWebSocketTurboStreamPusherOutsideOfRequest >> codec [

	^ GRCodec forEncoding: 'utf8' 
]

{ #category : 'private' }
WAWebSocketTurboStreamPusherOutsideOfRequest >> scriptGeneratorClass [ 

	^ WADefaultScriptGenerator
]

{ #category : 'private' }
WAWebSocketTurboStreamPusherOutsideOfRequest >> withRenderingDynamicVariables: aBlock [

	| context |
	context := WARequestContext request: nil response: nil codec: self codec.
	WACurrentRequestContext
		use: context
		during: aBlock
]
