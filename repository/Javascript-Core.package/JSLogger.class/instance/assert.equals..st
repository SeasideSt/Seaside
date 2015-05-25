assertions
assert: anObject equals: anotherObject 
	self 
		call: 'assertEquals'
		with: anObject
		with: anotherObject