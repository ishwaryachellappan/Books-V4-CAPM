namespace bookscapmv4.db;

entity GenderVH {
    key code : String(1);
    text : String;
}

entity AgeGroupVH {
    key code : String(1);
    text : String;
}

type allgenders : String enum {
    Male   = 'F';
    Female = 'M';
}

type booksagegroup : String enum {
    Kids  = 'Kids';
    Adult = 'Adult';
}

entity Books {
    key ID           : UUID;
    title            : String;
    author           : String;
    price            : Decimal(10,2);
    publishedDate    : DateTime;
    gender           : allgenders;
    ageGroup         : booksagegroup;
}