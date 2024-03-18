namespace com.ibm;

using { demo.reuse as spiderman} from './reuse';
using { cuid,temporal,managed } from '@sap/cds/common';


context demo {
    //reusable type to reference data types again and again
   // type Guid : String(32);
    entity student:spiderman.address {
        key id: spiderman.Guid; //key id: Guid;//key id: String(32);
        firstName: String(80);
        lastName: String(80);
        // Create foreign key relationship between tables
        grade: Association to one class;
        gender: String(1)
        }

    entity class {
        key id: Int16;
        className: String(80);
        semester: Int16;
        specialization: String(60);
    }
    entity book {
        key id: spiderman.Guid;//key id: String(32);
        bookName: localized String(80);
        author:String(60);
    }
}
context trans {
    entity subscriptions :cuid, temporal,managed{
        //key id: spiderman.Guid; //key id: demo.Guid;// key id: String(32);
        student: Association to one demo.student;
        book: Association to one demo.book;
    }
}

