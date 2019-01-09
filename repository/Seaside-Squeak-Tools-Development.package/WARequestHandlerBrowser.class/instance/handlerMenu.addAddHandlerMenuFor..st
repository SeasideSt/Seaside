handlers
handlerMenu: aMenu addAddHandlerMenuFor: h
	"sorry for that name. It fits, tho"
	WARequestHandler concreteSubclasses do: [ :each | 
		aMenu
			add: 'Add ', each description
			target: self
			selector: #addHandler:inDispatcher:
			argumentList: {each . h}].