accessing
default
	| singleton |
	singleton := SessionTemps current at: #WA_SERVER_MANAGER_DEFAULT otherwise:nil.
	singleton == nil 
		ifTrue:[
			singleton := self new.
			SessionTemps current at: #WA_SERVER_MANAGER_DEFAULT put: singleton.
		].
	^singleton