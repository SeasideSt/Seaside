*seaside-internetexplorer
imNice
	"set the evil bit to false
	http://support.microsoft.com/kb/323752
	
	This code sample shows that your site provides you access to your own contact information (CAO), that any analyzed data is only 'pseudo-analyzed', which means that the data is connected to your online persona and not to your physical identity (PSA), and that your data is not supplied to any outside agencies for those agencies to use (OUR)."
	self headerAt: 'P3P' put: 'CP="CAO PSA OUR"'