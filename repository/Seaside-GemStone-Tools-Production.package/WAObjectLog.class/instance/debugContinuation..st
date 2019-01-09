actions
debugContinuation: aLogEntry
  | continuation |
  (aLogEntry isKindOf: DebuggerLogEntry)
    ifTrue: [ 
      continuation := aLogEntry continuation.
      continuation
        ifNotNil: [ 
          ((continuation isKindOf: GsProcess) and: [ continuation isContinuation ])
            ifTrue: [ 
              | comp exception |
              comp := WAGemStoneContinuationDebugger new.
              comp initializeWithContinuation: continuation.	"exception :=  (continuation convertToPortableStack _frameContentsAt: 1) at: 11."
              self session presenter call: comp ] ] ]