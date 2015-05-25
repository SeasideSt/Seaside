private
generate
	"This code is used to generate the theme classes. It is not necessary to port or call this method from any Smalltalk platform other than Pharo. The actual code of this method is commented to avoid problems on other platforms."

	"| model themes className |
	model := (Smalltalk at: #RBNamespace) new.
	themes := #('black-tie' 'blitzer' 'cupertino' 'dark-hive' 'dot-luv' 'eggplant' 'excite-bike' 'flick' 'hot-sneaks' 'humanity' 'le-frog' 'mint-choc' 'overcast' 'pepper-grinder' 'redmond' 'smoothness' 'south-street' 'start' 'sunny' 'swanky-purse' 'trontastic' 'ui-darkness' 'ui-lightness' 'vader').

	(model classNamed: self name) subclasses
		do: [ :each | model removeClass: each ].

	themes do: [ :theme |
		className := ((((theme findTokens: $-)
			collect: [ :each | each asCapitalizedPhrase ])
			inject: 'JQ' into: [ :a :b | a , b ]) , 'Theme')
			asSymbol.
		model defineClass: ('<1s> subclass: #<2s>
			instanceVariableNames: ''''
			classVariableNames: ''''
			poolDictionaries: ''''
			category: <3p>'
				expandMacrosWith: self name
				with: className
				with: self category).
		(model classNamed: className)
			compile: 'themeName
	^ ' , theme printString
			classified: #accessing ].

	model changes open"
	
	self error: 'comment only'