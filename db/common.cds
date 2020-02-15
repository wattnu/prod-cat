namespace my.common;
using {Country} from '@sap/cds/common';

aspect Address {
    street  : String(100);
    postcode : String(20);
    town    : String(40);
    country : Country; 
}
