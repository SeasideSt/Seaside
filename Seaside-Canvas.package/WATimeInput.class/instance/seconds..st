private callbacks
seconds: anIntegerOrString
	seconds := [ anIntegerOrString asNumber ] on: Error do: [ :e | 0 ]