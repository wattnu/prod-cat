using CatalogService from '../../srv/catalog-service';

// Products List Page
annotate CatalogService.Products with @(
    UI: {   
        Identification: [{Value:name}],
        SelectionFields: [ name, currency_code],
        LineItem: [
            {Value: ID},
            {Value: name},
            {Value: retail}
        ],
    }
);

//	Products Object Page
annotate CatalogService.Products with @(
	UI: {
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'},
		],
		FieldGroup#Details: {
			Data: [
                {Value: name},
                {Value: retail} 
			]
		}
	}
);
