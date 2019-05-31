
class Child {
  String  name,district,block,address,phoneNumber;

  Child({
    this.name,
    this.district,
    this.block,
    this.address,
    this.phoneNumber,
  });

  factory Child.fromJson(Map<String,dynamic> json){
    return  new Child(
      name: json['name'],
      district: json['district'],
      block: json['block'],
      address: json['address'],
      phoneNumber: json['phoneNumber']

    );

  }
}