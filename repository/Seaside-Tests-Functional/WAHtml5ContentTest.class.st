Class {
	#name : #WAHtml5ContentTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAHtml5ContentTest >> label [
	^ 'Html 5 Content Model'
]

{ #category : #rendering }
WAHtml5ContentTest >> renderContentOn: html [
	html header: [
		html heading level1;
			with: [
				html anchor
					url: 'http://www.elharo.com/blog';
					with: 'Mokka mit Schlag' ] ].
	html section: [
		html article: [
			html heading level2;
				with: [
					html anchor
						url: '/blog/birding/2007/04/23/spring-comes-and-goes-in-sussex-county/';
						with: 'Spring Comes (and Goes) in Sussex County' ].
				html paragraph: 'Yesterday I joined the Brooklyn Bird Club for our annual trip to Western New Jersey, specifically Hyper Humus, a relatively recently discovered hot spot. It started out as a nice winter morning when we arrived at the site at 7:30 A.M., progressed to Spring around 10:00 A.M., and reached early summer by 10:15.' ].
		html article: [
			html heading level2;
				with: [
					html anchor
						url: '/blog/birding/2007/04/23/but-does-it-count-for-your-life-list/';
						with: 'But does it count for your life list?' ].
			html paragraph: [
				html text: 'Seems you can now go '.
				html anchor
					url: 'http://www.wired.com/science/discoveries/news/ 2007/04/cone_sf';
					with: 'bird watching via the Internet'.
				html text: '. I haven''t been able to test it out yet (20 user limit apparently) but this is certainly cool. Personally, I can''t imagine it replacing actually being out in the field by any small amount. On the other hand, I''ve always found it quite sad to meet senior birders who are no longer able to hold binoculars steady or get to the park. I can imagine this might be of some interest to them. At least one elderly birder did a big year on TV, after he could no longer get out so much. This certainly tops that.' ] ] ].
	
	html navigation: [
		html anchor
			url: '/blog/page/2/';
			with: '<< Previous Entries' ].
		
	html navigation: [
		html unorderedList: [
			html listItem: [
				html heading level2;
					with: 'Info'.
				html unorderedList: [
					html listItem: [
						html anchor
							url: '/blog/comment-policy/';
							with: 'Comment Policy' ].
					html listItem: [
						html anchor
							url: '/blog/todo-list/';
							with: 'Todo List' ] ] ].
			html listItem: [
				html heading level2;
					with: 'Archives'.
				html unorderedList: [
					html listItem: [
						html anchor
							url: '/blog/2007/04/';
							with: 'April 2007' ].
					html listItem: [
						html anchor
							url: '/blog/2007/02/';
							with: 'February 2007' ] ] ].
					html listItem: [
						html anchor
							url: '/blog/2007/01/';
							with: 'January 2007' ] ] ].
				
	html aside: [
		html heading level3
			with: '.xf-value'.
		html paragraph: [
			html text: 'The '.
			html code: '.xf-value'.
			html text: ' selector used here styles the input field value but not its label. This is actually inconsistent with the current CSS3 draft. The example really should use the '.
			html code: '::value'.
			html text: 'pseudo-class instead like so:' ].
		html preformatted: 
'input::value { width: 20em; }
#ccnumber::value { width: 18em }
#zip::value { width: 12em }
#state::value { width: 3em  }'. 
		html paragraph: 'However, Firefox doesn''t yet support this syntax' ].
				
	html footer: [
		html paragraph: 'Copyright 2007 Elliotte Rusty Harold' ]
]
