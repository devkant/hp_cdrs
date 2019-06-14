class User {
  String referenceId;
  String MCTS;
  String nameOfInformant;
  String telephoneNumber;
  int familyMembers;
  int children ;
  String caste;
  String religion;
  String bplCard = '';
  String seekCareOutside = '';

  var reasonNotSeekingCare = {'Did not think that the illness was serious':false,
                              'Money not available for treatment': false,
                              'Family members were not able to accompany': false,
                              'Bad weather': false,
                              'Did not know where to take the infant': false,
                              'No hope for survival of the infant': false,
                              'Transport not available': false, 'Others': ''};

//  bool illnessWasSerious = false;
//  bool moneyAvailable = false;
//  bool familyAbleToAccompany = false;
//  bool badWeather = false;
//  bool whereToTakeInfant = false;
//  bool noHopesOfSurvival = false;
//  bool transportAvailability = false;
//  String othersNo ='';

  var whereSeekCare = {'Quack / informal service providers': false,
                       'Traditional healer / Religious healer': false,
                       'Subcentre': false,
                       'PHC': false,
                       'CHC': false,
                       'Sub-district hospital': false,
                       'District(Govt.) Hospital': false,
                       'Private allopathic doctor': false,
                       'Doctors in alternate system of medicine': false ,
                       'Reason for seeking care': true };

//  bool quack = false;
//  bool traditionalHealer = false;
//  bool subCentre = false;
//  bool phc = false;
//  bool chc = false;
//  bool subDistrictHospital = false;
//  bool districtGovtHospital = false;
//  bool privateAllopathic = false;
//  bool doctorAlternateSystem = false;
//  String reasonForSeekingCare = '' ;
  String ashaAdviceOnHospitalTreatment = '';
  String conditionWhenMedical = '';

  List<String> hospital = List();        // schema change
  List<String> problem = List();
  List<String> timeTaken = List();
  List<String> nil = List();
  List<String> firstAid = List();
  List<String> otherSpecify = List();       // schema change
  List<String> lackOfSpecialists = List();
  List<String> lackOfEquipments = List();
  List<String> otherReason = List();                // schema change
  List<String> transportModeInGovt = List();
  List<String> transportModeInPrivate = List();
  List<String> reasonForOtherInstitution = List();
  List<String> reasonForOtherInstitutionDecision = List();
  List<String> timeTakenForTreatment = List();



  String dischargedAgainstMedicalAdvice;
  String diedBeforeDischarge;
  String dissatisfactionTreatment;
  String wasGirlInfant;
  var alcohol = {'mother': false, 'father' : false, 'other': false };
  var tobacco = {'mother': false, 'father' : false, 'other': false };
  bool domesticAbuseMother = false;
  String dangerSignsWhenNewborn;
  bool preterm = false;
  bool lbw = false;
  bool noCryAtBirth = false;
  bool fits = false;
  bool  drowsinessInactivityUnconsciousness = false;
  bool jaundice = false;
  bool diarrhoea = false;
  bool refusalToEat = false;
  bool fastBreathing = false;
  bool highGradeFever = false;
  String hospitalWhereNewbornTreated;
  num treatmentCost;
  num transportCost;
  num otherCost;
  var moneyArrangement = {'available': false, 'borrowed': false, 'sold assets': false, 'community fund': false, 'govt scheme': false, 'other': false, "don't know": false};
}

