private
before
	super before.
	self hasList ifTrue: [
		self list do: [ :each |
			self
				renderListItem: each
				labelled: (self labelForOption: each) ] ]