using {cuid, managed, Currency} from '@sap/cds/common';
using common.Address from './address';

namespace db;

entity Products : managed {
  key ID            : Integer;
      name          : localized String(100);
      descr         : localized String(1000);
      stock         : Integer;
      purchasePrice : Decimal(9, 2);
      retailPrice   : Decimal(9, 2);
      currency      : Currency;
      supplier      : Association to Suppliers;
}

entity Suppliers : managed, Address {
  key ID       : Integer;
      name     : String(100);
      products : Association to many Products on products.supplier = $self;
}

entity Orders : managed {
  key ID       : UUID;
      OrderNo  : String       @title : 'Order Number'; //> readable key
      Items    : Composition of many OrderItems on Items.parent = $self;
      total    : Decimal(9, 2)@readonly;
      currency : Currency;
}

entity OrderItems : cuid {
  parent    : Association to Orders;
  product   : Association to Products;
  amount    : Integer;
  netAmount : Decimal(9, 2);
}