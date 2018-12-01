"
I disable content type sniffing in some browsers.

http://blog.fox-it.com/2012/05/08/mime-sniffing-feature-or-vulnerability/
http://security.stackexchange.com/questions/12896/does-x-content-type-options-really-prevent-content-sniffing-attacks
"
Class {
	#name : #WANoSniffFilter,
	#superclass : #WARequestFilter,
	#category : 'Seaside-Security'
}

{ #category : #processing }
WANoSniffFilter >> handleFiltered: aRequestContext [
	aRequestContext response noSniff.
	super handleFiltered: aRequestContext
]
