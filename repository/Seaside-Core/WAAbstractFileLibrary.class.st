"
Abstract superclass for Seaside file libraries
"
Class {
	#name : 'WAAbstractFileLibrary',
	#superclass : 'WAObject',
	#classVars : [
		'MimeTypes'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-Core-Libraries',
	#package : 'Seaside-Core',
	#tag : 'Libraries'
}

{ #category : 'convenience' }
WAAbstractFileLibrary class >> / aSymbol [
	^ self urlOf: aSymbol
]

{ #category : 'file addition' }
WAAbstractFileLibrary class >> addAllFilesIn: aPathString [ 
	"adds all files in the directory specified by aPathString to the current file library - 
	does *not* recurse into sub-directories"
	(GRPlatform current filesIn: aPathString) do: [ :each | self addFileAt: each ]
]

{ #category : 'file addition' }
WAAbstractFileLibrary class >> addFileAt: aPath [ 
	"Add the file specified by aPath to the current file library."
	self 
		addFileAt: aPath
		contents: (GRPlatform current 
				contentsOfFile: aPath
				binary: (self isBinaryAt: aPath))
]

{ #category : 'file addition' }
WAAbstractFileLibrary class >> addFileAt: aPath contents: aByteArrayOrString [ 
	self 
		addFileNamed: (GRPlatform current localNameOf: aPath)
		contents: aByteArrayOrString
]

{ #category : 'file addition' }
WAAbstractFileLibrary class >> addFileNamed: aFilename contents: aByteArrayOrString [
	self subclassResponsibility
]

{ #category : 'private' }
WAAbstractFileLibrary class >> asSelector: aFilename [
	| mainPart extension |
	mainPart := (aFilename copyUpToLast: $.)
		select: [ :each | each isAlphaNumeric ].
	[ mainPart isEmpty not and: [ mainPart first isDigit ] ]
		whileTrue: [ mainPart := mainPart allButFirst ].
	
	mainPart isEmpty ifTrue: [ ^ nil ].
		
	extension := ((aFilename copyAfterLast: $.)
		select: [ :each | each isAlphaNumeric ]) asLowercase capitalized.
	^ (mainPart, extension) asSymbol
]

{ #category : 'private' }
WAAbstractFileLibrary class >> compileBinary: aByteArrayOrString selector: aSymbol [ 
	"compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a byte array"
	| code |
	code := GRPlatform current 
		asMethodReturningByteArray: aByteArrayOrString
		named: aSymbol.
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory
]

{ #category : 'private' }
WAAbstractFileLibrary class >> compileText: aByteArrayOrString selector: aSymbol [ 
	"Compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a string literal."
	| code |
	code := GRPlatform current asMethodReturningString: aByteArrayOrString named: aSymbol.
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory
]

{ #category : 'instance creation' }
WAAbstractFileLibrary class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : 'accessing-defaults' }
WAAbstractFileLibrary class >> defaultCacheDuration [
	"Answer the duration the response should be cached by the user agent."

	^ Duration
		days: 0
		hours: 0
		minutes: 30
		seconds: 0
]

{ #category : 'accessing-defaults' }
WAAbstractFileLibrary class >> defaultMimeType [
	^ 'application/octet-stream'
]

{ #category : 'accessing-defaults' }
WAAbstractFileLibrary class >> defaultMimeTypes [
	^ #(
		'%' 'application/x-trash'
		'323' 'text/h323'
		'abw' 'application/x-abiword'
		'ai' 'application/postscript'
		'aif' 'audio/x-aiff'
		'aifc' 'audio/x-aiff'
		'aiff' 'audio/x-aiff'
		'alc' 'chemical/x-alchemy'
		'art' 'image/x-jg'
		'asc' 'text/plain'
		'asf' 'video/x-ms-asf'
		'asn' 'chemical/x-ncbi-asn1-spec'
		'aso' 'chemical/x-ncbi-asn1-binary'
		'asx' 'video/x-ms-asf'
		'au' 'audio/basic'
		'avi' 'video/x-msvideo'
		'b' 'chemical/x-molconn-Z'
		'bak' 'application/x-trash'
		'bat' 'application/x-msdos-program'
		'bcpio' 'application/x-bcpio'
		'bib' 'text/x-bibtex'
		'bin' 'application/octet-stream'
		'bmp' 'image/x-ms-bmp'
		'book' 'application/x-maker'
		'bsd' 'chemical/x-crossfire'
		'c' 'text/x-csrc'
		'c++' 'text/x-c++src'
		'c3d' 'chemical/x-chem3d'
		'cac' 'chemical/x-cache'
		'cache' 'chemical/x-cache'
		'cascii' 'chemical/x-cactvs-binary'
		'cat' 'application/vnd.ms-pki.seccat'
		'cbin' 'chemical/x-cactvs-binary'
		'cc' 'text/x-c++src'
		'cdf' 'application/x-cdf'
		'cdr' 'image/x-coreldraw'
		'cdt' 'image/x-coreldrawtemplate'
		'cdx' 'chemical/x-cdx'
		'cdy' 'application/vnd.cinderella'
		'cef' 'chemical/x-cxf'
		'cer' 'chemical/x-cerius'
		'chm' 'chemical/x-chemdraw'
		'chrt' 'application/x-kchart'
		'cif' 'chemical/x-cif'
		'class' 'application/java-vm'
		'cls' 'text/x-tex'
		'cmdf' 'chemical/x-cmdf'
		'cml' 'chemical/x-cml'
		'cod' 'application/vnd.rim.cod'
		'com' 'application/x-msdos-program'
		'cpa' 'chemical/x-compass'
		'cpio' 'application/x-cpio'
		'cpp' 'text/x-c++src'
		'cpt' 'image/x-corelphotopaint'
		'crl' 'application/x-pkcs7-crl'
		'crt' 'application/x-x509-ca-cert'
		'csf' 'chemical/x-cache-csf'
		'csh' 'text/x-csh'
		'csm' 'chemical/x-csml'
		'csml' 'chemical/x-csml'
		'css' 'text/css'
		'csv' 'text/comma-separated-values'
		'ctab' 'chemical/x-cactvs-binary'
		'ctx' 'chemical/x-ctx'
		'cu' 'application/cu-seeme'
		'cub' 'chemical/x-gaussian-cube'
		'cxf' 'chemical/x-cxf'
		'cxx' 'text/x-c++src'
		'dat' 'chemical/x-mopac-input'
		'dcr' 'application/x-director'
		'deb' 'application/x-debian-package'
		'dif' 'video/dv'
		'diff' 'text/plain'
		'dir' 'application/x-director'
		'djv' 'image/vnd.djvu'
		'djvu' 'image/vnd.djvu'
		'dl' 'video/dl'
		'dll' 'application/x-msdos-program'
		'dmg' 'application/x-apple-diskimage'
		'dms' 'application/x-dms'
		'doc' 'application/msword'
		'dot' 'application/msword'
		'dv' 'video/dv'
		'dvi' 'application/x-dvi'
		'dx' 'chemical/x-jcamp-dx'
		'dxr' 'application/x-director'
		'emb' 'chemical/x-embl-dl-nucleotide'
		'embl' 'chemical/x-embl-dl-nucleotide'
		'ent' 'chemical/x-pdb'
		'eps' 'application/postscript'
		'etx' 'text/x-setext'
		'exe' 'application/x-msdos-program'
		'ez' 'application/andrew-inset'
		'fb' 'application/x-maker'
		'fbdoc' 'application/x-maker'
		'fch' 'chemical/x-gaussian-checkpoint'
		'fchk' 'chemical/x-gaussian-checkpoint'
		'fig' 'application/x-xfig'
		'flac' 'application/x-flac'
		'fli' 'video/fli'
		'fm' 'application/x-maker'
		'frame' 'application/x-maker'
		'frm' 'application/x-maker'
		'gal' 'chemical/x-gaussian-log'
		'gam' 'chemical/x-gamess-input'
		'gamin' 'chemical/x-gamess-input'
		'gau' 'chemical/x-gaussian-input'
		'gcd' 'text/x-pcs-gcd'
		'gcf' 'application/x-graphing-calculator'
		'gcg' 'chemical/x-gcg8-sequence'
		'gen' 'chemical/x-genbank'
		'gf' 'application/x-tex-gf'
		'gif' 'image/gif'
		'gjc' 'chemical/x-gaussian-input'
		'gjf' 'chemical/x-gaussian-input'
		'gl' 'video/gl'
		'gnumeric' 'application/x-gnumeric'
		'gpt' 'chemical/x-mopac-graph'
		'gsf' 'application/x-font'
		'gsm' 'audio/x-gsm'
		'gtar' 'application/x-gtar'
		'h' 'text/x-chdr'
		'h++' 'text/x-c++hdr'
		'hdf' 'application/x-hdf'
		'hh' 'text/x-c++hdr'
		'hin' 'chemical/x-hin'
		'hpp' 'text/x-c++hdr'
		'hqx' 'application/mac-binhex40'
		'hs' 'text/x-haskell'
		'hta' 'application/hta'
		'htc' 'text/x-component'
		'htm' 'text/html'
		'html' 'text/html'
		'hxx' 'text/x-c++hdr'
		'ica' 'application/x-ica'
		'ice' 'x-conference/x-cooltalk'
		'ico' 'image/x-icon'
		'ics' 'text/calendar'
		'icz' 'text/calendar'
		'ief' 'image/ief'
		'iges' 'model/iges'
		'igs' 'model/iges'
		'iii' 'application/x-iphone'
		'inp' 'chemical/x-gamess-input'
		'ins' 'application/x-internet-signup'
		'iso' 'application/x-iso9660-image'
		'isp' 'application/x-internet-signup'
		'ist' 'chemical/x-isostar'
		'istr' 'chemical/x-isostar'
		'jad' 'text/vnd.sun.j2me.app-descriptor'
		'jar' 'application/java-archive'
		'java' 'text/x-java'
		'jdx' 'chemical/x-jcamp-dx'
		'jmz' 'application/x-jmol'
		'jng' 'image/x-jng'
		'jnlp' 'application/x-java-jnlp-file'
		'jpe' 'image/jpeg'
		'jpeg' 'image/jpeg'
		'jpg' 'image/jpeg'
		'js' 'application/javascript'
		'kar' 'audio/midi'
		'key' 'application/pgp-keys'
		'kil' 'application/x-killustrator'
		'kin' 'chemical/x-kinemage'
		'kpr' 'application/x-kpresenter'
		'kpt' 'application/x-kpresenter'
		'ksp' 'application/x-kspread'
		'kwd' 'application/x-kword'
		'kwt' 'application/x-kword'
		'latex' 'application/x-latex'
		'less' 'text/css'
		'lha' 'application/x-lha'
		'lhs' 'text/x-literate-haskell'
		'lsf' 'video/x-la-asf'
		'lsx' 'video/x-la-asf'
		'ltx' 'text/x-tex'
		'lzh' 'application/x-lzh'
		'lzx' 'application/x-lzx'
		'm3u' 'audio/x-mpegurl'
		'm4a' 'audio/mpeg'
		'maker' 'application/x-maker'
		'man' 'application/x-troff-man'
		'mcif' 'chemical/x-mmcif'
		'mcm' 'chemical/x-macmolecule'
		'mdb' 'application/msaccess'
		'me' 'application/x-troff-me'
		'mesh' 'model/mesh'
		'mid' 'audio/midi'
		'midi' 'audio/midi'
		'mif' 'application/x-mif'
		'mm' 'application/x-freemind'
		'mmd' 'chemical/x-macromodel-input'
		'mmf' 'application/vnd.smaf'
		'mml' 'text/mathml'
		'mmod' 'chemical/x-macromodel-input'
		'mng' 'video/x-mng'
		'moc' 'text/x-moc'
		'mol' 'chemical/x-mdl-molfile'
		'mol2' 'chemical/x-mol2'
		'moo' 'chemical/x-mopac-out'
		'mop' 'chemical/x-mopac-input'
		'mopcrt' 'chemical/x-mopac-input'
		'mov' 'video/quicktime'
		'movie' 'video/x-sgi-movie'
		'mp2' 'audio/mpeg'
		'mp3' 'audio/mpeg'
		'mp4' 'video/mp4'
		'mpc' 'chemical/x-mopac-input'
		'mpe' 'video/mpeg'
		'mpeg' 'video/mpeg'
		'mpega' 'audio/mpeg'
		'mpg' 'video/mpeg'
		'mpga' 'audio/mpeg'
		'ms' 'application/x-troff-ms'
		'msh' 'model/mesh'
		'msi' 'application/x-msi'
		'mvb' 'chemical/x-mopac-vib'
		'mxu' 'video/vnd.mpegurl'
		'nb' 'application/mathematica'
		'nc' 'application/x-netcdf'
		'nwc' 'application/x-nwc'
		'o' 'application/x-object'
		'oda' 'application/oda'
		'odb' 'application/vnd.oasis.opendocument.database'
		'odc' 'application/vnd.oasis.opendocument.chart'
		'odf' 'application/vnd.oasis.opendocument.formula'
		'odg' 'application/vnd.oasis.opendocument.graphics'
		'odi' 'application/vnd.oasis.opendocument.image'
		'odm' 'application/vnd.oasis.opendocument.text-master'
		'odp' 'application/vnd.oasis.opendocument.presentation'
		'ods' 'application/vnd.oasis.opendocument.spreadsheet'
		'odt' 'application/vnd.oasis.opendocument.text'
		'ogg' 'application/ogg'
		'old' 'application/x-trash'
		'oth' 'application/vnd.oasis.opendocument.text-web'
		'oza' 'application/x-oz-application'
		'p' 'text/x-pascal'
		'p7r' 'application/x-pkcs7-certreqresp'
		'pac' 'application/x-ns-proxy-autoconfig'
		'pas' 'text/x-pascal'
		'pat' 'image/x-coreldrawpattern'
		'pbm' 'image/x-portable-bitmap'
		'pcf' 'application/x-font'
		'pcf.Z' 'application/x-font'
		'pcx' 'image/pcx'
		'pdb' 'chemical/x-pdb'
		'pdf' 'application/pdf'
		'pfa' 'application/x-font'
		'pfb' 'application/x-font'
		'pgm' 'image/x-portable-graymap'
		'pgn' 'application/x-chess-pgn'
		'pgp' 'application/pgp-signature'
		'pk' 'application/x-tex-pk'
		'pl' 'text/x-perl'
		'pls' 'audio/x-scpls'
		'pm' 'text/x-perl'
		'png' 'image/png'
		'pnm' 'image/x-portable-anymap'
		'pot' 'text/plain'
		'ppm' 'image/x-portable-pixmap'
		'pps' 'application/vnd.ms-powerpoint'
		'ppt' 'application/vnd.ms-powerpoint'
		'prf' 'application/pics-rules'
		'prt' 'chemical/x-ncbi-asn1-ascii'
		'ps' 'application/postscript'
		'psd' 'image/x-photoshop'
		'psp' 'text/x-psp'
		'py' 'text/x-python'
		'pyc' 'application/x-python-code'
		'pyo' 'application/x-python-code'
		'qt' 'video/quicktime'
		'qtl' 'application/x-quicktimeplayer'
		'ra' 'audio/x-realaudio'
		'ram' 'audio/x-pn-realaudio'
		'rar' 'application/rar'
		'ras' 'image/x-cmu-raster'
		'rd' 'chemical/x-mdl-rdfile'
		'rdf' 'application/rdf+xml'
		'rgb' 'image/x-rgb'
		'rm' 'audio/x-pn-realaudio'
		'roff' 'application/x-troff'
		'ros' 'chemical/x-rosdal'
		'rpm' 'application/x-redhat-package-manager'
		'rss' 'application/rss+xml'
		'rtf' 'text/rtf'
		'rtx' 'text/richtext'
		'rxn' 'chemical/x-mdl-rxnfile'
		'sass' 'text/x-sass'
		'scss' 'text/x-scss'
		'sct' 'text/scriptlet'
		'sd' 'chemical/x-mdl-sdfile'
		'sd2' 'audio/x-sd2'
		'sda' 'application/vnd.stardivision.draw'
		'sdc' 'application/vnd.stardivision.calc'
		'sdd' 'application/vnd.stardivision.impress'
		'sdf' 'chemical/x-mdl-sdfile'
		'sdp' 'application/vnd.stardivision.impress'
		'sdw' 'application/vnd.stardivision.writer'
		'ser' 'application/java-serialized-object'
		'sgf' 'application/x-go-sgf'
		'sgl' 'application/vnd.stardivision.writer-global'
		'sh' 'text/x-sh'
		'shar' 'application/x-shar'
		'shtml' 'text/html'
		'sid' 'audio/prs.sid'
		'sik' 'application/x-trash'
		'silo' 'model/mesh'
		'sis' 'application/vnd.symbian.install'
		'sit' 'application/x-stuffit'
		'skd' 'application/x-koan'
		'skm' 'application/x-koan'
		'skp' 'application/x-koan'
		'skt' 'application/x-koan'
		'smf' 'application/vnd.stardivision.math'
		'smi' 'application/smil'
		'smil' 'application/smil'
		'snd' 'audio/basic'
		'spc' 'chemical/x-galactic-spc'
		'spl' 'application/x-futuresplash'
		'src' 'application/x-wais-source'
		'stc' 'application/vnd.sun.xml.calc.template'
		'std' 'application/vnd.sun.xml.draw.template'
		'sti' 'application/vnd.sun.xml.impress.template'
		'stl' 'application/vnd.ms-pki.stl'
		'stw' 'application/vnd.sun.xml.writer.template'
		'sty' 'text/x-tex'
		'sv4cpio' 'application/x-sv4cpio'
		'sv4crc' 'application/x-sv4crc'
		'svg' 'image/svg+xml'
		'svgz' 'image/svg+xml'
		'sw' 'chemical/x-swissprot'
		'swf' 'application/x-shockwave-flash'
		'swfl' 'application/x-shockwave-flash'
		'sxc' 'application/vnd.sun.xml.calc'
		'sxd' 'application/vnd.sun.xml.draw'
		'sxg' 'application/vnd.sun.xml.writer.global'
		'sxi' 'application/vnd.sun.xml.impress'
		'sxm' 'application/vnd.sun.xml.math'
		'sxw' 'application/vnd.sun.xml.writer'
		't' 'application/x-troff'
		'tar' 'application/x-tar'
		'taz' 'application/x-gtar'
		'tcl' 'text/x-tcl'
		'tex' 'text/x-tex'
		'texi' 'application/x-texinfo'
		'texinfo' 'application/x-texinfo'
		'text' 'text/plain'
		'tgf' 'chemical/x-mdl-tgf'
		'tgz' 'application/x-gtar'
		'tif' 'image/tiff'
		'tiff' 'image/tiff'
		'tk' 'text/x-tcl'
		'tm' 'text/texmacs'
		'torrent' 'application/x-bittorrent'
		'tr' 'application/x-troff'
		'ts' 'text/texmacs'
		'tsp' 'application/dsptype'
		'tsv' 'text/tab-separated-values'
		'txt' 'text/plain'
		'udeb' 'application/x-debian-package'
		'uls' 'text/iuls'
		'ustar' 'application/x-ustar'
		'val' 'chemical/x-ncbi-asn1-binary'
		'vcd' 'application/x-cdlink'
		'vcf' 'text/x-vcard'
		'vcs' 'text/x-vcalendar'
		'vmd' 'chemical/x-vmd'
		'vms' 'chemical/x-vamas-iso14976'
		'vor' 'application/vnd.stardivision.writer'
		'vrm' 'x-world/x-vrml'
		'vrml' 'x-world/x-vrml'
		'vsd' 'application/vnd.visio'
		'wad' 'application/x-doom'
		'wav' 'audio/x-wav'
		'wax' 'audio/x-ms-wax'
		'wbmp' 'image/vnd.wap.wbmp'
		'wbxml' 'application/vnd.wap.wbxml'
		'wk' 'application/x-123'
		'wm' 'video/x-ms-wm'
		'wma' 'audio/x-ms-wma'
		'wmd' 'application/x-ms-wmd'
		'wml' 'text/vnd.wap.wml'
		'wmlc' 'application/vnd.wap.wmlc'
		'wmls' 'text/vnd.wap.wmlscript'
		'wmlsc' 'application/vnd.wap.wmlscriptc'
		'wmv' 'video/x-ms-wmv'
		'wmx' 'video/x-ms-wmx'
		'wmz' 'application/x-ms-wmz'
		'wp5' 'application/wordperfect5.1'
		'wpd' 'application/wordperfect'
		'wrl' 'x-world/x-vrml'
		'wsc' 'text/scriptlet'
		'wvx' 'video/x-ms-wvx'
		'wz' 'application/x-wingz'
		'xbm' 'image/x-xbitmap'
		'xcf' 'application/x-xcf'
		'xht' 'application/xhtml+xml'
		'xhtml' 'application/xhtml+xml'
		'xlb' 'application/vnd.ms-excel'
		'xls' 'application/vnd.ms-excel'
		'xlt' 'application/vnd.ms-excel'
		'xml' 'application/xml'
		'xpi' 'application/x-xpinstall'
		'xpm' 'image/x-xpixmap'
		'xsl' 'application/xml'
		'xtel' 'chemical/x-xtel'
		'xul' 'application/vnd.mozilla.xul+xml'
		'xwd' 'image/x-xwindowdump'
		'xyz' 'chemical/x-xyz'
		'zip' 'application/zip'
		'zmt' 'chemical/x-mopac-input'
		'~' 'application/x-trash'

	)
]

{ #category : 'actions' }
WAAbstractFileLibrary class >> deployFiles [
	^ self default deployFiles
]

{ #category : 'handling' }
WAAbstractFileLibrary class >> handle: aRequestContext [
	^ self default handle: aRequestContext
]

{ #category : 'testing' }
WAAbstractFileLibrary class >> handlesFolder: aSymbol [
	^ self name = aSymbol
]

{ #category : 'class initialization' }
WAAbstractFileLibrary class >> initialize [
	MimeTypes := Dictionary new.
	1 to: self defaultMimeTypes size by: 2 do: [ :index |
		MimeTypes
			at: (self defaultMimeTypes at: index)
			put: (self defaultMimeTypes at: index + 1) ]
]

{ #category : 'testing' }
WAAbstractFileLibrary class >> isAbstract [ 

	^ self == WAAbstractFileLibrary
]

{ #category : 'private' }
WAAbstractFileLibrary class >> isBinary: aFilename [
	^ (self mimetypeFor: (aFilename copyAfterLast: $.)) isBinary
]

{ #category : 'private' }
WAAbstractFileLibrary class >> isBinaryAt: aPath [ 
	^ self isBinary: (GRPlatform current localNameOf: aPath)
]

{ #category : 'accessing' }
WAAbstractFileLibrary class >> libraries [
	^ WAFileLibrary allSubclasses,  WAFileMetadataLibrary allSubclasses
]

{ #category : 'private' }
WAAbstractFileLibrary class >> methodCategory [
	"the method category for uploaded files"

	^ #uploaded
]

{ #category : 'accessing' }
WAAbstractFileLibrary class >> mimetypeFor: aString [
	^ (self mimetypes at: aString ifAbsent: [ self defaultMimeType ]) seasideMimeType
]

{ #category : 'accessing' }
WAAbstractFileLibrary class >> mimetypes [
	^ MimeTypes
]

{ #category : 'convenience' }
WAAbstractFileLibrary class >> urlOf: aSymbol [
	^ self default urlOf: aSymbol
]

{ #category : 'actions' }
WAAbstractFileLibrary >> addFile: aFile [ 
	"adds a file to the receiver

	aFile an instance of of WAFile"
	| contents |
	aFile isNil ifTrue: [
		"in case no file was selected for uploading"
		^ self ].
	contents := (aFile contentType isNil or: [ aFile contentType isBinary or: [ aFile contentType charSet isNil ] ])
		ifTrue: [ aFile rawContents ]
		ifFalse: [ GRPlatform current convertToSmalltalkNewlines: aFile contentsDecoded ].
	self class 
		addFileNamed: aFile fileName
		contents: contents
]

{ #category : 'private' }
WAAbstractFileLibrary >> asFilename: aSelector [
	self subclassResponsibility
]

{ #category : 'private' }
WAAbstractFileLibrary >> asSelector: aFilename [
	^ self class asSelector: aFilename
]

{ #category : 'actions' }
WAAbstractFileLibrary >> deployFiles [
	self subclassResponsibility
]

{ #category : 'private' }
WAAbstractFileLibrary >> entityTagFor: aStringOrByteArray [
	| hash base64 |
	hash := GRPlatform current secureHashFor: aStringOrByteArray.
	"etags have to be delimited by double quotes"
	base64 := GRPlatform current base64Encode: hash greaseAsByteArray.
	^ String new: base64 size + 2 streamContents:  [ :stream |
		stream
			nextPut: $";
			nextPutAll: base64;
			nextPut: $"]
]

{ #category : 'private' }
WAAbstractFileLibrary >> fileSelectors [
	self subclassResponsibility
]

{ #category : 'private' }
WAAbstractFileLibrary >> fileSelectorsTo: aSuperClass [
	| selectors current |
	selectors := Set new.
	current := self class.
	[ aSuperClass name = current name ] whileFalse: [
		current selectors do: [ :each |
			(self isFileSelector: each) ifTrue: [
				selectors add: each ] ].
		current := current superclass ].
	^ selectors
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> fileSizeOf: aSymbol [
	self subclassResponsibility
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> filenames [
	^ self fileSelectors collect: [ :each | self asFilename: each ]
]

{ #category : 'private' }
WAAbstractFileLibrary >> fullPathForFileName: aString using: aFileHandler [
	^ String streamContents: [ :stream |
		| pathSeparator xSendfileBaseDirectory |
		pathSeparator := GRPlatform current pathSeparator.
		xSendfileBaseDirectory := aFileHandler xSendfileBaseDirectory.
		stream nextPutAll: xSendfileBaseDirectory.
		(xSendfileBaseDirectory endsWithSubCollection: pathSeparator) ifFalse: [
			stream nextPutAll: pathSeparator ].
		stream
			nextPutAll: self name;
			nextPutAll: pathSeparator;
			nextPutAll: aString ]
]

{ #category : 'handling' }
WAAbstractFileLibrary >> handle: aRequestContext [
	self subclassResponsibility
]

{ #category : 'private' }
WAAbstractFileLibrary >> isFileSelector: aSymbol [
	"added condition to prevent overrides of methods defined in this class being picked up"
	^ aSymbol isUnary
		and: [ (self lastUpperCaseIndexIn: aSymbol) > 1
		and: [ (self nonFileSelectors includes: aSymbol) not ] ]
]

{ #category : 'private' }
WAAbstractFileLibrary >> lastUpperCaseIndexIn: aString [
	^ aString findLast: [ :each | each isUppercase ]
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> mimetypeOf: aSymbol [
	self subclassResponsibility
]

{ #category : 'testing' }
WAAbstractFileLibrary >> name [
	^ self class name greaseString
]

{ #category : 'private' }
WAAbstractFileLibrary >> nonFileSelectors [
	"Answers all the unary selectors with an upper clase latter that are not file selector.s
	This method is intended to be overridden by superclasses that add functionality. Don't forget to add the result of the super send."
	^ #(cacheDuration fileSelectors deployFiles configurationComponent selectorsToInclude nonFileSelectors)
]

{ #category : 'actions' }
WAAbstractFileLibrary >> removeFile: aFilename [ 
	GRPlatform current 
		removeSelector: (self asSelector: aFilename)
		from: self class
]

{ #category : 'actions' }
WAAbstractFileLibrary >> renameFile: oldName to: newName [
	| contents file |
	(self asSelector: oldName) = (self asSelector: newName)
		ifTrue: [ ^ nil ].
	contents := self perform: (self asSelector: oldName).
	file := WAFile new contents: contents.
	file fileName: newName.
	self addFile: file.
	self removeFile: oldName
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> selectorsToInclude [
	"The files represented by the selectors this method returns will be automatically added to the html <head> if the receiver is added to the respective Seaside application.

	This makes only sense for CSS and JS files"
	^ #()
]

{ #category : 'updating' }
WAAbstractFileLibrary >> updateRoot: anHtmlRoot [
	"Only override if you want to automatically include new types of resources. The default implementation knows how to reference CSS, JS and FavIcons into anHtmlRoot."

	self selectorsToInclude do: [ :each |
		| mimeType |
		mimeType := self mimetypeOf: each.
		(mimeType sub indexOfSubCollection: 'javascript' startingAt: 1) ~= 0
			ifTrue: [ anHtmlRoot javascript url: (self urlOf: each) ].
		(mimeType sub indexOfSubCollection: 'ico' startingAt: 1) ~= 0
			ifTrue: [ anHtmlRoot link beShortcutIcon; url: (self urlOf: each) ].
		(mimeType sub = 'css')
			ifTrue: [ anHtmlRoot stylesheet url: (self urlOf: each) ] ]
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> urlForFile: aFilename [
	^ self urlOf: (self asSelector: aFilename)
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> urlOf: aSymbol [
	^ self urlOf: aSymbol using: WAFileHandler default
]

{ #category : 'accessing' }
WAAbstractFileLibrary >> urlOf: aSymbol using: aHandler [
	^ aHandler baseUrlForLibrary
		addToPath: self className;
		addToPath: (self asFilename: aSymbol);
		yourself
]
