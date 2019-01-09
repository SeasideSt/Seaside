initialization
continuation: aContinuation level: anInteger
  continuation := aContinuation.
  level := anInteger.	"these instance variables are populated for the WAWalkback use"
  method := (continuation _frameContentsAt: level) at: 1.
  source := method sourceString.
  receiver := (continuation _frameContentsAt: level) at: 10.
  mySelf := (continuation _frameContentsAt: level) at: 8