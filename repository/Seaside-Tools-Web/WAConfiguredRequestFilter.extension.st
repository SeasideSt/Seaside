Extension { #name : #WAConfiguredRequestFilter }

{ #category : #'*seaside-tools-web' }
WAConfiguredRequestFilter >> configurationComponent [
	^ WAUserConfigurationEditor on: self configuration
]
