private
isSeasideField: aString
	^ aString notEmpty
		and: [ aString first = $_
		or: [ aString allSatisfy: [ :each | each isDigit ] ] ]