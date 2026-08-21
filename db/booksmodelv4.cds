namespace bookscapmv4.db;

entity GenderVH {
    key code : String(1);
    text : String;
}

entity AgeGroupVH {
    key code : String;
    text : String;
}

type allgenders : String enum {
    Male   = 'F';
    Female = 'M';
}

type booksagegroup : String enum {
    Kids  = 'K';
    Adult = 'A';
}

entity Books {
    key ID           : UUID;
    title            : String;
    author           : String;
    price            : Decimal(10,2);
    publishedDate    : DateTime;
    gender           : allgenders;
    ageGroup         : booksagegroup;

    chapters : Composition of many chapters on chapters.books = $self;
}

entity chapters {
    key ID : UUID ;
    title : String;
    pages : Integer;

    books : Association to Books;

}