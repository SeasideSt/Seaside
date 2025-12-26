configuration
createHandlers

	| dispatcher root |
	root := WADispatcher new.
	dispatcher := root register: WADispatcher new at: 'root'.
	application := dispatcher register: WAApplication new at: 'corsfiltertest'.
	^ Array with: root with: dispatcher with: application