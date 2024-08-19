import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class APIs {
  static Future<void> sendPushNotification({
    required var fcmToken,
    required String msg,
    required String title,
    required String channelID,
  }) async {
    SendNotification.sendNotification(
      fcmToken: fcmToken,
      msg: msg,
      title: title,
      channelID: channelID,
    );
  }

  static Future<void> sendDelegationNotification(
      {required var fcmToken,
      required String msg,
      required String title,
      required String channelID,
      required String consultingID,
      required String consultingPrice}) async {
    SendNotification.sendNotification(
      fcmToken: fcmToken,
      msg: msg,
      title: title,
      channelID: channelID,
    );
  }
}

abstract class SendNotification {
  static Future<String> getAccessToken() async {
    final serviceAccountToken = {
      // "type": "service_account",
      // "project_id": "lawyer-d3b22",
      // "private_key_id": "c8a87019b5d365976a41e9a5d7d1ee64ef9c3424",
      // "private_key":
      //     "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCSCAOkiVineXI3\nUkNbvZ7yG/Z7XSs1gu1ZE0EbFPVMRp4KceQcyyMlL1BDSb8vOh1a7CFOdmAqvXUA\nfEpoST9NHHq5U0UPWcojdhWkjS591no0Y5sN1roErL53o4HxfNh+xPhMqPaxwqHA\ns5rO91j1Eupvz07YDfXawuus2CY4D3dkTWdF5m4Bxv3lwTx6qSFvehAPQZ1/DWJT\nOTYd8HO+hNURXJNP4Ug4D3eYLD1PxbnSCMOdWlYpMIuOEd8AxKRpORfe78oDNS/w\nbU90q/Qx+np2CxJjOokHihXcUV3fg0vja1QssoCpdwDZG8NjsS6gldJm6f3oSfZB\nmM+ITTEnAgMBAAECggEAAn7FqqLF1vJRvYfh3SFo0wxIKfpb9pH6scYGRBvNiscw\nVSBARqfiqRYuN9Ur41wkt+VYAN/e/IbrACus/DlZcXgMFOMOiuY2DMM5vvjqs2yJ\n1s71AADgdI5cp1JqndxFVBu5BQpQDdmtVvrhZfP7imDnBbHoQoftsYjV5HE0G6k/\nfV/QSnWybEJuKM7+QII6mRHCzpMDe90/YrqIgx3/8kX57UzT33uf8aaUW0E1JiFg\n+/4HCNzoXPMdcL6YQwMWICbXnFEfLA8JkFdjkFnfgR9It5KN7PMGTLWgusfncVDF\nbRF2Iq8y/3VN4AvczUnEo5v2Gv36+ZJ9oKoVzhrFlQKBgQDE73/Xmhrnpl/HLYZu\nnm+spHUWeB12u6zm5PgsYg82WbKPj6PUa9P8iBO22veW/x2LqM/YhFmXM7G+j3nG\nkKZIO1080nXVUxqvw0kChGi/hhSL8ldCIEHvZK83EEJlipF+pP0+lPGP4DUbJTvR\nEFxPDJKZJO8bL2pGFRkKjoeqPQKBgQC91CRMc6BL4pxgvDCAvYj4QNVeS1N/DWAQ\nZiIGRTeMnFAWRyO5pu37HKnhDxlmqpu2g38CzUMltY/eig4+Ju6mzsJAayO8k8fC\nIK/45NcpLpQbvVoiD4iODMcV4fZcjP01AL5KpRY+BSBDfyBGSW5iyqzhdVyA0sfX\n1QUAVy7TMwKBgHASm/5mhMkvtXH0RnzNTWBCdx/CW4Ima886nsEjTOTxRtzMMb/B\nXXJpPk7hbeVQadAA0ce2CgYyNQTtQa/uwbJ5liX233f3Q0ijKfl0wOe9thOuZloL\nYXqLIeuEJUUEBqi73CKxQIdQYOiB1/iyBtY1oXflvO0Lnr8jYozPcAVBAoGATVEL\nm8v4fRAGi2v7AWSxVhPqE+bwUi5bczJ2J0Gn93BvOjOtfF9eTMoG8zDYMrXIiFUU\ntUpvT/ucZpKqbGwlBfHuspgwzQ0P7qSrp99lN1POZWIBRSA4iUrxB5uqYVXXh/AO\nkY6d+ZLS6krsFVSxTjGoqofHrnyrguAzkkjwPHsCgYBRejT2WeDh1zkhJ9ubFjxs\nUTLdablKjvTudufgRKuPBUM97JBM8N/7Q7EogD3ntAjzChE8fTs1pet2rfNW/Ocj\n26yP2copSiXyNzKNjK0FtzPAATpEuicBUVCd+rucXjL/FMcRPHMAux23AVvYI+mq\n1+W39OQNAvdIvqnIqRUHug==\n-----END PRIVATE KEY-----\n",
      // "client_email":
      //     "firebase-adminsdk-i6bn6@lawyer-d3b22.iam.gserviceaccount.com",
      // "client_id": "108962518536887676665",
      // "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      // "token_uri": "https://oauth2.googleapis.com/token",
      // "auth_provider_x509_cert_url":
      //     "https://www.googleapis.com/oauth2/v1/certs",
      // "client_x509_cert_url":
      //     "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-i6bn6%40lawyer-d3b22.iam.gserviceaccount.com",
      // "universe_domain": "googleapis.com"
      "type": "service_account",
      "project_id": "lawyer-285d1",
      "private_key_id": "f51aa8fa43c023a3ed4dda25d5f9dc67d7f6664e",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDMeEIJaVq6fasi\n5WRfN+/s4A2jUWfwk/CLEtIDt1Cp32thpzd2WV1uBGBqe9KsGU/w9C1yMbgRg6XX\nsUcBLPLDO2CY785mdzbHTRClBYr1l2mJbeG7ww1soSxj42eq36pIMsUOK1S+rAZs\nUdWsOPM1sBTcYYfcPl+SAorm+lI8KJMu9H++31eI0GqfDGE+bs7qXfGEF1bml67b\nHzWFLO7E/LdXHOkH5tWCFK8xtxLwaHqUn8OAndsmod4uMik1nUkgelU86GJ97OFF\nT4X4+KAfW31h32frgj8hjp++a7MdgWM+d98EUxQZMn2IXfY81RZRSONPz+CfPduM\nEhD9SPZvAgMBAAECggEAUn34IoTrUk8OIvOKZbITLa2NQwU+WnzNMMbEjTRBqm9V\nit3kTe6q945zebKAIefKbUuOJEKz4PkMiTNgErTYMnT7uWgSjRtuscTBQNq2H/RY\n41W+GzsL6PYziw89jV5UfHFjOB66P3z20G/JtYR6dwAVwn3kyrIta6Jz+NEoKVV6\nvo0tSnTzb7wTLCkMSB1aLZ1C4zW9uxOgUyYozvkhiBMV+FtZ3+Nb+ONfLNtyclXV\nhbyDpfGxkJIKtAIETO9td8luXWE+6lyKowJ6lp0uj4qBxRM5tqQyFgeUCLmHGDat\nY15q0B+iTXoi14WuPykPBRqEYb0MVDTVemqJB432kQKBgQDoTW+S86AOQ7TGwU2z\nwHzaBQSHwO9r0idv54jazpjB9ZcG3fvAw5vf5z9WJu1SPez8KhRaLG0qEhocKLy7\nXeOIGCHt1CdiN4gPeoQU5wzaynGQqDkjbvWUBkdP5XNZ4dnxqOm6zCkwvcHpbWkY\nzcLQ6w4puyhdvAf4W4/oqg4TcQKBgQDhU/jomG7hMy5xlHB8SS+dReeeg/+MnPog\nAngJA6OtEm4i9bw5TNXDeSfZOLHVv4uyvhTem9bimga7OpUU7qkLK9w9L/PkayIO\ndbZEFMZLZJkf2wxJAmVck9upIhHKQnytQm0tTQJ+ByXZT8C73hVkTtPN3fkMbx7O\n79njQIT33wKBgCMw194jGfQPPat+TQ8V8dP1PqJyD9L9mwvQv2KmOW3ojmBz8Fdb\nSpm4pleevgTfbK8mkL64TDE7XMk3Qp//sSBEx58HrI+saeguXyPrfH8Ie/u2ADHl\n9T3fVZ483CSZmjKJrB6oHvVLSbza3jjrsr+DXDnmKE9K1MpC1KIiYM+BAoGBAJ4m\nP/eQtZIeSCSz2NeCzoaGP/EEGGLq8qtw0CsTgNfCrcafzwIwqYBPEublYfvyOuyz\neRZdLs9Q6BSVI3nToJYUrLnNZFMX1olrmQfjxOG5s7emGNNNeTMnG+9z2CSr0bIR\ng2teN7eY8Lm7vjydvUnwAbzmZRyTCX6Y3ccgy7LlAoGADNV+u0MjPsHJ3fBK2Lhg\n12Y+b84UEESM0xKw2Wuf/wVAnEfBpwj3InvpzU+sknp8QAaXXM2RtL6Im29N7HEI\nmYaiNS1DAN2vFAjpO7MMFVMPIe/T4mq4CS9N6TUN3E4xtWBF/hmxG5L6M/Zs2G+y\nms1gCplvZdrel0So/guIqCA=\n-----END PRIVATE KEY-----\n",
      "client_email": "lawyer-app@lawyer-285d1.iam.gserviceaccount.com",
      "client_id": "101220961985499190249",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/lawyer-app%40lawyer-285d1.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      'https://www.googleapis.com/auth/firebase.messaging',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/userinfo.email',
    ];

    final auth.ServiceAccountCredentials credentials =
        auth.ServiceAccountCredentials.fromJson(serviceAccountToken);

    http.Client client =
        await auth.clientViaServiceAccount(credentials, scopes);

    auth.AccessCredentials accessCredentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      credentials,
      scopes,
      client,
    );

