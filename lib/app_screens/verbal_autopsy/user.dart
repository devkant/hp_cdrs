class user{


  //form pg 1

  //drop down
  String district='';

  //textfield
  String block = '';
  String village = '';
  String phc = '';
  String subCenter = '';
  num rhc;
  num year;
  String head = '';
  String name = '';
  String mother = '';


  //form pg 2
  //date vars
  String dob = '';
  String dod = '';

  //radios
  var liveWith = '';
  var sex = '';
  var ageInDays = '';

  //drop downs
  var relationship = '';
  var respondentEducation = '';
  var category = '';
  var religion = '';
  var placeOfDeath = '';

  //textfields
  String respondent = '';
  String address = '';
  num pin;  //not in schema atm
  String probableCause = '';


  //form pg 3

  //radios
  var injury = '';
  var td = '';
  var complications = '';
  var singleOrMultiple = '';
  var umbilicalCord = '';

  //drop downs
  var kindOfInjury = null;
  var birthPlace = '';
  var attendedDelivery = '';

  //checkbox list
  List complicationsType = List();


  //textfields
  num pregnancyDuration;
  num mothersAge;


  //form pg 4
  //radios
  var moveCryBreathe = '';
  var bruises = '';
  var malformations = '';
  var stopCry = '';
  var daysAfterStoppedCrying = '';
  var otherThanBreastMilk = '';
  var suckleNormally = '';
  var StopSuckingInNormalWay = '';
  var CompletedDays = '';

  //checkbox
  bool weightCheck = false; //not in schema atm

  //drop downs
  var size = '';
  var firstBreastfed = '';

  num weight;


  //form pg 5
  var fever = '';
  var feverDays = '';
  var difficultyBreathing = '';
  var difficultyBreathingDays = '';
  var fastBreathing = '';
  var fastBreathingDays = '';
  var inDrawingChest = '';
  var cough = '';
  var grunting = '';
  var nostrilsFlare = '';


  //form pg 6
  var diarrhoea = '';
  var diarrhoeaDays = '';
  var vomit = '';
  var vomitDays = '';
  var rednessAroundUmbilicalCord = '';
  var pustulesRashes = '';
  var yellowEyesOrSkin = '';
  var spasmsOrFits = '';
  var unresponsiveOrUnconscious = '';


  //form pg 7
  var bulgingFontanelle = '';
  var cold = '';
  var legsDiscoloured = '';
  var yellow = '';
  var blood = '';

  //form pg 8
  String narrativeLanguageCode = '';
  String symptoms = ''; //not in schema atm

  bool knowledgeCheck = false; //not in schema atm

}