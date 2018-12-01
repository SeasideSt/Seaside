Class {
	#name : #WAFileLibraryEditor,
	#superclass : #WAStringLibraryEditor,
	#instVars : [
		'renamingFile',
		'newName'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #rendering }
WAFileLibraryEditor >> renderAPInfoOn: html [
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
	
	

]

{ #category : #rendering }
WAFileLibraryEditor >> renderAddFileOn: html [
	html form multipart; with: [
	 	html div: [
			html text: 'Add file: '.
			html break.
			html fileUpload size: 40; on: #addFile of: self library.
			html space.
			html submitButton: 'Add' ] ]
]

{ #category : #rendering }
WAFileLibraryEditor >> renderContentOn: html [
	html div
		class: 'groupContent';
		with: [
			self renderHeadingsOn: html.
			self renderAddFileOn: html.
			html break.
			self renderFilesOn: html.
			html paragraph: [
				self renderWriteToDiskOn: html.
				html space.
				self renderDoneOn: html ].
			
			self renderAPInfoOn: html ]
]

{ #category : #rendering }
WAFileLibraryEditor >> renderFile: fileName on: html [
	html tableData: [
		html anchor
			class: 'download';
			url: (self urlFor: fileName);
			with: fileName ].
	html tableData: [
		html anchor
			callback: [
				self confirm: 'Really remove ''', fileName, '''?' onAnswer: [ :answer |
					"use CPS to avoid continuation use for VAST"
					answer ifTrue: [
						self library removeFile: fileName ] ] ];
			with: 'Remove'.
		html space.
		html anchor
			callback: [ renamingFile := fileName ];
			with: 'Rename' ]
]

{ #category : #rendering }
WAFileLibraryEditor >> renderFilesOn: html [
	html table: [
		self library filenames sorted do: [ :each |
			html tableRow: [
				renamingFile = each
					ifTrue: [ self renderRenameFormForFile: each on: html ]
					ifFalse: [ self renderFile: each on: html ] ] ] ]
]

{ #category : #rendering }
WAFileLibraryEditor >> renderRenameFormForFile: fileName on: html [
	html tableData
		colSpan: 2;
		with: [
			html form: [
				html textInput
					value: fileName;
					callback: [ :value | newName := value ].
				html anchor
					onClick: 'return submitForm(this)';
					callback: [
						self library renameFile: fileName to: newName.
						renamingFile := nil ];
				 	with: 'Rename'.
				html space.
				html anchor
					onClick: 'return submitForm(this)';
					callback: [ renamingFile := nil ];
					with: 'Cancel' ] ]
]

{ #category : #updating }
WAFileLibraryEditor >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self library name
]
