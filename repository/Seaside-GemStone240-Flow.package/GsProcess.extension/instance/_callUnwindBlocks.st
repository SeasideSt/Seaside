*seaside-gemstone240-flow
_callUnwindBlocks
  "Private.  Evaluate each of the unwind blocks (see ensure: and ifCurtailed:)."

  | unwindBlocks |
  unwindBlocks := Array new.
  self stackDepth ~~ nil
    ifTrue: [ 1 to: self stackDepth do: [ :j | self _addUnwindBlockAt: j to: unwindBlocks ] ].
  unwindBlocks
    do: [ :each | 
      [ each value ]
        on: Error
        do: [ :ex | 
          "ignored"
           ] ]