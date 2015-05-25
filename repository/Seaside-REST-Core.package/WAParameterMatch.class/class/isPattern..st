private
isPattern: aString
	^ aString isEmpty not
		and: [ aString first = ${
		and: [ aString last = $} ] ]