class User {

  String applicationNumber;

  String name;
  var age = Age();
  var address = Address();
  double weight = 0;
  String natureOfIllness;

  var gender = 'Male';
  var orderOfBirth = '1';
  var caste ='SC';
  var bplCard = 'No';
  var growthCurve = 'None';
  var pastIllness = 'No';

  var immunization = List();

  //form 2
  var inabilityToFeed = 'Yes';
  var fever = 'Yes';
  var looseStools = 'Yes' ;
  var vomiting = 'Yes' ;
  var fastBreathing = 'Yes' ;
  var convulsions = 'Yes' ;
  var appearanceOfSkinRashes = 'Yes' ;
  var injury = 'Yes' ;
  String otherSymptoms ;

  //form 3
  var treatmentTaken = 'Yes';
  var treatmentLocation = List();

  //form 4
  //var probable = 'Yes';
  var disease = List();

  //form 5
  String causeOfDeath;
  String advice;
  var placeOfDeath = 'Home';
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
  var district = null;
  var block = null;
}