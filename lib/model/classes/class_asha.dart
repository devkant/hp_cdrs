
class Child {
  final String  name;
  final String  district;
  final String  block;
  final String  address;
  final String  ashaName;

  Child(
    this.name,
    this.district,
    this.block,
    this.address,
    this.ashaName,
  );

  Child.fromJson(Map<String,dynamic> json)
      : name  = json['name'],
        district  = json['district'],
        block = json['block'],
        address = json['address'],
        ashaName = json['ashaName'];



  Map<String, dynamic>  toJson()  =>{
    'name': name,
    'district': district,
    'block' : block,
    'address' : address,
    'ashaName':  ashaName,
  };

}