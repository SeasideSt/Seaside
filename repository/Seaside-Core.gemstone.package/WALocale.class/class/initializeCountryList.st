class initialization
initializeCountryList
	iso2Countries := Dictionary new.
	iso3Countries := Dictionary new.
	self countryList do: [ :each |
		iso2Countries
			at: each first
			put: each third.
		iso3Countries
			at: each second
			put: each third ]