using AdminService from '../../srv/admin-service';

// annotate AdminService.Products with @odata.draft.enabled;

// Products List Report Page
annotate AdminService.Products with @(
  UI: {   
      Identification: [{Value:name}],
      SelectionFields: [ name, currency_code],
      LineItem: [
        {Value: ID},     {Value: name},
        {Value: stock},  {Value: retail},
        {Value: price},  {Value: margin},
        {Value: supplier.name}
      ],
  }
);
//	Products Object Page
annotate AdminService.Products with @(
  UI: {
    Facets: [
	    {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', 
	    Target: '@UI.FieldGroup#Details'},
	    {$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', 
	    Target: '@UI.FieldGroup#Admin'},
	],
	FieldGroup#Details: {
	  Data: [
      {Value: ID},
      {Value: name}, {Value: supplier_ID},
	    {Value: price},  {Value: retail},
      {Value: margin}, {Value: stock}
	  ]
	},
	FieldGroup#Admin: {
    Data: [
	    {Value: createdBy},  {Value: createdAt},
		  {Value: modifiedBy}, {Value: modifiedAt}
	  ]
    }
});
