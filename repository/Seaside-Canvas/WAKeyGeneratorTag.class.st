"
A WAKeygenTag is allows the user agent to generate a secure key and submits the public key.

Supported by:
    * Netscape 3, 4, 6, 7
    * Mozilla 1
    * Firefox 1
    * Opera 3, 4, 5, 6, 7, 8
    * Safari 1 

=== Links for more info ===
http://lists.whatwg.org/pipermail/whatwg-whatwg.org/attachments/20080714/07ea5534/attachment.txt
http://wp.netscape.com/eng/security/comm4-keygen.html
http://wp.netscape.com/eng/security/ca-interface.html
http://webdesign.about.com/od/htmltags/p/bltags_keygen.htm
http://eskimonorth.com/~bloo/indexdot/html/tagpages/k/keygen.htm
http://web.archive.org/web/20040710102131/devedge.netscape.com/library/manuals/1998/htmlguide/
http://64.233.183.104/search?q=cache:TExfCslqOcwJ:www.html4newbies.com/Keygen.php
http://www.di.unito.it/~rabser/ssleay/x509_netscape.html
http://msdn.microsoft.com/en-us/library/cc214558.aspx - Something that may look like the MS version of the keygen attribute

"
Class {
	#name : #WAKeyGeneratorTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #callbacks }
WAKeyGeneratorTag >> callback: aBlock [
	self name: (self storeCallback: (WAValueCallback on: aBlock))
]

{ #category : #attributes }
WAKeyGeneratorTag >> challenge: aString [
	"Specifies the challenge string to be packaged with the public key for use in verification of the form submission. If no challenge string is provided, then it is encoded as an 'IA5STRING' of length zero. "
	self attributeAt: 'challenge' put: aString
]

{ #category : #testing }
WAKeyGeneratorTag >> isClosed [
	^ true
]

{ #category : #attributes }
WAKeyGeneratorTag >> keyType: aString [
	"This attribute specifies the type of encryption security method to use to verify the receiver. 
    Values: 'RSA' (default) or 'DSA'"
	self attributeAt: 'keytype' put: aString
]

{ #category : #attributes }
WAKeyGeneratorTag >> name: aString [
	"The same as WAFormInputTag >> #name:"
	self attributeAt: 'name' put: aString
]

{ #category : #attributes }
WAKeyGeneratorTag >> pqg: aString [
	"This attribute appears to be a security string to be sent and verified."
	self attributeAt: 'pqg' put: aString
]

{ #category : #accessing }
WAKeyGeneratorTag >> tag [
	^ 'keygen'
]
