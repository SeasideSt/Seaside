Extension { #name : 'WAAnchorTag' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WAAnchorTag >> turbo: aBoolean [

	"data-turbo=""false"" disables Turbo Drive on links and forms including descendants. To reenable when an ancestor has opted out, use data-turbo=""true"". Be careful: when Turbo Drive is disabled, browsers treat link clicks as normal, but native adapters may exit the app."

	self dataAttributeAt: 'turbo' put: aBoolean

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAAnchorTag >> turboAction: aString [

	(#('replace' 'advance') includes: aString) ifFalse: [ 
		self error: 'Argument for turboAction must be either ''replace'' or ''advance''.' ].
	self dataAttributeAt: 'turbo-action' put: aString

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAAnchorTag >> turboConfirm: aString [
	"Decorate links with both data-turbo-confirm and data-turbo-method,
	and confirmation will be required for a visit to proceed.
	https://turbo.hotwired.dev/handbook/drive#requiring-confirmation-for-a-visit"

	self turboMethod: 'get'.
	self dataAttributeAt: 'turbo-confirm' put: aString

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAAnchorTag >> turboMethod: aString [

	self dataAttributeAt: 'turbo-method' put: aString

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAAnchorTag >> turboStreamCallback: aValuable [

	self dataAttributeAt: 'turbo-stream' put: true.
	self url addField: (self storeCallback: ((WATurboStreamCallback on: aValuable) context: canvas context))
]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAAnchorTag >> turboTarget: aString [

	"data-turbo-frame identifies the Turbo Frame to navigate. Refer to the Frames documentation for further details."

	self dataAttributeAt: 'turbo-frame' put: aString

]
