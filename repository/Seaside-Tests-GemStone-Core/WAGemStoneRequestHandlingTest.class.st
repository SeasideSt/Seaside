Class {
	#name : #WAGemStoneRequestHandlingTest,
	#superclass : #WAMutexTest,
	#category : 'Seaside-Tests-GemStone-Core'
}

{ #category : #'testing requests' }
WAGemStoneRequestHandlingTest >> testRetryRequest [
  | numberOfRetries start end actualSeconds |
  numberOfRetries := 0.
  GRPlatform current
    seasideProcessRequest: nil
    adaptor: WATestServerAdaptor new
    resultBlock: [ :result | 
      numberOfRetries := numberOfRetries + 1.
      numberOfRetries = 2
        ifTrue: [ #'foobar' ]
        ifFalse: [ nil ] ].
  self assert: numberOfRetries = 2.
  numberOfRetries := 0.
  start := DateAndTime now.
  GRPlatform current
    seasideProcessRequest: nil
    adaptor: WATestServerAdaptor new
    resultBlock: [ :result | 
      numberOfRetries := numberOfRetries + 1.
      nil ].
  end := DateAndTime now.
  self assert: numberOfRetries = GRPlatform current retryDelays size.
  actualSeconds := (end - start) asSeconds * 1000 * 1.1.	"fudge the actual seconds a bit to avoid random failures"
  self
    assert:
      actualSeconds
        >= (GRPlatform current retryDelays inject: 0 into: [ :t :i | t + i ])
]
