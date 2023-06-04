rendering
renderSelectedPackageNameOn: html

	html text: (selectedPackageName
			 ifNil: [ 'No package name selected' ]
			 ifNotNil: [ selectedPackageName , ' was selected' ])