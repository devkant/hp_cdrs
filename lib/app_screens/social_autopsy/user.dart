class User {

  String applicationNumber ;

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



  String wasGirlInfant = "no";
  String ifGirlWasBoy = "";
  List<bool> alcohol = [false, false, false];
  List<bool> tobacco = [false, false, false];
  bool domesticAbuseMother = false;

  String dangerSignsWhenNewborn = "no";
  List<String> listItem = List();
  String hospitalWhereNewbornTreated = "no";
  String nameOfFacilities = "";



  num treatment = 0;
  num transport = 0;
  num othersamount = 0;
  num total = 0;
  List<String> availableSavings = List();
}

