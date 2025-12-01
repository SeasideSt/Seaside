"
I send #flush to the HTTP response (WAResponse) after HTML <head> element has been fully rendered and closed and the HTML <body> has been opened. This results in this part of the the HTML document being sent to the browser. This allows the browser to prefetch the resources (styles, scripts, ...) possibly resulting in faster page loads.

This only works with a streaming server adapter, for example one using WAComboResponse.
"
Class {
	#name : 'WAFlushingRenderPhaseContinuation',
	#superclass : 'WARenderPhaseContinuation',
	#category : 'Seaside-RenderLoop-Continuations',
	#package : 'Seaside-RenderLoop',
	#tag : 'Continuations'
}

{ #category : 'processing' }
WAFlushingRenderPhaseContinuation >> documentOpened: aResponse [
	aResponse flush
]
