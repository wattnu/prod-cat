using my.domain from '../db/schema';

service AdminService @(requires : 'admin') {
  entity Products as projection on domain.Products;
  entity Suppliers as projection on domain.Suppliers
  entity Orders as projection on domain.Orders;
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