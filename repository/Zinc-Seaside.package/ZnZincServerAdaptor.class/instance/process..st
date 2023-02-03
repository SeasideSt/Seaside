processing
process: aZnRequest
  ^ aZnRequest isSafeToStream
    ifTrue: [ self processStreamingRequest: aZnRequest ]
    ifFalse: [ self processBufferedRequest: aZnRequest ]