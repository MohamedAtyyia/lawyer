class TermsAndConditionModel {
  String? termsAndConditionsId;
  String? termsAndConditionsTitle;
  String? termsAndConditionsDescription;
  String? termsAndConditionsForWhom;

  TermsAndConditionModel(
      {this.termsAndConditionsId,
      this.termsAndConditionsTitle,
      this.termsAndConditionsDescription,
      this.termsAndConditionsForWhom,
      });

  factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionModel(
    termsAndConditionsId : json['termsAndConditionsId'],
    termsAndConditionsTitle : json['termsAndConditionsTitle'],
    termsAndConditionsDescription : json['termsAndConditionsDescription'],
    termsAndConditionsForWhom : json['termsAndConditionsForWhom'],
    );
    
  }
}