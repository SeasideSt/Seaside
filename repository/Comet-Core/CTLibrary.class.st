Class {
	#name : #CTLibrary,
	#superclass : #WAFileLibrary,
	#category : 'Comet-Core'
}

{ #category : #scripts }
CTLibrary >> cometJs [
	^ '/* Seaside Comet API
 * (c) 2006-2009 Lukas Renggli (renggli@gmail.com)
 */

var Comet = function(url) {
	this.url = url;
	this.iframe = this.createIframe();
	document.body.appendChild(this.iframe);
};

Comet.prototype.connect = function() {
	this.iframe.onLoad = this.onLoad;
	this.iframe.src = this.url;
};

Comet.prototype.disconnect = function() {
	this.iframe.onLoad = this.iframe.src = null;
};

Comet.prototype.onLoad = function() {
	this.disconnect();
	this.connect();
};

Comet.prototype.createIframe = function() {
	var frame = document.createElement("iframe");
	frame.style.display = "block";
	frame.style.visibility = frame.style.overflow = "hidden";
	frame.style.width = frame.style.height = frame.style.border = frame.style.margin = frame.style.padding = "0";
	return frame;
};

Comet.eval = function(code) {
 	return eval(code);
};'
]

{ #category : #accessing }
CTLibrary >> selectorsToInclude [
	^ #( cometJs )
]
