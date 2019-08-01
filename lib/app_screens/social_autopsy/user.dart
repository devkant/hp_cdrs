class User {

 User();

  String applicationNumber = '';

  String referenceId = "";
  String MCTS = "";
  String nameOfInformant = "";
  String telephoneNumber = "";
  int familyMembers = 0;
  int children = 0 ;
  String caste = "";
  String religion = "";
  String bplCard = 'no';



  String seekCareOutside = 'no';
  bool wasIllnessSerious = false;
  bool moneyNotAvailable = false;
  bool familyMembersNotAbleAccompany = false;
  bool badWeather = false;
  bool didNotKnowAboutInfant = false;
  bool noHopeForSurvival = false;
  bool transportNotAvailable = false;
  String others ='';

  bool quack = false;
  bool traditionalHealer = false;
  bool subCentre = false;
  bool phc = false;
  bool chc = false;
  bool subDistrictHospital = false;
  bool districtGovtHospital = false;
  bool privateAllopathic = false;
  bool doctorAlternateSystem = false;
  String reasonForSeekingCare = '' ;
  String ashaAdviceOnHospitalTreatment = 'no';
  String conditionWhenMedical = 'Active';


  List<String> Hospital = ["","","",""];
  List<String> problem = ["","","",""];
  List<String> timeTaken = ["","","",""];
  List<bool> nil = [false, false, false, false];
  List<bool> firstAid = [false, false, false, false];
  List<String> otherspecify = ["","","",""];
  List<bool> lackOfSpecialists = [false, false, false, false];
  List<bool> lackOfEquipments = [false, false, false, false];
  List<String> othersreason = ["","","",""];
  List<String> transportModeInGovt = ["","","",""];
  List<String> transportModeInPrivate = ["","","",""];
  List<String> reasonForOtherInstitution = ["","","",""];
  List<String> reasonForOtherInstitutionDecision = ["","","",""];
  List<String> timeTakenForTreatment = ["","","",""];

  List<bool> informalPayment = [false, false, false, false];
  List<bool> mobilizingSpecialists = [false, false, false, false];
  List<bool> workersNotAvailable = [false, false, false, false];
  List<bool> patientRush = [false, false, false, false];
  List<bool> doctorNotAvailable = [false, false, false, false];
  List<bool> moneyProblem = [false, false, false, false];
  List<bool> investigationsNotDone = [false, false, false, false];
  List<String> otherProblem = ["","","",""];


  String reasonDischargedAgainstMedicalAdvice = "" ;
  String dischargedAgainstMedicalAdvice = "no";
  String circumstancesDischargeBaby = "" ;
  String dischargeOnBehalf  = "";
  String babyDiedBeforeDischarge = "no";
  String dischargeDueDissatisfactionTreatment = "no";
  String reasonAgainstdischargedMedicalAdvice = "";



//  String wasGirlInfant = "no";
//  String ifGirlWasBoy = "";
//  List<bool> alcohol = [false, false, false];
//  List<bool> tobacco = [false, false, false];
//  bool domesticAbuseMother = false;

  String dangerSignsWhenNewborn = "no";
  List<String> listItem = List();
  String hospitalWhereNewbornTreated = "no";
  String nameOfFacilities = "";



  num treatment = 0;
  num transport = 0;
  num othersamount = 0;
  num total = 0;
  List<String> availableSavings = List();

  User.fromJson(Map<String,dynamic> json)
      : applicationNumber = json['applicationNumber'],
        referenceId = json['referenceId'],
        nameOfInformant = json['nameOfInformant'],
        telephoneNumber = json['telephoneNumber'],
        familyMembers = json['familyMembers'],
        children = json['children'],
        religion = json['religion'],
        bplCard = json['bplCard'],
        seekCareOutside = json['seekCareOutside'],
        wasIllnessSerious = json['wasIllnessSerious'],
        moneyNotAvailable = json['moneyNotAvailable'],
        familyMembersNotAbleAccompany = json['familyMembersNotAbleAccompany'],
        badWeather = json['badWeather'],
        didNotKnowAboutInfant = json['didNotKnowAboutInfant'],
        noHopeForSurvival = json['noHopeForSurvival'],
        transportNotAvailable = json['transportNotAvailable'],
        others = json['others'],
        quack = json['quack'],
        traditionalHealer = json['traditionalHealer'],
        subCentre = json['subCentre'],
        phc = json['phc'],
        chc = json['chc'],
        subDistrictHospital = json['subDistrictHospital'],
        districtGovtHospital = json['districtGovtHospital'],
        privateAllopathic = json['privateAllopathic'],
        doctorAlternateSystem = json['doctorAlternateSystem'],
        reasonForSeekingCare = json['reasonForSeekingCare'],
        ashaAdviceOnHospitalTreatment = json['ashaAdviceOnHospitalTreatment'],
        conditionWhenMedical = json['conditionWhenMedical'],
        Hospital = json['Hospital'],
        problem = json['problem'],
        timeTaken = json['timeTaken'],
        nil = json['nil'],
        firstAid = json['firstAid'],
        otherspecify = json['otherspecify'],
        lackOfSpecialists = json['lackOfSpecialists'],
        lackOfEquipments = json['lackOfEquipments'],
        othersreason = json['othersreason'],
        transportModeInGovt = json['transportModeInGovt'],
        transportModeInPrivate = json['transportModeInPrivate'],
        reasonForOtherInstitution = json['reasonForOtherInstitution'],
        reasonForOtherInstitutionDecision = json['reasonForOtherInstitutionDecision'],
        timeTakenForTreatment = json['timeTakenForTreatment'],
        informalPayment = json['informalPayment'],
        mobilizingSpecialists = json['mobilizingSpecialists'],
        workersNotAvailable = json['workersNotAvailable'],
        patientRush = json['patientRush'],
        doctorNotAvailable = json['doctorNotAvailable'],
        moneyProblem = json['moneyProblem'],
        investigationsNotDone = json['investigationsNotDone'],
        otherProblem = json['otherProblem'],
        reasonDischargedAgainstMedicalAdvice = json['reasonDischargedAgainstMedicalAdvice'],
        dischargedAgainstMedicalAdvice = json['dischargedAgainstMedicalAdvice'],
        circumstancesDischargeBaby = json['circumstancesDischargeBaby'],
        dischargeOnBehalf = json['dischargeOnBehalf'],
        babyDiedBeforeDischarge = json['babyDiedBeforeDischarge'],
        dischargeDueDissatisfactionTreatment = json['dischargeDueDissatisfactionTreatment'],
        reasonAgainstdischargedMedicalAdvice = json['reasonAgainstdischargedMedicalAdvice'],
//        wasGirlInfant = json['wasGirlInfant'],
//        ifGirlWasBoy = json['ifGirlWasBoy'],
//        alcohol = json['alcohol'],
//        tobacco = json['tobacco'],
//        domesticAbuseMother = json['domesticAbuseMother'],
        dangerSignsWhenNewborn = json['dangerSignsWhenNewborn'],
        listItem = json['listItem'],
        hospitalWhereNewbornTreated = json['hospitalWhereNewbornTreated'],
        nameOfFacilities = json['nameOfFacilities'],
        treatment = json['treatment'],
        transport = json['transport'],
        othersamount = json['othersamount'],
        total = json['total'],
        availableSavings = json['availableSavings'];

  Map<String, dynamic>  toJson()  => {
    'applicationNumber': applicationNumber,
    'referenceId': referenceId,
    'MCTS': MCTS,
    'nameOfInformant': nameOfInformant,
    'telephoneNumber': telephoneNumber,
    'familyMembers': familyMembers,
    'children': children,
    'caste': caste,
    'religion': religion,
    'bplCard': bplCard,

    'seekCareOutside': seekCareOutside,
    'wasIllnessSerious': wasIllnessSerious,
    'moneyNotAvailable': moneyNotAvailable,
    'familyMembersNotAbleAccompany': familyMembersNotAbleAccompany,
    'badWeather': badWeather,
    'didNotKnowAboutInfant': didNotKnowAboutInfant,
    'noHopeForSurvival': noHopeForSurvival,
    'transportNotAvailable': transportNotAvailable,
    'others': others,

    'quack': quack,
    'traditionalHealer': traditionalHealer,
    'subCentre': subCentre,
    'phc': phc,
    'chc': chc,
    'subDistrictHospital': subDistrictHospital,
    'districtGovtHospital': districtGovtHospital,
    'privateAllopathic': privateAllopathic,
    'doctorAlternateSystem': doctorAlternateSystem,
    'reasonForSeekingCare': reasonForSeekingCare,
    'ashaAdviceOnHospitalTreatment': ashaAdviceOnHospitalTreatment,
    'conditionWhenMedical': conditionWhenMedical,

    'Hospital': Hospital,
    'problem': problem,
    'timeTaken': timeTaken,
    'nil': nil,
    'firstAid': firstAid,
    'otherspecify': otherspecify,
    'lackOfSpecialists': lackOfSpecialists,
    'lackOfEquipments': lackOfEquipments,
    'othersreason': othersreason,
    'transportModeInGovt': transportModeInGovt,
    'transportModeInPrivate': transportModeInPrivate,
    'reasonForOtherInstitution': reasonForOtherInstitution,
    'reasonForOtherInstitutionDecision': reasonForOtherInstitutionDecision,
    'timeTakenForTreatment': timeTakenForTreatment,

    'informalPayment': informalPayment,
    'mobilizingSpecialists': mobilizingSpecialists,
    'workersNotAvailable': workersNotAvailable,
    'patientRush': patientRush,
    'doctorNotAvailable': doctorNotAvailable,
    'moneyProblem': moneyProblem,
    'investigationsNotDone': investigationsNotDone,
    'otherProblem': otherProblem,

    'reasonDischargedAgainstMedicalAdvice': reasonDischargedAgainstMedicalAdvice,
    'dischargedAgainstMedicalAdvice': dischargedAgainstMedicalAdvice,
    'circumstancesDischargeBaby': circumstancesDischargeBaby,
    'dischargeOnBehalf': dischargeOnBehalf,
    'babyDiedBeforeDischarge': babyDiedBeforeDischarge,
    'dischargeDueDissatisfactionTreatment': dischargeDueDissatisfactionTreatment,
    'reasonAgainstdischargedMedicalAdvice': reasonAgainstdischargedMedicalAdvice,

//    'wasGirlInfant': wasGirlInfant,
//    'ifGirlWasBoy': ifGirlWasBoy,
//    'alcohol': alcohol,
//    'tobacco': tobacco,
//    'domesticAbuseMother': domesticAbuseMother,
    'dangerSignsWhenNewborn': dangerSignsWhenNewborn,
    'listItem': listItem,
    'hospitalWhereNewbornTreated': hospitalWhereNewbornTreated,
    'nameOfFacilities': nameOfFacilities,

    'treatment': treatment,
    'transport': transport,
    'othersamount': othersamount,
    'total': total,
    'availableSavings': availableSavings,
  };

}

