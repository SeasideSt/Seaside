"
I convert requests and responses between Zinc and Seaside, but I do it using Seaside's WAComboResponse in order to allow data to be streamed to the client directly.
"
Class {
	#name : #ZnZincStreamingServerAdaptor,
	#superclass : #ZnZincServerAdaptor,
	#category : 'Zinc-Seaside'
}

{ #category : #processing }
ZnZincStreamingServerAdaptor >> process: aZnRequest [
	^ ZnDeferredResponse
		onWrite: [ :stream | 
			| request |
			request := ZnSeasideRequest 
				nativeRequest: aZnRequest
				stream: stream.
			super process: request ]
]

{ #category : #converting }
ZnZincStreamingServerAdaptor >> requestFor: aZnSeasideRequest [
	^super requestFor: aZnSeasideRequest nativeRequest
]

{ #category : #converting }
ZnZincStreamingServerAdaptor >> responseFor: aZnRequest [
	| bufferedStream codecStream |
	bufferedStream := GRPlatform current writeCharacterStreamOn: (String new: 4096).
	codecStream := self codec encoderFor: bufferedStream. 
	^ WAComboResponse
		onBuffered: (GRCountingStream on: codecStream)
		external: aZnRequest stream
]

{ #category : #converting }
ZnZincStreamingServerAdaptor >> responseFrom: aRequestContext [
	"Since the response knows how to write itself on the stream (and may already be partly written),
	there's not much left to do."
	
	aRequestContext response
		flush;
		close
]
