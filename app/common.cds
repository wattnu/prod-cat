using my.domain from '../db/schema';

// annotate domain.Products with @fiori.draft.enabled;

annotate domain.Products with {
    ID @( Common.Label: 'ID' );
	supplier @( Common.Label: '{i18n>SupplierID}' );
    price @( Measures.ISOCurrency: currency_code );
    retail @( Measures.ISOCurrency: currency_code );
    margin @( Measures.ISOCurrency: currency_code );
}
// For Product details
annotate domain.Products with @(
	UI: {
  	  HeaderInfo: {
  		TypeName: '{i18n>Product}',
  		TypeNamePlural: '{i18n>Products}',
  		Title: {Value: name},
		Description: {Value: name}
  	  },
	}
);