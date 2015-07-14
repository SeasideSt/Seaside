as yet unclassified
start
  "blocks main thread, does not return"

  self gemServerStart.
  [ true ] whileTrue: [ (Delay forSeconds: 10) wait ]