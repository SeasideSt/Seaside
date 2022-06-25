as yet unclassified
process: aNativeRequest
  aNativeRequest isSafeToStream
    ifTrue: [ ^ self processStreamingRequest: aNativeRequest ]
    ifFalse: [ 
      ^ GRPlatform current
        seasideProcessRequest: aNativeRequest
        adaptor: self
        resultBlock: [ :aRequest | self processBufferedRequest: aRequest ] ]