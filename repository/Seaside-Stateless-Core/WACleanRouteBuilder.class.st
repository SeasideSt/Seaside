Class {
	#name : #WACleanRouteBuilder,
	#superclass : #WARouteBuilder,
	#category : #'Seaside-Stateless-Core'
}

{ #category : #initialization }
WACleanRouteBuilder class >> initialize [
	<script>

	configuration := IdentitySet new.
	(Pragma allNamed: #configuration in: self superclass)
		do: [ :pragma | configuration add: pragma method selector ]
]
