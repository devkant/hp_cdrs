//import 'package:json_annotation/json_annotation.dart';
//


//@JsonSerializable()
class User {

//  User(
//      this.applicationNumber,
//      this.name,
//      this.age,
//      this.gender,
//      this.address,
//      this.orderOfBirth,
//      this.caste,
//      this.immunization,
//      this.bplCard,
//      this.weight,
//      this.growthCurve,
//      this.pastIllness,
//
//      this.inabilityToFeed,
//      this.fever,
//      this.looseStools,
//      this.vomiting,
//      this.fastBreathing,
//      this.convulsions,
//      this.appearanceOfSkinRashes,
//      this.injury,
//      this.otherSymptoms,
//
//      this.treatmentTaken,
//      this.treatmentLocation,
//
//      this.probable,
//      this.disease,
//
//      this.causeOfDeath,
//
//      this.delay,
//
//      this.advice,
//   );

  String applicationNumber;
  //form 1
  String name;
  Age age ;
  var address = Address();
  double weight = 0;
  String natureOfIllness;

  var gender ;//= 'Male';
  var orderOfBirth ;//= '1';
  var caste ;//= 'SC';
  var bplCard ;//= 'No';
  var growthCurve;// = 'None';
  var pastIllness ;//= 'No';

  var immunization = List();

  //form 2
  int inabilityToFeed ;
  int fever ;
  int looseStools ;
  int vomiting ;
  int fastBreathing ;
  int convulsions ;
  int appearanceOfSkinRashes ;
  int injury ;
  String otherSymptoms ;

  //form 3
  var treatmentTaken = 'No';
  var treatmentLocation = List();

  //form 4
  var probable = 'No';
  var disease = List();

  //form 5
  String causeOfDeath;
  String advice;
  var delay = List();

//  factory User.fromJson(Map<String,dynamic> json)  =>  _$UserFromJson();
//  Map<String,dynamic> toJson() => _$UserToJson(this);

  User.fromJson(Map<String, dynamic> json)
    : applicationNumber = json['applicationNumber'],
      name = json['name'],
      age = json['age'],
      gender = json['sex'],
      address = json['address'],
      orderOfBirth = json['orderOfBirth'],
      caste = json['caste'],
      immunization = json['immunization'],
      bplCard = json['bplCard'],
      weight = json['weight'],
      growthCurve = json['growthCurve'],
      pastIllness = json['pastIllness'],
      natureOfIllness = json['natureOfIllness'],

        inabilityToFeed = json['inabilityToFeed'],
        fever = json['fever'],
        looseStools = json['looseStools'],
        vomiting = json['vomiting'],
        fastBreathing = json['fastBreathing'],
        convulsions = json['convulsions'],
        appearanceOfSkinRashes = json['appearanceOfSkinRashes'],
        injury = json['injury'],
        otherSymptoms = json['otherSymptom'],

        treatmentTaken = json['treatmentTaken'],
        treatmentLocation = json['treatmentLocation'],

        probable = json['probable'],
        disease = json['disease'],

        causeOfDeath = json['causeOfDeath'],

        delay = json['delay'],

        advice = json['advice'];

  Map<String, dynamic> toJson() =>
      {
        'applicationNumber': applicationNumber,
        // User reference

        //Background Information
        'name': name,
        'age.years': age.years,
        'age.months': age.months,
        'age.days': age.days,
        'sex': gender,
        'address.pincode': address.pincode,
        'address.district': address.district,
        'address.block': address.block,
        'address.area': address.area,
        'orderOfBirth': orderOfBirth,
        'caste' : caste,
        'immunization': immunization,
        'bplCard': bplCard,
        'weight': weight,
        'growthCurve': growthCurve,
        'pastIllness': pastIllness,
        'natureOfIllness': natureOfIllness,

        // Symptoms during Illness
        'inabilityToFeed': inabilityToFeed,
        'fever': fever,
        'looseStools': looseStools,
        'vomiting': vomiting,
        'fastBreathing': fastBreathing,
        'convulsions': convulsions,
        'appearanceOfSkinRashes': appearanceOfSkinRashes,
        'injury': injury,
        'otherSymptom': otherSymptoms,

        // Details of treatment
        'treatmentTaken': treatmentTaken,
        'treatmentLocation': treatmentLocation,

        'Probable': probable,
        'disease': disease,

        // According to the respondent, cause of death
        'causeOfDeath': causeOfDeath,

        // Occurence of delay
        'delay': delay,

        // Advice according to analysis
        'advice': advice,
      };


}



class Age {
  int years;
  int months;
  int days;

//  Age(
//      this.years,
//      this.months,
//      this.days,
//   )

}

class Address {
  String area;
  int pincode;
  var district = null;
  var block = null;

//  Address(
//      this.area,
//      this.pincode,
//      this.district,
//      this.block,
//   )
//
//  factory Address.fromJson(Map<String,dynamic> json)  =>  _$AddressFromJson();
//  Map<String,dynamic> toJson() => _$AddressToJson(this);

}