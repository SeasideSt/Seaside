rendering
renderNavigationOn: html
	html div
		class: self cssClass;
		with: [
			self renderTabsOn: html.
			self renderPanelOn: html ]