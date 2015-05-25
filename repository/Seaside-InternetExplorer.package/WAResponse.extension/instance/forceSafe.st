*seaside-internetexplorer
forceSafe
	"don't open on the site
	http://blogs.msdn.com/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
	
	MIME-Handling: Force Save
	Lastly, for web applications that need to serve untrusted HTML files, we have introduced a mechanism to help prevent the untrusted content from compromising your site's security. When the new X-Download-Options header is present with the value noopen, the user is prevented from opening a file download directly; instead, they must first save the file locally. When the locally saved file is later opened, it no longer executes in the security context of your site, helping to prevent script injection."
	self headerAt: 'X-Download-Options' put: 'noopen'