class product {
  dynamic  name;
 dynamic  price;
  dynamic dec;
 dynamic  cat;
 dynamic  g;
  dynamic num;
  String id;
  String image;

  product({required this.name,required this.price,required this.dec,required this.cat,required this.g,required this.num,required,required this.id,required this.image });

  factory product.fromJson(dynamic jsonData,dou) {
    return product(
   name: jsonData['full_name'],
     price: jsonData['price'],
  cat:    jsonData['cat'],
    g:  jsonData['g'],
 dec:     jsonData['company'],
  num:    jsonData['nm'],
  id: dou,
  image:  jsonData['image'],
    );
  }
}