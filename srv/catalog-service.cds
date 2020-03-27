using my.domain from '../db/schema';

@(path : '/shop', requires: 'authenticated-user')
service CatalogService {

    @readonly
    entity Products as projection on domain.Products {
         *, retail @(title: '{i18n>consumerPrice}') }
        excluding { 
            createdBy, modifiedBy,
            createdAt, modifiedAt,
            price, margin, supplier
        };

    entity Orders @(restrict: [
        {grant: ['READ', 'WRITE'], to: 'admin'},
        {grant: 'READ', where: 'createdBy = $user'},
        {grant: 'WRITE', to: 'authenticated-user'}
        ])       
        as projection on domain.Orders;
}
