menus
adaptorsMenu: aMenu
	(Pragma allNamed: #menuItem:enabled:priority:help: in: self class sortedByArgument: 3)
		inject: 0 into: [:prio :p |
			(p argumentAt: 3) - prio >= 100 ifTrue: [aMenu addList: #(-)].
			 "= true because it can also be a symbol"
			((p argumentAt: 2) = true or: [self perform: (p argumentAt: 2)])
				ifTrue: [ | label |
					label := (p argumentAt: 1) isSymbol
						ifTrue: [self perform: (p argumentAt: 1)]
						ifFalse: [p argumentAt: 1].
					aMenu add: label help: (p argumentAt: 4) action: (p selector)].
			p argumentAt: 3].
	^ aMenu
