"
supported on:
- Opera 9
graceful degeneration to text input

An e-mail address, following the format of the addr-spec  token defined in RFC 2822 section 3.4.1 [RFC2822], but excluding the CFWS  subtoken everywhere, and excluding the FWS subtoken everywhere except in the quoted-string subtoken. UAs could, for example, offer e-mail addresses from the user's address book. (See below for notes on IDN.)
"
Class {
	#name : #WAEmailInputTag,
	#superclass : #WAAbstractTextAreaTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WAEmailInputTag >> allValuesCallbackClass [
	^ WAAllEmailsCallback
]

{ #category : #callbacks }
WAEmailInputTag >> callback: aBlock [
	self name: (self storeCallback: (WAEmailCallback on: aBlock)).
	self value: self value
]

{ #category : #accessing }
WAEmailInputTag >> type [
	^ 'email'
]
