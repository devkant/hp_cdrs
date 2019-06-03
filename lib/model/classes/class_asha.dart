
class Child {
  final String  name;
  final String  district;
  final String  block;
  final String  address;
  final String  phoneNumber;

  Child(
    this.name,
    this.district,
    this.block,
    this.address,
    this.phoneNumber,
  );

  Child.fromJson(Map<String,dynamic> json)
      : name  = json['name'],
        district  = json['district'],
        block = json['block'],
        address = json['address'],
        phoneNumber = json['phoneNumber'];



  Map<String, dynamic>  toJson()  =>{
    'name': name,
    'district': district,
    'block' : block,
    'address' : address,
    'phoneNumber':  phoneNumber,
  };

}