rendering
renderContentOn: html
	html div
		script: (html jQuery new tabs
			active: selectedTab;
			onBeforeActivate: (html jQuery ajax 
				callbackTabs: [ :event | selectedTab:= event at: #index ]));
		with: [
			html unorderedList: [
				self berries keysAndValuesDo: [ :name :description |
					html listItem: [
						html anchor
							url: (html jQuery ajax
								html: [ :h | h text: description ];
								fullUrl);
							with: name ] ] ] ]
