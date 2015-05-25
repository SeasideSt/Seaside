rendering
renderAPInfoOn: html
	| exampleFileLibraryClass introText |
	
	html horizontalRule.
	
	html paragraph: 'You can also upload files programatically:'.
	html blockquote: [
		html code: self library class greaseString, ' addAllFilesIn: ''/var/www/files/twitterbootstrap/css'''; break.
		html code: self library class greaseString, ' addAllFilesIn: ''/var/www/files/twitterbootstrap/js''' ].
	
	(self library isKindOf: WAFileMetadataLibrary) 
		ifTrue: [
			exampleFileLibraryClass := self library class greaseString.
			introText := 'Additionally as your file library is derived from ' ]
		ifFalse: [
			exampleFileLibraryClass := 'MYWAFileMetadataDerivedFileLibrary'.
			introText := 'Also if you create a file library derived from ' ].
		
	html paragraph: [
		html text: introText; code: 'WAFileMetadataLibrary'; text: ' you can store files which include a path component, for example: ' ].

	html blockquote: [			
		html code: exampleFileLibraryClass, ' recursivelyAddAllFilesIn: ''/var/www/files/twitterbootstrap''' ].
	
	html paragraph: [
		html text: 'Now all the files in '; code: [
			html
				text: '''/var/www/files/twitterbootstrap/'; strong: 'css'; text: '''' ];
				text: 'and '; code: [
					html text: '''/var/www/files/twitterbootstrap/'; strong: 'js'; text: '''' ];
				text: ' will include a the path component of either '; code: '''css/'''; text: ' or '; code: '''js/'''; text: ' in their url path.' ].
	
	html horizontalRule.
	
	html paragraph: 'In a rendering method,  you can refer to files in your file library with:'.
	html blockquote: [			
		html code: 'html image url:  MyFileLibrary / #pictureJpg.' ].
	html paragraph: [
		html text: 'You can easily include all css and javascript referred to within the method '; code: '#selectorsToInclude'; text: ' in your component''s #updateRoot: using:' ].
	html blockquote: [			
		html code: 'MyFileLibrary default updateRoot: aHtmlRoot.' ].
	
	html horizontalRule.
		
	html paragraph: 'When you are ready to deploy your site, you can write the files from your file library out to the file system, using:'.
	html blockquote: [			
		html code: 'MyFileLibrary default deployFiles.' ].
	html paragraph: [
		html text: 'In this example, the files will be written to a folder beneath your image named: '; code: 'MyFileLibrary' ].
	
	html paragraph: [
		html text: 'See also: '. html anchor url: 'http://book.seaside.st/book/in-action/serving-files'; with: 'serving files'. html text: ' in the '. 
		html anchor url: 'http://book.seaside.st'; with: 'Seaside book' ]
	
	
