testing
testTableReportFunctionalTest
	| firstColumn |
	self selectTest: 'WATableReportFunctionalTest'.
	
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			((firstColumn collect: [ :e | e getText ])
				includesAll: (WAComponent allSubclasses collect: [ :c | c name greaseString ])).
	
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) asOrderedCollection sorted.
				
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) asOrderedCollection sorted reversed.