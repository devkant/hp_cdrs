
class Child {
  final String  name;
  final String  years;
  final String  months;
  final String  days;
  final String  sex;
  final String  fatherName;
  final String  phnNumber;
  final String  district;
  final String  block;
  final String  address;
  final String  village;
  final String  ashaName;

  Child(
    this.name,
    this.years,
    this.months,
    this.days,
    this.sex,
    this.fatherName,
    this.phnNumber,
    this.district,
    this.block,
    this.address,
    this.village,
    this.ashaName,
  );

  Child.fromJson(Map<String,dynamic> json)
      : name  = json['name'],
        years = json['years'],
        months = json['months'],
        days = json['days'],
        sex = json['sex'],
        fatherName = json['fatherName'],
        phnNumber = json['phnNumber'],
        district  = json['district'],
        block = json['block'],
        address = json['address'],
        village = json['village'],
        ashaName = json['ashaName'];



  Map<String, dynamic>  toJson()  =>{
    'name' : name,
    'years' : years,
    'months' : months,
    'days' : days,
    'sex' : sex,
    'fatherName': fatherName,
    'phnNumber' : phnNumber,
    'district' : district,
    'block' : block,
    'address' : address,
    'village' : village,
    'ashaName' :  ashaName,
  };

}