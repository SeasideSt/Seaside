Extension { #name : #GRPharoPlatformTest }

{ #category : #'*seaside-tests-pharo-email' }
GRPharoPlatformTest >> testIsIpAddress [
	self assert: (GRPlatform current isIpAddress: '1.2.3.4').
	self deny: (GRPlatform current isIpAddress: '1.2.3').
	self deny: (GRPlatform current isIpAddress: '1.2.3.4.5').
	self deny: (GRPlatform current isIpAddress: '1.2.3.444').
	self deny: (GRPlatform current isIpAddress: 'hostage')
]
