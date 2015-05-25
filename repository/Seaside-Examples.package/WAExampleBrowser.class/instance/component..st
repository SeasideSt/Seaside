accessing
component: aComponent
	component := aComponent.
	hasAnswer := false.
	answer := nil.
	component onAnswer: [ :value | hasAnswer := true. answer := value ]