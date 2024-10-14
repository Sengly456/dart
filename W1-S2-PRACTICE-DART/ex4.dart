void main() {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
   const orders = [];
  
  List<double> orderPrice=orders
  .where((order)=>pizzaPrices.containsKey(order))
  .map((order)=>pizzaPrices[order]!).toList();
  String result=orderPrice.isNotEmpty?"total:\$${orderPrice.reduce((value, price) => value+price)}":"pineapple pizza is not on the menu";

  print(result);

  // if(orderPrice.isNotEmpty){
  //   double totalPrice=orderPrice.reduce((total,price)=>total+price);
  //   print("total: \$$totalPrice");
  // }else{
  //   print("pineapple pizza is not on the menu");
  // }


}
