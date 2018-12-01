Extension { #name : #WAResponse }

{ #category : #'*seaside-security' }
WAResponse >> noSniff [
	"trun off content sniffing
	http://blogs.msdn.com/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
	
	Sending the new X-Content-Type-Options response header with the value nosniff will prevent Internet Explorer from MIME-sniffing a response away from the declared content-type."
	self headerAt: 'X-Content-Type-Options' put: 'nosniff'
]
