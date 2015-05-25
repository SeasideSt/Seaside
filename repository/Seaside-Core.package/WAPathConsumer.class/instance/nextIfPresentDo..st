accessing
nextIfPresentDo: aOneArgumentBlock
	"Evaluate the given block with #next if not #atEnd."
	self atEnd
		ifFalse: [ aOneArgumentBlock value: self next ]