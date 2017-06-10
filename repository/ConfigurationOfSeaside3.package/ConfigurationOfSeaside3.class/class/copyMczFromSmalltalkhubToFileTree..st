development support
copyMczFromSmalltalkhubToFileTree: aDirectoryPathString

| latest source destination goSource goDestination|
"Copy all latests packages to a filetree repository (that can be committed to github)

self copyMczFromSmalltalkhubToFileTree: '/Users/marschall/git/Seaside/repository'"

source := (Smalltalk at: #MCSmalltalkhubRepository)
     owner: 'Seaside'
     project: 'Seaside32'
     user: ''
     password: ''.

destination := (Smalltalk at: #MCFileTreeRepository) 
	new directory: aDirectoryPathString asFileReference.

goSource := Gofer new repository: source.
goDestination := Gofer new repository: destination.
latest := Dictionary new.
(source goferReferences
		groupedBy:[:r | r packageName]) 
			keysAndValuesDo:[:packageName :versions |
					latest 
						at: packageName 
						put: (versions sorted:[:v1 :v2 | v1 versionNumber <= v2 versionNumber]) last].
latest values do:[:version | 
	goSource version: version name. 
	goDestination version: version name].

goSource fetch.
goDestination push