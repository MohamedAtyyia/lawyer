class AgentDocumentModel {
  final String documentationContractId;
  final String name;
  final int request;
  final String description;
  final String phoneNumber;
  final String email;
  final String region;
  final String city;
  final List<String> document;
  final String createdBy;
  final String accredited;
  final String documentationType;
  final List<String>? image; // يمكن أن يكون null
  final String createdDate;
  final String status;

  AgentDocumentModel({
    required this.documentationContractId,
    required this.name,
    required this.request,
    required this.description,
    required this.phoneNumber,
    required this.email,
    required this.region,
    required this.city,
    required this.document,
    required this.createdBy,
    required this.accredited,
    required this.documentationType,
    this.image,
    required this.createdDate,
    required this.status,
  });

  factory AgentDocumentModel.fromJson(Map<String, dynamic> json) {
    return AgentDocumentModel(
      documentationContractId: json['documentationContractId'],
      name: json['name'],
      request: json['request'],
      description: json['description'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      region: json['region'],
      city: json['city'],
      document: List<String>.from(json['document']),
      createdBy: json['createdBy'],
      accredited: json['accredited'],
      documentationType: json['documentationType'],
      image: json['image'] != null ? List<String>.from(json['image']) : null,
      createdDate: json['createdDate'],
      status: json['status'],
    );
  }
}
