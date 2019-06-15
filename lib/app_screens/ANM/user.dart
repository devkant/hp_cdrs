class User {

  //form 1
  String name;
  Age age;
  Address address;
  int weight = 0;
  String natureOfIllness;

  var gender = 'Male';
  var orderOfBirth = '1';
  var caste = 'SC';
  var bplCard = 'No';
  var growthCurve = 'None';
  var pastIllness = 'No';

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

}

class Age {
  int years;
  int months;
  int days;
}

class Address {
  String area;
  int pincode;
  var district = 'Select here';
  var block = 'Select here';
}