rendering
renderSummaryOn: html

	summaryReport rows: self objectLogSummary.
	html render: summaryReport