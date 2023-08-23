visiting
shouldVisitNextPresenterOf: aDecoration
	^ aDecoration isTurboFrame not and: [ aDecoration isDelegation not ]