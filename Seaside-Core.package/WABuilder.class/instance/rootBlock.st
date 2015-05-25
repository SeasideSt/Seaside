accessing
rootBlock
	^ rootBlock ifNil: [ rootBlock := [ :root | ] ]