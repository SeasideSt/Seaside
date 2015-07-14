accessing
sender

continuation stackDepth == level ifTrue: [^nil].
^self class fromContinuation: continuation atLevel: level + 1