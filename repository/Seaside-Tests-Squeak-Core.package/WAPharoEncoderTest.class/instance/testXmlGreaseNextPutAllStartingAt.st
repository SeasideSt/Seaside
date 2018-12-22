tests
testXmlGreaseNextPutAllStartingAt
	self assert: 'ab' next: 1 startingAt: 1 encoder: self xmlEncoderClass gives:  'a'.
	self assert: 'a<b' next: 1 startingAt: 1 encoder: self xmlEncoderClass gives:  'a'.
	self assert: 'a<b' next: 2 startingAt: 1 encoder: self xmlEncoderClass gives:  'a&lt;'.
	self assert: 'a<b' next: 1 startingAt: 2 encoder: self xmlEncoderClass gives:  '&lt;'.
	self assert: 'a<b' next: 2 startingAt: 2 encoder: self xmlEncoderClass gives:  '&lt;b'.
	self assert: 'a<<b' next: 2 startingAt: 2 encoder: self xmlEncoderClass gives:  '&lt;&lt;'.
	self assert: 'ab<b<' next: 3 startingAt: 2 encoder: self xmlEncoderClass gives:  'b&lt;b'