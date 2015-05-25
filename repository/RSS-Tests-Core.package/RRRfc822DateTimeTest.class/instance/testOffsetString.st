tests
testOffsetString
	| duration formatted |
	duration := Duration days: 0 hours: 2 minutes: 3 seconds: 0.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '+0203' = formatted.
	
	duration := Duration days: 0 hours: -2 minutes: 0 seconds: 0.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '-0200' = formatted.
	
	duration := Duration days: 0 hours: 0 minutes: -3 seconds: 0.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '-0003' = formatted.
	
	"Test that 0 offset is positive and #offsetString: sends only ANSI messages."
	duration:= Duration zero.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '+0000' = formatted