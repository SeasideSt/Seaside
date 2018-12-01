"
Compatibility class to maintain WAKomEncoded interface from Seaside 2.8 and older.

Creates an instance of WAComancheAdaptor configured to convert requests/responses from/to UTF-8 to/from Pharo's native internal encoding.
"
Class {
	#name : #WAKomEncoded,
	#superclass : #WAKom,
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #private }
WAKomEncoded class >> defaultCodec [
	^ GRPharoUtf8Codec new
]
