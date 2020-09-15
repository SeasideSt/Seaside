evaluating
value: anObject
  | marker frameIndex |
  marker := self markerBlock value.
  marker isNil
    ifTrue: [ 
      marker := (GsProcess _frameContentsAt: 2) at: 1.
      frameIndex := 2 ]
    ifFalse: [ frameIndex := self class findFrameIndexFor: marker ].	"We not only pass through the result value when restoring the continuation, but also the current process environment as a workaround to restore the environment once the partial continuation is restored. This is needed to keep GRDynamicVariable working."
  ^ GsProcess
    installPartialContinuation: partial
    atLevel: frameIndex
    value:
      (WAGemStoneProcessEnvironmentWrapper
        withEnvironment: Processor activeProcess environment
        value: anObject)