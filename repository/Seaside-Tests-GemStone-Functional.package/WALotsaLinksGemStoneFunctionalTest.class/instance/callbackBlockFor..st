private
callbackBlockFor: each

	^[ self 
			inform: each
			onAnswer: [ :v | self session jumpToAnchor: each greaseString ] ]