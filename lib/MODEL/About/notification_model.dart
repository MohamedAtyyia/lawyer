class NotificationModel {
  String? notificationId;
  String? senderId;
  String? senderName;
  String? toWhomId;
  String? toWhomName;
  String? text;
  String? notificationType;
  String? createdBy;
  String? updatedBy;
  String? createdDate;
  int? currentState;

  NotificationModel(
      {this.notificationId,
      this.senderId,
      this.senderName,
      this.toWhomId,
      this.toWhomName,
      this.text,
      this.notificationType,
      this.createdBy,
      this.updatedBy,
      this.createdDate,
      this.currentState});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    senderId = json['senderId'];
    senderName = json['senderName'];
    toWhomId = json['toWhomId'];
    toWhomName = json['toWhomName'];
    text = json['text'];
    notificationType = json['notificationType'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdDate = json['createdDate'];
    currentState = json['currentState'];
  }
}
