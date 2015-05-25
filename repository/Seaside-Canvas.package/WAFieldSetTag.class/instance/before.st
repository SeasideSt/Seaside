private
before
	super before.
	legend isNil
		ifFalse: [ canvas legend: legend ]