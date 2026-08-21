sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookscapmodatav4/test/integration/pages/BooksSetList.gen",
	"bookscapmodatav4/test/integration/pages/BooksSetObjectPage.gen",
	"bookscapmodatav4/test/integration/pages/ChaptersObjectPage.gen"
], function (JourneyRunner, BooksSetListGenerated, BooksSetObjectPageGenerated, ChaptersObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookscapmodatav4') + '/test/flpSandbox.html#bookscapmodatav4-tile',
        pages: {
			onTheBooksSetListGenerated: BooksSetListGenerated,
			onTheBooksSetObjectPageGenerated: BooksSetObjectPageGenerated,
			onTheChaptersObjectPageGenerated: ChaptersObjectPageGenerated
        },
        async: true
    });

    return runner;
});