    client.close();
    return accessCredentials.accessToken.data;
  }

  static Future<void> sendNotification(
      {required var fcmToken,
      required String msg,
      required String title,
      required String channelID,
      Map<String, dynamic>? dataNoti = const {}}) async {
    try {
      String serviceKey = await getAccessToken();
      String endpointFirebaseMessaging =
          'https://fcm.googleapis.com/v1/projects/lawyer-285d1/messages:send';
      final Map<String, dynamic> data = {
        "message": {
          "token": fcmToken,
          "notification": {
            "title": title,
            "body": msg,
          },
          "data": dataNoti ?? {}
        },
      };
      await http.post(Uri.parse(endpointFirebaseMessaging),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization": "Bearer $serviceKey"
          },
          body: jsonEncode(data));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}


























  // static void sendNotification(
  //     {required String fcmToken,
  //     required String msg,
  //     required String title,
  //     required String channelID}) {}

  // static Future<void> sendPushNotification({
  //   required var fcmToken,
  //   required String msg,
  //   required String title,
  //   required String channelID,
  // }) async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization':
  //             'key=AAAA3xUXh_A:APA91bEwGNwFq56OzLi39HVT7MJEFC70vHTOtZh8SgxfN_RQLfHMGKt6cBN9S1D5-Wgw7m3BJ_uI8G5lwdf2OfcuE7bHN0JMTHuJBUwgYTbTMvsZVsDpMdzvXPBAwLXSP5XyeyOiuTkB',
  //       },
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           'notification': <String, dynamic>{
  //             'body': msg,
  //             'title': title,
  //           },
  //           'priority': 'high',
  //           'data': <String, dynamic>{
  //             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //             'id': '1',
  //             'type': 'chat',
  //             'status': 'done',
  //             "channelId": channelID,
  //           },
  //           'to': fcmToken,
  //         },
  //       ),
  //     );
  //     response;
  //   } catch (e) {
  //     e;
  //   }
  // }

  // static Future<void> sendDelegationNotification(
  //     {required var fcmToken,
  //     required String msg,
  //     required String title,
  //     required String channelID,
  //     required String consultingID,
  //     required String consultingPrice
  //     }) async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization':
  //             'key=AAAA3xUXh_A:APA91bEwGNwFq56OzLi39HVT7MJEFC70vHTOtZh8SgxfN_RQLfHMGKt6cBN9S1D5-Wgw7m3BJ_uI8G5lwdf2OfcuE7bHN0JMTHuJBUwgYTbTMvsZVsDpMdzvXPBAwLXSP5XyeyOiuTkB',
  //       },
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           'notification': <String, dynamic>{
  //             'body': msg,
  //             'title': title,
  //           },
  //           'priority': 'high',
  //           'data': <String, dynamic>{
  //             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //             'id': '1',
  //             'type': 'chat',
  //             'status': 'done',
  //             "channelId": channelID,
  //             "consultingID": consultingID,
  //             "consultingPrice": consultingPrice,
  //           },
  //           'to': fcmToken,
  //         },
  //       ),
  //     );
  //     response;
  //   } catch (e) {
  //     e;
  //   }
  // }




  // dataNoti: {
  //         'priority': 'high',
  //         'data': <String, dynamic>{
  //           'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //           'id': '1',
  //           'type': 'chat',
  //           'status': 'done',
  //           "channelId": channelID,
  //           "consultingID": consultingID,
  //           "consultingPrice": consultingPrice,
  //         },
  //         'to': fcmToken,
  //       }