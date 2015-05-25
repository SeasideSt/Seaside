rendering
renderValuesOn: html
	| parameters |
	parameters := SmalltalkImage current vm getParameters.
	
	self renderLabel: 'Allocation Count' value: (parameters at: 4) on: html.
	self renderEditIntegerParameterAt: 5 named: 'Allocations Between GCs' on: html.
	self renderEditIntegerParameterAt: 6 named: 'Survivor Count Tenuring Threshold' on: html.
	
	self renderEditMemoryParameterAt: 23 named: 'Extra VM Memory' on: html.
	self renderEditMemoryParameterAt: 24 named: 'Shrinking Threshold' on: html.
	self renderEditMemoryParameterAt: 25 named: 'Memory Headroom' on: html.
	
	self renderLabel: 'Grow Memory Requests' value: (parameters at: 31) on: html.
	self renderLabel: 'Shrink Memory Requests' value: (parameters at: 32) on: html.
	
	self renderLabel: 'Objects Pending Finalization' value: (parameters at: 39) on: html.
	
	self renderLabel: 'Root Table Size' value: (parameters at: 21) on: html.
	self renderLabel: 'Root Table Overflows Since Startup' value: (parameters at: 22) on: html.