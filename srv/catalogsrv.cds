using {bookscapmv4.db as mybook} from '../db/booksmodelv4';

service LibraryService  {
    @odata.draft.enabled
    entity BooksSet   as projection on mybook.Books;


    entity GenderVH   as projection on mybook.GenderVH;

    entity AgegroupVH as projection on mybook.AgeGroupVH;

    entity Chapters as projection on mybook.chapters;
}


annotate LibraryService.BooksSet with @UI: {

    // =========================================
    // TABLE COLUMNS
    // =========================================

    LineItem       : [

        {
            $Type: 'UI.DataField',
            Value: title,
            Label: 'Book Title'
        },

        {
            $Type: 'UI.DataField',
            Value: author,
            Label: 'Author'
        },

        {
            $Type: 'UI.DataField',
            Value: price,
            Label: 'Price'
        },

        {
            $Type: 'UI.DataField',
            Value: publishedDate,
            Label: 'Published Date'
        },

        {
            $Type: 'UI.DataField',
            Value: gender,
            Label: 'Gender'
        },

        {
            $Type: 'UI.DataField',
            Value: ageGroup,
            Label: 'Age Group'
        }

    ],


    // =========================================
    // FILTER / SELECTION FIELDS
    // =========================================

    SelectionFields: [

        title,
        author,
        price,
        gender,
        ageGroup,
        publishedDate

    ],


    // =========================================
    // OBJECT PAGE HEADER
    // =========================================

    HeaderInfo     : {

        TypeName      : 'Book',

        TypeNamePlural: 'Books',

        Title         : {
            $Type: 'UI.DataField',
            Value: title
        },

        Description   : {
            $Type: 'UI.DataField',
            Value: author
        }

    },


    // =========================================
    // OBJECT PAGE FACETS
    // =========================================

    Facets         : [

        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInformation',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralInformation'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'BookDetails',
            Label : 'Book Details',
            Target: '@UI.FieldGroup#BookDetails'
        }

    ]

};


// =========================================
// GENERAL INFORMATION FIELD GROUP
// =========================================

annotate LibraryService.BooksSet with @UI.FieldGroup #GeneralInformation: {

Data: [

    {
        $Type: 'UI.DataField',
        Value: title,
        Label: 'Book Title'
    },

    {
        $Type: 'UI.DataField',
        Value: author,
        Label: 'Author'
    },

    {
        $Type: 'UI.DataField',
        Value: gender,
        Label: 'Gender'
    },

    {
        $Type: 'UI.DataField',
        Value: ageGroup,
        Label: 'Age Group'
    }

]

};


// =========================================
// BOOK DETAILS FIELD GROUP
// =========================================

annotate LibraryService.BooksSet with @UI.FieldGroup #BookDetails: {

Data: [

    {
        $Type: 'UI.DataField',
        Value: price,
        Label: 'Price'
    },

    {
        $Type: 'UI.DataField',
        Value: publishedDate,
        Label: 'Published Date'
    }

]

};


annotate LibraryService.BooksSet with {

    gender @(
        Common.ValueList : {
            CollectionPath : 'GenderVH',

            Parameters : [

                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : gender,
                    ValueListProperty : 'code'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'text'
                }

            ]
        }
    )

};

annotate LibraryService.BooksSet with {

    ageGroup @(
        Common.ValueList : {
            CollectionPath : 'AgegroupVH',

            Parameters : [

                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ageGroup,
                    ValueListProperty : 'code'
                },

                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'text'
                }

            ]
        }
    )

};