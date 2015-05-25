tests
testUrlGreaseNextPutAllStartingAt
	self assert: 'ab' next: 1 startingAt: 1 encoder: self urlEncoderClass gives:  'a'.
	self assert: 'a b' next: 1 startingAt: 1 encoder: self urlEncoderClass gives:  'a'.
	self assert: 'a b' next: 2 startingAt: 1 encoder: self urlEncoderClass gives:  'a%20'.
	self assert: 'a b' next: 1 startingAt: 2 encoder: self urlEncoderClass gives:  '%20'.
	self assert: 'a b' next: 2 startingAt: 2 encoder: self urlEncoderClass gives:  '%20b'.
	self assert: 'a  ' next: 2 startingAt: 2 encoder: self urlEncoderClass gives:  '%20%20'.
	self assert: 'ab b ' next: 3 startingAt: 2 encoder: self urlEncoderClass gives:  'b%20b'