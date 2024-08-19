import 'package:al_mostashar_lawyer/main.dart';

class Api {
  // user id from shared pref
  static String id = pref!.getString('id') ?? "";
  // static final id = '4ec0915b-0f9f-462d-8d8f-b64c4fb19c35';
  static final phone = pref!.getString('phone') ?? '';
  static final user = pref!.getString('userName') ?? '';
  static final pass = pref!.getString('pass') ?? '';
  static final registerID = pref!.getString('registerID') ?? '';
  static bool click = pref!.getBool('click') ?? false;

  static const baseUrl = 'http://almohamey.visooft-code.com/';
  static const upload = 'http://almohamey.visooft-code.com/uploads/';
  static const login = 'api/UserLoginApi/login';
  static const register = 'api/UserLoginApi/signup';
  static const forgetPassword = 'api/UserLoginApi/forget';
  static const signConsultingPrice =
      'api/LawyerMainConsultingApi/SendLawyerConsultWCostWTime';
  static const verifyPhone = 'api/UserLoginApi/PhoneCon';
  static const sendOTP = 'api/UserLoginApi/SendOTP';

  static const lawayerFile = 'api/LawyerUploadDomsApi/uploadDoms';
  static const changePersonalImage = 'api/UserLoginApi/upload-image';
  static const changePassword = 'api/UserLoginApi/reset-Password';
  static const changePasswordWithoutToken =
      'api/UserLoginApi/reset-PasswordWithoutToken';
  static const myPersonalData = 'api/UserLogInApi/bringdata';
  static const officeApprovalRequest = 'api/OfferApprovedOfficeRequestApi';
  static const agentApprovalRequest =
      'api/RequestAccreditedApi/AddRequestAccredited';
  static const getAllDocAgent =
      'api/RequestAccreditedApi/GetDocumentToAccredited';
  static const finishDoc = 'api/RequestAccreditedApi/FinishDocument';

  static const deleteAccount = 'api/UserLoginApi/deleteAccount';
  static const editInfo = 'api/MyPersonalDataUpdateApi/UpdatePersonalData';
  static const getToken = 'api/Notification/updateUserToken';

  // about
  static const termsAndCondition = 'api/TermsAndConditionsApi/';
  static const privacy = 'api/PolicyAndPrivacyApi/';
  static const aboutApp = 'api/AboutAppApi/';
  static const ratedOffice = 'api/LawyerEvaluationBringDataApi/';
  static const lawyerDate = 'api/LawyerAppointApi/SendAppoints';
  static const getNotification = 'api/NotificaionApi/';

  // consulting
  static const mainConsulting = 'api/MainConsultingApi';
  static const myWallet = 'api/ChargeApi/';
  static const generalConsulting = 'api/LawyerGeneralConsultApi/';
  static const privateConsulting = 'api/LawyerSpecificConsultApi/';
  static const currentConsulting = 'api/CurrentLawyerConsultingApi';
  static const endedConsulting = 'api/FinishedLawyerConsultingApi/';
  static const canceledConsulting = 'api/CancelledLawyerConsutingApi/';
  static const approveDelegation =
      'api/LawyerDelegationOfferReplyApi/replyDelegationOffer';
  static const approveConsulting =
      'api/LawyerApprovalConsultationApi/approveConsult';
  static const rejectConsulting =
      'api/LawyerRejectConsultationApi/rejectConsult';
  static const submitOffer = 'api/OfferLawyerApi/offerService';
  static const delegationRequest = 'api/LawyerDelegationDataApi';
  static const consultingDetail = 'api/DetailsConsiltationApi';
  static const deActiveLawyerAccount =
      'api/DeactivateLawyer/deactivateAccount/';
  static const ActiveLawyerAccount = 'api/ActivateLawyerApi/actvateAccount/';
  static const searchResult = 'api/SearchForUserApi';
  static const saveChat = 'api/ChatHistoryApi/SaveChat';
}
