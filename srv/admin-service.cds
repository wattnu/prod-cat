using db from '../db/schema';

service AdminService @(_requires : 'admin') {
  entity Products as projection on db.Products;
  entity Suppliers as projection on db.Suppliers;
  entity Orders as projection on db.Orders;
}