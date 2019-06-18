class user{

  user(
//  this.applicationNumber,
//  //drop down
//  this.district,
//
//  //text fields
//  this.block,
//  this.village,
//  this.phc,
//  this.subCenter,
//  this.rhc,
//  this.year,
//  this.head,
//  this.name,
//  this.mother,
//
//
//  //form pg 2
//  //date vars
//  this.dob,
//  this.dod,
//
//  //radios
//  this.liveWith,
//  this.sex,
//  this.ageInDays,
//
//  //drop downs
//  this.relationship,
//  this.respondentEducation,
//  this.category,
//  this.religion,
//  this.placeOfDeath,
//
//  //text fields
//  this.respondent,
//  this.address,
//  this.pin,
//  this.probableCause,
//
//
//  //form pg 3
//
//  //radios
//  this.injury,
//  this.td,
//  this.complications,
//  this.singleOrMultiple,
//  this.umbilicalCord,
//
//  //drop downs
//  this.kindOfInjury,
//  this.birthPlace,
//  this.attendedDelivery,
//
//  //checkbox list
//  this.complicationsType,
//
//
//  //textfields
//  this.pregnancyDuration,
//  this.mothersAge,
//
//
//  //form pg 4
//  //radios
//  this.moveCryBreathe,
//  this.bruises,
//  this.malformations,
//  this.stopCry,
//  this.daysAfterStoppedCrying,
//  this.otherThanBreastMilk,
//  this.suckleNormally,
//  this.StopSuckingInNormalWay,
//  this.CompletedDays,
//
//  //checkbox
////  bool weightCheck = false;
//
//  //drop downs
//  this.size,
//  this.firstBreastfed,
//
//  this.weight,
//
//
//  //form pg 5
//  this.fever,
//  this.feverDays,
//  this.difficultyBreathing,
//  this.difficultyBreathingDays,
//  this.fastBreathing,
//  this.fastBreathingDays,
//  this.inDrawingChest,
//  this.cough,
//  this.grunting,
//  this.nostrilsFlare,
//
//
//  //form pg 6
//  this.diarrhoea,
//  this.diarrhoeaDays,
//  this.vomit,
//  this.vomitDays,
//  this.rednessAroundUmbilicalCord,
//  this.pustulesRashes,
//  this.yellowEyesOrSkin,
//  this.spasmsOrFits,
//  this.unresponsiveOrUnconscious,
//
//
//  //form pg 7
//  this.bulgingFontanelle,
//  this.cold,
//  this.legsDiscoloured,
//  this.yellow,
//  this.blood,
//
//
//  //form pg 8
//  this.narrativeLanguageCode,
//  this.symptoms,
  );

  //form pg 1
  String applicationNumber = '';
  //drop down
  String district = null;

  //text fields
  String block = null;
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
  String dob = null;
  String dod = null;

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

  //text fields
  String respondent = '';
  String address = '';
  num pin;
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
//  bool weightCheck = false;

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
  String symptoms = '';


  user.fromJson(Map<String,dynamic> json)
      :applicationNumber = json['applicationNumber'],
        district = json['district'],
        block = json['block'],
        village = json['village'],
        phc = json['phc'],
        subCenter = json['subCenter'],
        rhc = json['rhc'],
        year = json['year'],
        head = json['head'],
        name = json['name'],
        mother = json['mother'],
        dob = json['dob'],
        dod = json['dod'],
        liveWith = json['liveWith'],
        sex = json['sex'],
        ageInDays = json['ageInDays'],
        relationship = json['relationship'],
        respondentEducation = json['respondentEducation'],
        category = json['category'],
        religion = json['religion'],
        placeOfDeath = json['placeOfDeath'],
        respondent = json['respondent'],
        address = json['address'],
        pin = json['pin'],
        probableCause = json['probableCause'],
        injury = json['injury'],
        td = json['td'],
        complications = json['complications'],
        singleOrMultiple = json['singleOrMultiple'],
        umbilicalCord = json['umbilicalCord'],
        kindOfInjury = json['kindOfInjury'],
        birthPlace = json['birthPlace'],
        attendedDelivery = json['attendedDelivery'],
        complicationsType = json['complicationsType'],
        pregnancyDuration = json['pregnancyDuration'],
        mothersAge = json['mothersAge'],
        moveCryBreathe = json['moveCryBreathe'],
        bruises = json['bruises'],
        malformations = json['malformations'],
        stopCry = json['stopCry'],
        daysAfterStoppedCrying = json['daysAfterStoppedCrying'],
        otherThanBreastMilk = json['otherThanBreastMilk'],
        suckleNormally = json['suckleNormally'],
        StopSuckingInNormalWay = json['StopSuckingInNormalWay'],
        CompletedDays = json['CompletedDays'],
        size = json['size'],
        firstBreastfed = json['firstBreastfed'],
        weight = json['weight'],
        fever = json['fever'],
        feverDays = json['feverDays'],
        difficultyBreathing = json['difficultyBreathing'],
        difficultyBreathingDays = json['difficultyBreathingDays'],
        fastBreathing = json['fastBreathing'],
        fastBreathingDays = json['fastBreathingDays'],
        inDrawingChest = json['inDrawingChest'],
        cough = json['cough'],
        grunting = json['grunting'],
        nostrilsFlare = json['nostrilsFlare'],
        diarrhoea = json['diarrhoea'],
        diarrhoeaDays = json['diarrhoeaDays'],
        vomit = json['vomit'],
        vomitDays = json['vomitDays'],
        rednessAroundUmbilicalCord = json['rednessAroundUmbilicalCord'],
        pustulesRashes = json['pustulesRashes'],
        yellowEyesOrSkin = json['yellowEyesOrSkin'],
        spasmsOrFits = json['spasmsOrFits'],
        unresponsiveOrUnconscious = json['unresponsiveOrUnconscious'],
        bulgingFontanelle = json['bulgingFontanelle'],
        cold = json['cold'],
        legsDiscoloured = json['legsDiscoloured'],
        yellow = json['yellow'],
        blood = json['blood'],
        narrativeLanguageCode = json['narrativeLanguageCode'],
        symptoms = json['symptoms'];


      Map<String, dynamic>  toJson()  =>{
    'applicationNumber': applicationNumber,
    'district': district,
    'block': block,
    'village': village,
    'phc': phc,
    'subCenter': subCenter,
    'rhc': rhc,
    'year': year,
    'head': head,
    'name': name,
    'mother': mother,
    'dob': dob,
    'dod': dod,
    'liveWith': liveWith,
    'sex': sex,
    'ageInDays': ageInDays,
    'relationship': relationship,
    'respondentEducation': respondentEducation,
    'category': category,
    'religion': religion,
    'placeOfDeath': placeOfDeath,
    'respondent': respondent,
    'address': address,
    'pin': pin,
    'probableCause': probableCause,
    'injury': injury,
    'td': td,
    'complications': complications,
    'singleOrMultiple': singleOrMultiple,
    'umbilicalCord': umbilicalCord,
    'kindOfInjury': kindOfInjury,
    'birthPlace': birthPlace,
    'attendedDelivery': attendedDelivery,
    'complicationsType': complicationsType,
    'pregnancyDuration': pregnancyDuration,
    'mothersAge': mothersAge,
    'moveCryBreathe': moveCryBreathe,
    'bruises': bruises,
    'malformations': malformations,
    'stopCry': stopCry,
    'daysAfterStoppedCrying': daysAfterStoppedCrying,
    'otherThanBreastMilk': otherThanBreastMilk,
    'suckleNormally': suckleNormally,
    'StopSuckingInNormalWay': StopSuckingInNormalWay,
    'CompletedDays': CompletedDays,
    'size': size,
    'firstBreastfed': firstBreastfed,
    'weight': weight,
    'fever': fever,
    'feverDays': feverDays,
    'difficultyBreathing': difficultyBreathing,
    'difficultyBreathingDays': difficultyBreathingDays,
    'fastBreathing': fastBreathing,
    'fastBreathingDays': fastBreathingDays,
    'inDrawingChest': inDrawingChest,
    'cough': cough,
    'grunting': grunting,
    'nostrilsFlare': nostrilsFlare,
    'diarrhoea': diarrhoea,
    'diarrhoeaDays': diarrhoeaDays,
    'vomit': vomit,
    'vomitDays': vomitDays,
    'rednessAroundUmbilicalCord': rednessAroundUmbilicalCord,
    'pustulesRashes': pustulesRashes,
    'yellowEyesOrSkin': yellowEyesOrSkin,
    'spasmsOrFits': spasmsOrFits,
    'unresponsiveOrUnconscious': unresponsiveOrUnconscious,
    'bulgingFontanelle': bulgingFontanelle,
    'cold': cold,
    'legsDiscoloured': legsDiscoloured,
    'yellow': yellow,
    'blood': blood,
    'narrativeLanguageCode': narrativeLanguageCode,
    'symptoms': symptoms,
  };
}