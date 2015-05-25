private
isChunked
	^ (self headerAt: 'Transfer-Encoding' ifAbsent: [ nil ]) = 'chunked'