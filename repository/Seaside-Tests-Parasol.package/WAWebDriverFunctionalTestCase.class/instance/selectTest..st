helpers
selectTest: aName
	| select |
	select := BPSelect on: (driver findElementByCSSSelector: 'form>p>select').
	select selectByVisibleText: aName.