testing
isExpired: timeout updating: updating

	| value |
	^(value := self counter value) > lastCount 
		ifTrue: [ "accessed since last scan"
			updating 
				ifTrue: [
					lastCount := value.
					time := Time totalSeconds ].
			false]
		ifFalse: [ (Time totalSeconds - time) > timeout ]