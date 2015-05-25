accessing
componentCreator
	^ componentCreator ifNil: [ componentCreator := WAWelcomeComponentCreator new ]