initialization
initializeTabs
	tabs := OrderedCollection new
		add: 'Welcome' -> (Array
			with: 'Welcome' -> SUWelcomeTest new
			with: 'Counter' -> SUCounterTest new);
		add: 'Window' -> (Array
			with: 'Window' -> SUWindowTest new
			with: 'Lightbox' -> SULightboxTest new
			with: 'TitlePane' -> SUTitlePaneTest new
			with: 'Splitter Vertical'-> SUVerticalSplitterTest new
			with: 'Splitter Horizontal'-> SUHorizontalSplitterTest new);
		add: 'Navigation' -> (Array
			with: 'TabPanel' -> SUTabPanelTest new
			with: 'Accordion' -> SUAccordionTest new
			with: 'Carousel' -> SUCarouselTest new
			with: 'Carousel Horizontal'-> SUCarouselHorizontalTest new
			with: 'Carousel Vertical'-> SUCarouselVerticalTest new);
		add: 'Controls' -> (Array
			with: 'TieredList' -> SUTieredListTest new
			with: 'TreeReport' -> SUTreeReportTest new
			with: 'DatePicker' -> SUDatePickerTest new);
		yourself