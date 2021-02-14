"
I'm the initial continuation of a render loop. I just render the initial page. Subclasses may want to override #shouldRedirect and answer true so that a redirect happens before displaying the first page.
"
Class {
	#name : #WAInitialRenderLoopContinuation,
	#superclass : #WAActionPhaseContinuation,
	#category : 'Seaside-RenderLoop'
}

{ #category : #processing }
WAInitialRenderLoopContinuation >> basicPerformAction [
	| root |
	root := self createRoot.
	self session properties at: #presenter put: root.
	self prepareRoot: root
]

{ #category : #creational }
WAInitialRenderLoopContinuation >> createRoot [
	| root |
	root := self requestContext rootComponentIfAbsent: [ self rootClass new ].
	^ self rootDecorationClasses
		inject: root
		into: [ :component :decorationClass |
			component 
				addDecoration: decorationClass new;
				yourself ]
]

{ #category : #processing }
WAInitialRenderLoopContinuation >> prepareRoot: aComponent [
	(WAAllPresenterGuide client:
		(WAInitialRequestVisitor request: self requestContext request))
		start: aComponent.
	(WAVisiblePresenterGuide client: (WATaskVisitor new)) start: aComponent
]

{ #category : #accessing }
WAInitialRenderLoopContinuation >> rootClass [
	^ (self application preferenceAt: #rootClass) value
]

{ #category : #accessing }
WAInitialRenderLoopContinuation >> rootDecorationClasses [
	^ (self application preferenceAt: #rootDecorationClasses) collect: [ :each | each value ]
]

{ #category : #private }
WAInitialRenderLoopContinuation >> shouldRedirect [
	"This should probably be made configurable, but for backwards compatibility with Seaside 3.0,
	where we do not redirect when you enter a session, we return false."
	
	^ false
]
