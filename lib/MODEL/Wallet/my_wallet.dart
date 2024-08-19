class MyWalletModel {
  String? netChargeValue;
  String? appProfit;
  List<LstTransactionElements>? lstTransactionElements;

  MyWalletModel(
      {this.netChargeValue, this.lstTransactionElements, this.appProfit});

  MyWalletModel.fromJson(Map<String, dynamic> json) {
    netChargeValue = json['netChargeValue'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    appProfit = json['appProfit'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    if (json['lstTransactionElements'] != null) {
      lstTransactionElements = <LstTransactionElements>[];
      json['lstTransactionElements'].forEach((v) {
        lstTransactionElements!.add(LstTransactionElements.fromJson(v));
      });
    }
  }
}

class LstTransactionElements {
  String? chargeId;
  String? idSender;
  String? senderName;
  String? idReciever;
  String? recieverName;
  String? consultingId;
  String? chargeTypeSender;
  String? chargeTypeReciever;
  String? chargeValue;
  String? createdDate;
  int? currentState;
  String? consultingDateAndTime;
  String? requestNo;

  LstTransactionElements(
      {this.chargeId,
      this.idSender,
      this.senderName,
      this.idReciever,
      this.recieverName,
      this.consultingId,
      this.chargeTypeSender,
      this.chargeTypeReciever,
      this.chargeValue,
      this.createdDate,
      this.currentState,
      this.consultingDateAndTime,
      this.requestNo});

  LstTransactionElements.fromJson(Map<String, dynamic> json) {
    chargeId = json['chargeId'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    idSender = json['idSender'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    senderName = json['senderName'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    idReciever = json['idReciever'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    recieverName = json['recieverName'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    consultingId = json['consultingId'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    chargeTypeSender = json['chargeTypeSender'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    chargeTypeReciever = json['chargeTypeReciever'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    chargeValue = json['chargeValue'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    createdDate = json['createdDate'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    currentState = json['currentState'] as int? ??
        0; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    consultingDateAndTime = json['consultingDateAndTime'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
    requestNo = json['requestNo'] as String? ??
        ''; // تعديل: استخدام ?? لإعطاء قيمة افتراضية
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chargeId'] = chargeId;
    data['idSender'] = idSender;
    data['senderName'] = senderName;
    data['idReciever'] = idReciever;
    data['recieverName'] = recieverName;
    data['consultingId'] = consultingId;
    data['chargeTypeSender'] = chargeTypeSender;
    data['chargeTypeReciever'] = chargeTypeReciever;
    data['chargeValue'] = chargeValue;
    data['createdDate'] = createdDate;
    data['currentState'] = currentState;
    data['consultingDateAndTime'] = consultingDateAndTime;
    data['requestNo'] = requestNo;
    return data;
  }
}

// class MyWalletModel {
//   String? netChargeValue;
//   String? appProfit;
//   List<LstTransactionElements>? lstTransactionElements;

//   MyWalletModel(
//       {this.netChargeValue, this.lstTransactionElements, this.appProfit});

//   MyWalletModel.fromJson(Map<String, dynamic> json) {
//     netChargeValue = json['netChargeValue'] as String;
//     appProfit = json['appProfit'] as String;
//     if (json['lstTransactionElements'] != null) {
//       lstTransactionElements = <LstTransactionElements>[];
//       json['lstTransactionElements'].forEach((v) {
//         lstTransactionElements!.add(new LstTransactionElements.fromJson(v));
//       });
//     }
//   }
// }

// class LstTransactionElements {
//   String? chargeId;
//   String? idSender;
//   String? senderName;
//   String? idReciever;
//   String? recieverName;
//   // String? consultingId;
//   String? chargeTypeSender;
//   String? chargeTypeReciever;
//   String? chargeValue;
//   // Null? createdBy;
//   // Null? updatedBy;
//   String? createdDate;
//   // Null? updatedDate;
//   // Null? notes;
//   int? currentState;
//   String? consultingDateAndTime;
//   String? requestNo;

//   LstTransactionElements(
//       {this.chargeId,
//       this.idSender,
//       this.senderName,
//       this.idReciever,
//       this.recieverName,
//       // this.consultingId,
//       this.chargeTypeSender,
//       this.chargeTypeReciever,
//       this.chargeValue,
//       // this.createdBy,
//       // this.updatedBy,
//       // this.createdDate,
//       // this.updatedDate,
//       // this.notes,
//       this.currentState,
//       this.consultingDateAndTime,
//       this.requestNo});

//   LstTransactionElements.fromJson(Map<String, dynamic> json) {
//     chargeId = json['chargeId'];
//     idSender = json['idSender'];
//     senderName = json['senderName'];
//     idReciever = json['idReciever'];
//     recieverName = json['recieverName'];
//     // consultingId = json['consultingId'];
//     chargeTypeSender = json['chargeTypeSender'];
//     chargeTypeReciever = json['chargeTypeReciever'];
//     chargeValue = json['chargeValue'];
//     // createdBy = json['createdBy'];
//     // updatedBy = json['updatedBy'];
//     createdDate = json['createdDate'];
//     // updatedDate = json['updatedDate'];
//     // notes = json['notes'];
//     currentState = json['currentState'];
//     consultingDateAndTime = json['consultingDateAndTime'] ?? "Ahmed ";
//     requestNo = json['requestNo'] ?? "";
//   }
// }





// class LstTransactionElements {
//   String? chargeId;
//   String? idSender;
//   Null? senderName;
//   Null? idReciever;
//   Null? recieverName;
//   Null? consultingId;
//   String? chargeTypeSender;
//   Null? chargeTypeReciever;
//   String? chargeValue;
//   Null? createdBy;
//   Null? updatedBy;
//   String? createdDate;
//   Null? updatedDate;
//   Null? notes;
//   int? currentState;
//   String? consultingDateAndTime;
//   String? requestNo;

//   LstTransactionElements(
//       {this.chargeId,
//       this.idSender,
//       this.senderName,
//       this.idReciever,
//       this.recieverName,
//       this.consultingId,
//       this.chargeTypeSender,
//       this.chargeTypeReciever,
//       this.chargeValue,
//       this.createdBy,
//       this.updatedBy,
//       this.createdDate,
//       this.updatedDate,
//       this.notes,
//       this.currentState,
//       this.consultingDateAndTime,
//       this.requestNo});

//   LstTransactionElements.fromJson(Map<String, dynamic> json) {
//     chargeId = json['chargeId'];
//     idSender = json['idSender'];
//     senderName = json['senderName'];
//     idReciever = json['idReciever'];
//     recieverName = json['recieverName'];
//     consultingId = json['consultingId'];
//     chargeTypeSender = json['chargeTypeSender'];
//     chargeTypeReciever = json['chargeTypeReciever'];
//     chargeValue = json['chargeValue'];
//     createdBy = json['createdBy'];
//     updatedBy = json['updatedBy'];
//     createdDate = json['createdDate'];
//     updatedDate = json['updatedDate'];
//     notes = json['notes'];
//     currentState = json['currentState'];
//     consultingDateAndTime = json['consultingDateAndTime'];
//     requestNo = json['requestNo'];
//   }
// }