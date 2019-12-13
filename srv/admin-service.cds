using db from '../db/schema';

service AdminService @(_requires : 'admin') {
  entity Products as projection on db.Products;
  entity Suppliers as projection on db.Suppliers;
  entity Orders as projection on db.Orders;
}

annotate AdminService.Products with @(
    UI: {   
        LineItem: [
            {$Type: 'UI.DataField', Value: ID},
            {$Type: 'UI.DataField', Value: name},
            {$Type: 'UI.DataField', Value: stock},
            {$Type: 'UI.DataField', Value: retail},
            {$Type: 'UI.DataField', Value: price}
        ],
    }
);

annotate AdminService.Products with {
    ID @( Common: { Label: 'Product ID'} );
    price @( Measures.ISOCurrency: currency_code );
}