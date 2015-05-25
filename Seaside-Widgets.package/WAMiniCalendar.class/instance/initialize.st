initialization
initialize
	super initialize.
	monthIndex := WAValueHolder with: Date today monthIndex.
	year := WAValueHolder with: Date today year.
	date := WAValueHolder new.
	canSelectBlock := [ :value | true ].
	selectBlock := [ :value | self answer: value ]