Extension { #name : #WAResponse }

{ #category : #'*seaside-internetexplorer' }
WAResponse >> forceSafe [
	"don't open on the site
	http://blogs.msdn.com/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
	
	MIME-Handling: Force Save
	Lastly, for web applications that need to serve untrusted HTML files, we have introduced a mechanism to help prevent the untrusted content from compromising your site's security. When the new X-Download-Options header is present with the value noopen, the user is prevented from opening a file download directly; instead, they must first save the file locally. When the locally saved file is later opened, it no longer executes in the security context of your site, helping to prevent script injection."
	self headerAt: 'X-Download-Options' put: 'noopen'
]

{ #category : #'*seaside-internetexplorer' }
WAResponse >> imNice [
	"set the evil bit to false
	http://support.microsoft.com/kb/323752
	
	This code sample shows that your site provides you access to your own contact information (CAO), that any analyzed data is only 'pseudo-analyzed', which means that the data is connected to your online persona and not to your physical identity (PSA), and that your data is not supplied to any outside agencies for those agencies to use (OUR)."
	self headerAt: 'P3P' put: 'CP="CAO PSA OUR"'
]
