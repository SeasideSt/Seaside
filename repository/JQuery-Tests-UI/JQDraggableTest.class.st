Class {
	#name : #JQDraggableTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQDraggableTest >> testEvents [
	self
		assert: ((self jQuery: 'div') draggable onDrag: 1)
		equals: self function , '("div").draggable({"drag":function(){1}})'.
	self
		assert: ((self jQuery: 'div') draggable onStart: 2)
		equals: self function , '("div").draggable({"start":function(){2}})'.
	self
		assert: ((self jQuery: 'div') draggable onStop: 3)
		equals: self function , '("div").draggable({"stop":function(){3}})'.
	self
		assert: ((self jQuery: 'div') draggable onStop: (self jQuery ajax callbackDraggable: [ :event |  ]))
		equals: self function , '("div").draggable({"stop":function(){$.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2="+encodeURIComponent($(arguments[1].helper).attr("id")+","+arguments[1].position.top+","+arguments[1].position.left+","+arguments[1].offset.top+","+arguments[1].offset.left)].join("&")})}})'
]
