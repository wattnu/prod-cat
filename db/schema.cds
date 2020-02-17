using {cuid, managed, Currency} from '@sap/cds/common';
using my.common.Address from './common';

namespace my.domain;

entity Products : managed {
  key ID       : Integer;
      name     : localized String(100) @title : '{i18n>productName}'; //> readable key
      stock    : Integer;
      price    : Decimal(9, 2) @title : '{i18n>price}';
      retail   : Decimal(9, 2) @title : '{i18n>retail}';
      currency : Currency;
      supplier : Association to Suppliers;
}

entity Suppliers : managed, Address {
  key ID       : Integer;
      name     : String(100);
      products : Association to many Products on products.supplier = $self;
}

entity Orders : managed {
  key ID       : UUID;
      orderNo  : String         @title : '{i18n>orderNo}'; //> readable key
      supplier : Association to Suppliers;
      Items    : Composition of many OrderItems on Items.parent = $self;
      total    : Decimal(9, 2)  @readonly;
      currency : Currency;
}

entity OrderItems {
  key ID        : UUID;
      parent    : Association to Orders;
      product   : Association to Products;
      amount    : Integer;
}