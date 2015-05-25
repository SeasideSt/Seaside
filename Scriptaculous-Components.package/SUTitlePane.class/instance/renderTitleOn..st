rendering
renderTitleOn: html
	html anchor class: 'title'; 
		callback: [ open := open not ];
		onClick: (html prototype evaluator
						callback: [ :script | self scriptToggleOn: script ];
						return: false);
		 with: [
			html table
				style: 'width:100%';
				cellspacing: 0;
				with: [
					html tableRow: [
						html tableData
							class: 'label';
							with: title.
						html tableData: [
							html div
								id: 'gfx',uid;
								class: 'gfxopen' if: open;
								class: 'gfx' if: open not ] ] ] ]