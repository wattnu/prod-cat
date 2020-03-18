/*
   Implementations for AdminService defined in ./admin-service.cds
*/
module.exports = (srv)=>{

    // Use reflection to get the definition of Products
    const {Products, Orders} = cds.entities
  
    // Compute margin after a READ operation
    srv.after ('READ','Products', (each)=>{
      let num = each.retail - each.price;
      each.margin = num.toFixed(2);  // comply to Decimals(9,2)
    })

}