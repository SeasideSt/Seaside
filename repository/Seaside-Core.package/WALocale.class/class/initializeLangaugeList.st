class initialization
initializeLangaugeList
	iso2Languages := Dictionary new.
	iso3Languages := Dictionary new.
	
	self languageList do: [ :each |
		each size > 2
			ifTrue: [
				iso2Languages at: each first put: each third.
				iso3Languages at: each second put: each third ]
			ifFalse: [
				iso3Languages at: each first put: each second ] ]