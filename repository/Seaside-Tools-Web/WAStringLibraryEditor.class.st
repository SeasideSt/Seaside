Class {
	#name : #WAStringLibraryEditor,
	#superclass : #WAComponent,
	#instVars : [
		'library'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #accessing }
WAStringLibraryEditor >> library [
	^ library
]

{ #category : #accessing }
WAStringLibraryEditor >> library: aLibrary [
	library := aLibrary
]

{ #category : #rendering }
WAStringLibraryEditor >> renderContentOn: html [
	html div
		class: 'groupContent';
		with: [
			self renderHeadingsOn: html.
			self renderFilesOn: html.
			self renderWriteToDiskOn: html.
			html space.
			self renderDoneOn: html ]
]

{ #category : #rendering }
WAStringLibraryEditor >> renderDoneOn: html [
	html anchor
		class: 'large';
		title: 'Close and return';
		callback: [ self answer ];
		with: 'Close'
]

{ #category : #rendering }
WAStringLibraryEditor >> renderFilesOn: html [
	html unorderedList: [
		self library filenames
			do: [ :each |
				html listItem: [
					html anchor
						class: 'download';
						url: (self urlFor: each);
						with: each ] ] ]
]

{ #category : #rendering }
WAStringLibraryEditor >> renderHeadingsOn: html [
	html heading level2; with: self library name
]

{ #category : #rendering }
WAStringLibraryEditor >> renderWriteToDiskOn: html [
	html anchor
		class: 'large';
		callback: [ self library deployFiles ];
		title: 'Wite all the files to disk';
		with: 'Write to disk'
]

{ #category : #private }
WAStringLibraryEditor >> urlFor: aFilename [
	^ self library urlForFile: aFilename
]
