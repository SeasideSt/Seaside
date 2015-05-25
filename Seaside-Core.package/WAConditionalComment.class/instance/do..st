public
do: aBlock
	root add: (self openingConditionClass condition: condition).
	aBlock value.
	root add: (self closingConditionClass new)