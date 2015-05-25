public
with: aBlock
	self create; apply: (Array
		with: self id
		with: (self render: aBlock))