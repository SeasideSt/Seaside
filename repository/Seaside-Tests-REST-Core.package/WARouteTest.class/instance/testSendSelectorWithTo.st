tests
testSendSelectorWithTo
	| route victim result |
	victim := WARouteVictimMock new.
	route := WARoute get: #nothing.
	result := route sendSelectorWith: Array new to: victim.
	self assert: result = Array new.
	
	route := WARoute get: #first:.
	result := route sendSelectorWith: #('terrorists') to: victim.
	self assert: result = #('terrorists').
	
	route := WARoute get: #first:second:.
	result := route sendSelectorWith: #('terrorists' 'marschall') to: victim.
	self assert: result = #('terrorists' 'marschall')