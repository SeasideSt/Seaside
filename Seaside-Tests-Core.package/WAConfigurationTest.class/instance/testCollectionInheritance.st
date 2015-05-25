tests
testCollectionInheritance
	"Collection values assigned with #at:addAll: should add on to the inherited value."
	| empty root one two three four |
	empty := WAConfigurationMock new
		description: [ :config | (config collection: #a) ];
		yourself.
	root := WAConfigurationMock new
		description: [ :config | (config collection: #a) default: #(1 2) ];
		yourself.
	one := WAConfigurationMock new
		description: [ :config | config at: #a addAll: #(3) removeAll: #(2) ];
		parents: [ Array with: root ];
		yourself.
	two := WAConfigurationMock new
		description: [ :config | config at: #a addAll: #(1 2 3 4) ];
		parents: [ Array with: one ];
		yourself.
	three := WAUserConfiguration new
		addParent: two;
		at: #a addAll: #(4 5) removeAll: #(1 8);
		yourself.
	four := WAConfigurationMock new
		description: [ :config | config at: #a addAll: #(3 4) removeAll: #(2 3) ];
		parents: [ Array with: one ];
		yourself.

	self assert: (empty at: #a) = #().
	self assert: (root at: #a) = #(1 2).
	self assert: (one at: #a) = #(1 3).
	self assert: (two at: #a) = #(1 2 3 4).
	self assert: (three at: #a) = #(2 3 4 5).
	self assert: (four at: #a) = #(1 3 4)