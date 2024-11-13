querying
countryNames 
	
	^ countryNames ifNil: [ countryNames := self listOfCountryNames ]