accessing
wwwRootDirectory
	"This is the root directory for your css/js/images etc...."

	^ wwwRootDirectory ifNil: [ 
		wwwRootDirectory := ZnFileSystemUtils directory: '/var/www' ]