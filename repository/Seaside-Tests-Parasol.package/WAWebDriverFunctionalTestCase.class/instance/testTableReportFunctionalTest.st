testing
testTableReportFunctionalTest
	| firstColumn classNames |
	self selectTest: 'WATableReportFunctionalTest'.
	(Delay forSeconds: 1) wait.
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	classNames := (firstColumn collect: [ :e | e getText ]).
	((WAComponent allSubclasses collect: [ :c | c name greaseString ]) 
		reject: [ :className | classNames includes: className  ])
			do: [ :className | Transcript show: className ].
	self assert: ((WAComponent allSubclasses collect: [ :c | c name greaseString ]) allSatisfy: [ :className | classNames includes: className ]).
	
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) sorted asOrderedCollection.
				
	((driver findElementByCSSSelector: 'table>thead') findElementByPartialLinkText: 'Name') click.
	firstColumn := driver findElementsByCSSSelector: 'table>tbody>tr>td:first-child'.
	self assert:
			(firstColumn collect: [ :e | e getText ]) asOrderedCollection 
				equals: (WAComponent allSubclasses collect: [ :c | c name greaseString ]) sorted asOrderedCollection reversed .