import 'dart:async';
import 'dart:ui';

import '../models/AppUser.dart';

class Constants {
  static String account_type = "";
  static bool isAdmin = false;
  static bool isReleaseMode = false;
  static List selectedPolicydetails = [];
  static int pageLevel = 1;
  static String baseUrl = "https://miinsightsapps.net/apibus/api";
  static bool isLoggedIn = false;
  static bool isLoggedIn5 = false;

  static String myDisplayname = "Namar Cooper";

  static String myEmail = "";

  static String myCell = "";
  static AppUser current_user = AppUser(
    title: "",
    firstName: "",
    lastName: "",
    dateOfBirth: DateTime.now(),
    gender: "",
    idNumber: "",
    contactNumber: "",
    email: "",
    username: "",
    password: "",
    accountStatus: null,
    timestamp: DateTime.now(),
    lastUpdate: DateTime.now(),
    otp: "",
    emailUsername: "",
    profilePic: "",
    accountType: "",
    dateTimestamp: DateTime.now(),
    dateLastUpdate: DateTime.now(),
    middleName: "",
    relationship: "",
    dateOfDeath: null,
    isHidden: false,
  );
  static Timer? inactivityTimer;

  static String myUid = "xxxxxxxxx";
  static String insightsbaseUrl = "https://miinsightsapps.net/";

  static Color ctaColorLight = Color(0xFFf05223);
  static bool accepted_terms = false;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static int new_timesOpened = 0;
  static bool showOnboardingScreen = false;

  static bool requirePassword = false;
  static String primaryVariable = 'https://qa.miinsightsapps.net/strawberry/';
  // static environmentUrl = 'http://127.0.0.1:8000/cclapi/';

  static String AUTHENTICATION_API_ENDPOINT = primaryVariable + 'cclapi/';
  // public static AUTHENTICATION_API_ENDPOINT = Config.environmentUrl;

  static String GOOGLE_MAP_API_KEY = '';

  static int API_TIMEOUT = 3000; // 1 second Timeout

  static String LOGIN_ERROR = 'Please enter the correct username and password.';

  static String LOGOUT_SUCCESS = 'Successfully Logout.';

  static String SITE_NAME = 'MI-Zone > X';

  static String SITE_URL = '';

  static String GENERIC_ERROR = 'There is some error. Please try again.';

  static String Stripe_key = '';
  static String FaceBookProviderKey = '';

  static String GoogleProviderKey = '';

  static const inAppPurchase = {
    'PRODUCT_ID': {
      'MONTHLY': '',
    },
    'RECEIPT_VALIDATOR_API': 'subscription/inapp',
  };

  static const package = {
    'FREE': '',
    'PAID_AMOUNT': {
      'YEARLY': 88,
      'YEAR5': 377,
      'YEAR10': 577,
    },
  };

  static const routeAnimation = {
    'animation': 'ios-transition',
    'duration': 1000,
  };

  static const bucketPath = {
    'SONG': 'songs',
    'THEME': 'themes',
    'MEMORIAL': 'memorials',
    'PROFILE': 'profile',
    'ASSETMEDIA': 'assetMedia',
    'RIPCONTACT': 'ripalertcontactfiles',
    'STORYMEDIA': 'storyMedia',
  };

  // Assuming a placeholder for countries list.
  // You will need to define the actual list of countries somewhere in your Dart code.
  static const countriesList =
      'Country.ALL_COUNTRIES'; // Placeholder for actual country list

  static const tapAffiliate = {
    'METHOD': {
      'post': 'POST',
      'get': 'GET',
      'patch': 'PATCH',
      'put': 'PUT',
      'delete': 'DELETE',
    },
    'APIS': {
      'affiliate': 'affiliates',
      'customers': 'customers',
      'conversions': 'conversions',
      'commissions': 'commissions',
      'affiliateProspects': 'affiliate-prospects',
      'programs': 'programs',
      'payments': 'payments',
      'clicks': 'clicks',
    },
  };

  static String CancelSubcription =
      'Are you sure you want to cancel the Premium Subscription? All your media files uploaded under the Premium Subscription will no longer be available in MI-Zone > X, but the other media files will remain available.';

  static String DownGradeSubscription =
      'You have subscribed to premium version.If you cancel the subscription you will not get any refunds';

  static String AlreadySubscribePlan =
      'You already have a Premium Subscription.';

  static String ripAddressAlert =
      'We are unable to auto-fetch the selected address. Please manually type in the address and save again.';

  static String SubscriptionAlert =
      'Uploading of media files is a Premium feature. Upgrade to the Premium Subscription to enjoy use of the feature.';

  static String PulishMemorialAlert =
      'Do you wish to publish this Memorial? You can still edit the Memorial at a later stage.';

  static String RIPPressAlert = 'Are You Sure You want to press RIP?';

  static String MobileNotValid =
      'Please enter valid mobile number and country code';

  static String SelfMemorialError =
      "Seems You didn't Preset Your Memorial. Would you like to set it up First or proceed anyways.";

  static String PasswordMatchError =
      'The confirm password entered does not match your password .';

  static String NORegisterUser =
      'The mobile number entered has yet to be registered with us. Please proceed to create a new account using the mobile number.';

  static String alreadyAccountError =
      'The mobile number is already registered with us. Please proceed to log in to your account using the mobile number.';

  static String CompleteOTPError =
      'The OTP entered is incorrect. Please enter the OTP again.';

  static String AddSongError = 'To add a Song You have to login.';

  static String ThemeSongError =
      'Please seclect the desired theme and song for your Memorial. Upgrade to the Premium Subscription to be able to upload your own song(s).';

  static String WebAddressError =
      'The web address entered is already registered with us by another user. Please assign a new web address.';

  static String FormatError =
      'File format unsupported. Please upload audio files only.';

  static String FiveImageAlert =
      'You can upload only 5 images in the Gallery under your current plan. Upgrade to the Premium Subscription to be able to upload unlimited media files, including video and audio files. Upgrade now';

  static String PasswordLengthError = 'Minimum 6 characters required.';

  static String FileUploadError =
      'Please upload files only in Image / Audio / Video / PDF formats.';

  static String ImageSizeALert = 'Image file size should be less than 20Mb.';

  static String AudioSizeALert = 'Audio file size should be less than 20Mb.';

  static String VideoSizeAlert = 'Video file size should be less than 20Mb.';

  static String PDFSizeAlert = 'PDF file size should be less than 20Mb.';

  static String DeleteMultiple =
      'Are you sure you want to delete these memorials?';

  static String SelectthreeContactsAlert =
      'You can add up to 3 Contacts under the free version of MI-Zone > X. Upgrade to the Premium Subscription to be able to add unlimited contacts.';

  static String BirthDateError = 'Date of birth cannot be in the future.';

  static String PassedAwayDateError =
      'Date of deceased cannot be in the future.';

  static String DateError = 'Date of deceased cannot pre-date date of birth.';

  static String SelectContactAlert = 'Please select Contact(s).';

  static String ReplaceContactWithCircle =
      'You can assign either Contact(s) or Circle(s). Confirm to replace Contact(s) with Circle(s)?';

  static String ReplaceCircleWithContacts =
      'You can assign either Contact(s) or Circle(s). Confirm to replace Circle(s) with Contact(s)?';

  static String CircleExitMSG = 'Confirm to exit Circle?';

  static String CircleNameALert = 'Please enter a name for the Circle.';

  static String WEBALERT = 'Not Available For Web!';

  static String DeleteMSG = 'Confirm to delete?';

  static String MobileAlert =
      'To ensure secure usage and privacy, you need to register your mobile number to use this feature';

  static String AssetsAlert =
      'This is a premium feature. Upgrade to the Premium Subscription to be able to add media files for the assets.';

  static const List<String> messages = [
    'Sorry for all the times that I might have unknowingly hurt your feelings and caused you pain. Goodbye my friend. I have to leave first but one day we will see each other in a better place. Do take    care and live your life to the fullest. Signing out!',
    'I never knew that saying just one word could make me feel so blue, until I said GOODBYE to a special friend like you. I may never see you again but remember me just the way I am. Have a good life ahead.',
    'Life and destiny can steal my family and friends from me but nothing can take away the precious memories I had with you. Goodbye my dear.',
    'Who would tolerate my annoying antics, calm me down when I am angry, listen to my daily rants, ensure I was well taken care of, except you? Who will I harass with my banter, hang out with every day, now that I am leaving this world. Please don’t be sad, for my heart will still be with you every single day.',
    'Just like how one does not forget the tune when a song fades out, I will never forget the precious memories of our time together even as I get ready to take my leave. I hope you remember the good times we shared. Goodbye.',
    'When the sun bids goodbye to the earth, it leaves a beautiful sunset as a gift. The time has come for me to bid goodbye, with my last breath I hope to leave with you our everlasting and priceless friendship. Goodbye my friend, I will miss you.',
    'I am sorry for all the times I have taken you for granted and made you do things against your will. Please remember I could find no better friend than you. I have to leave first, do stay strong and live your life to the fullest.',
    'I will bring with me all the beautiful memories we had, which would be greatly cherished and fondly remembered by me wherever I may go. Life is short, so please don’t waste time weeping for me, for I am sure we will see each other again someday.'
  ];

  static const sms = {
    'SENT_SUCCESSMSG': 'Message Has Sent Successfully',
    'SENT_SUCCESS': 'OTP has been sent to your registered phone no.',
    'SENT_ERROR':
        'OTP can not be sent to your registered phone no. Please try again.',
    'RESENT_SUCCESS': 'OTP has been resent to your registered phone no.',
    'VERIFY_SUCCESS': 'Phone number has been verified successfully.',
    'VERIFY_ERROR': 'Wrong OTP entered. Please try again',
    'VERIFY_ALREADY': 'This phone number already verified. Please try again.',
    'LIMIT_REACHED': 'OTP has been expired. Please try with resend the OTP.',
  };

  static const user = {
    'ADD_TITLE': 'Registered Successfully',
    'ADD':
        'Congratulations you have created an account. A OTP has been sent to activate the MI-Zone > X.',
    'EDIT': 'User Info has been updated',
    'DELETE': 'User has been deleted',
    'DELETE_CONFIRM': 'Are you sure you want to delete this user?',
    'SIGNUP_ERR': 'Email address already exist. Please try again.',
    'FORGET_PASSWORD':
        'Reset Password link has been sent at your email address.',
    'RESET_PASSWORD':
        'Congratulations! Your password has been reset successfully.',
    'CHANGE_PASSWORD':
        'Congratulations! Your password has been changed successfully.',
  };

  static const subscription = {
    'ADD': 'Subscription added successfully.',
    'EDIT': 'Subscription Info has been updated',
    'DELETE': 'Subscription has been deleted',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Subscription?',
  };

  static const song = {
    'ADD': 'Song added successfully.',
    'EDIT': 'Song Info has been updated.',
    'DELETE': 'Song has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Song?',
  };

  static const tribute = {
    'ADD': 'Tribute added successfully.',
    'EDIT': 'Tribute Info has been updated.',
    'DELETE': 'Tribute has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Tribute?',
  };

  static const asset = {
    'ADD': 'Asset added successfully.',
    'EDIT': 'Asset Info has been updated.',
    'DELETE': 'Asset has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Asset?',
  };

  static final Map<String, String> assetMedia = {
    'ADD': 'Asset media added successfully.',
    'EDIT': 'Asset media Info has been updated.',
    'DELETE': 'Asset media has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Asset media?',
  };

  static final Map<String, String> ripMedia = {
    'ADD': 'Media added successfully.',
    'EDIT': 'Media Info has been updated.',
    'DELETE': 'Media has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Media?',
  };

  static final Map<String, String> assetPerson = {
    'ADD': 'Asset person added successfully.',
    'EDIT': 'Asset person Info has been updated.',
    'DELETE': 'Asset person has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Asset person?',
  };

  static final Map<String, String> memorial = {
    'InfoSaved': 'Memorial Information is Saved',
    'ADD': 'Memorial added successfully.',
    'EDIT': 'Memorial Info has been updated.',
    'DELETE': 'Memorial has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial?',
  };

  static final Map<String, String> circle = {
    'InfoSaved': 'Circle Information is Saved',
    'ADD': 'Circle added successfully.',
    'EDIT': 'Circle Info has been updated.',
    'DELETE': 'Circle has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Circle?',
  };

  static final Map<String, String> contact = {
    'InfoSaved': 'Contact Information is Saved',
    'ADD': 'Contact added successfully.',
    'EDIT': 'Contact Info has been updated.',
    'DELETE': 'Contact has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Contact?',
  };

  static final Map<String, String> rip = {
    'ACCEPTED': 'Request has been Accepted',
    'REJECTED': 'Request has been Rejected',
    'InfoSaved': 'Contact Information is Saved',
    'ADD': 'Contact added successfully.',
    'EDIT': 'Contact Info has been updated.',
    'DELETE': 'Contact has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Contact?',
  };

  static final Map<String, String> memorialAudio = {
    'ADD': 'Memorial Audio added successfully.',
    'EDIT': 'Memorial Audio Info has been updated.',
    'DELETE': 'Memorial Audio has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial Audio?',
  };

  static final Map<String, String> feeds = {
    'READ': 'Notification marked as read',
    'ADD': 'Memorial Audio added successfully.',
    'EDIT': 'Memorial Audio Info has been updated.',
    'DELETE': 'Memorial Audio has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial Audio?',
  };

  static final Map<String, String> memorialVideo = {
    'ADD': 'Memorial Video added successfully.',
    'EDIT': 'Memorial Video Info has been updated.',
    'DELETE': 'Memorial Video has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial Video?',
  };

  static final Map<String, String> memorialPhoto = {
    'ADD': 'Memorial Photo added successfully.',
    'EDIT': 'Memorial Photo Info has been updated.',
    'DELETE': 'Memorial Photo has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial Photo?',
  };

  static final Map<String, String> memorialVisit = {
    'ADD': 'Memorial Visit added successfully.',
    'EDIT': 'Memorial Visit Info has been updated.',
    'DELETE': 'Memorial Visit has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial Visit?',
  };

  static final Map<String, String> memorialStory = {
    'ADD': 'Memorial Story added successfully.',
    'EDIT': 'Memorial Story Info has been updated.',
    'DELETE': 'Memorial Story has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Memorial Story?',
  };

  static final Map<String, String> theme = {
    'ADD': 'Theme added successfully.',
    'EDIT': 'Theme Info has been updated.',
    'DELETE': 'Theme has been deleted.',
    'DELETE_CONFIRM': 'Are you sure you want to delete this Theme?',
  };

  static final Map<String, String> login = {
    'VERIFY_ACCESS_CODE_ERR': 'Access Code is invalid. Please try again.',
  };

  static String SITE_TITLE_PREFIX = SITE_NAME + ' - ';
  static List ALL_COUNTRIES = [
    {
      "code": "AD",
      "name": "Andorra",
      "FlagCssClass": "flag-ad",
      "InputMasking": "999 999",
      "dial_code": "+376",
      "IsShowCustomFlag": false
    },
    {
      "code": "AE",
      "name": "United Arab Emirates",
      "FlagCssClass": "flag-ae",
      "InputMasking": "999 999 9999",
      "dial_code": "+971",
      "IsShowCustomFlag": false
    },
    {
      "code": "AF",
      "name": "Afghanistan",
      "FlagCssClass": "flag-af",
      "InputMasking": "999 999 9999",
      "dial_code": "+93",
      "IsShowCustomFlag": false
    },
    {
      "code": "AG",
      "name": "Antigua and Barbuda",
      "FlagCssClass": "flag-ag",
      "InputMasking": "999-9999",
      "dial_code": "+1 (268)",
      "IsShowCustomFlag": false
    },
    {
      "code": "AI",
      "name": "Anguilla",
      "FlagCssClass": "flag-ai",
      "InputMasking": "999-9999",
      "dial_code": "+1 (264)",
      "IsShowCustomFlag": false
    },
    {
      "code": "AL",
      "name": "Albania",
      "FlagCssClass": "flag-al",
      "InputMasking": "999 999 9999",
      "dial_code": "+355",
      "IsShowCustomFlag": false
    },
    {
      "code": "AM",
      "name": "Armenia",
      "FlagCssClass": "flag-am",
      "InputMasking": "999 999999",
      "dial_code": "+374",
      "IsShowCustomFlag": false
    },
    {
      "code": "AN",
      "name": "Netherlands Antilles",
      "FlagCssClass": "flag-an",
      "InputMasking": "999 9999",
      "dial_code": "+599",
      "IsShowCustomFlag": false
    },
    {
      "code": "AO",
      "name": "Angola",
      "FlagCssClass": "flag-ao",
      "InputMasking": "999 999 999",
      "dial_code": "+244",
      "IsShowCustomFlag": false
    },
    {
      "code": "AQ",
      "name": "Antarctica",
      "FlagCssClass": "flag-aq",
      "InputMasking": "9 99999",
      "dial_code": "+672",
      "IsShowCustomFlag": false
    },
    {
      "code": "AR",
      "name": "Argentina",
      "FlagCssClass": "flag-ar",
      "InputMasking": "999 99-9999-9999",
      "dial_code": "+54",
      "IsShowCustomFlag": false
    },
    {
      "code": "AS",
      "name": "American Samoa",
      "FlagCssClass": "flag-as",
      "InputMasking": "999-9999",
      "dial_code": "+1 (684)",
      "IsShowCustomFlag": false
    },
    {
      "code": "AT",
      "name": "Austria",
      "FlagCssClass": "flag-at",
      "InputMasking": "9999 999999",
      "dial_code": "+43",
      "IsShowCustomFlag": false
    },
    {
      "code": "AU",
      "name": "Australia",
      "FlagCssClass": "flag-au",
      "InputMasking": "9999 999 999",
      "dial_code": "+61",
      "IsShowCustomFlag": false
    },
    {
      "code": "AW",
      "name": "Aruba",
      "FlagCssClass": "flag-aw",
      "InputMasking": "999 9999",
      "dial_code": "+297",
      "IsShowCustomFlag": false
    },
    {
      "code": "AZ",
      "name": "Azerbaijan",
      "FlagCssClass": "flag-az",
      "InputMasking": "999 999 99 99",
      "dial_code": "+994",
      "IsShowCustomFlag": false
    },
    {
      "code": "BA",
      "name": "Bosnia and Herzegovina",
      "FlagCssClass": "flag-ba",
      "InputMasking": "999 999 999",
      "dial_code": "+387",
      "IsShowCustomFlag": false
    },
    {
      "code": "BB",
      "name": "Barbados",
      "FlagCssClass": "flag-bb",
      "InputMasking": "999-9999",
      "dial_code": "+1 (246)",
      "IsShowCustomFlag": false
    },
    {
      "code": "BD",
      "name": "Bangladesh",
      "FlagCssClass": "flag-bd",
      "InputMasking": "99999-999999",
      "dial_code": "+880",
      "IsShowCustomFlag": false
    },
    {
      "code": "BE",
      "name": "Belgium",
      "FlagCssClass": "flag-be",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+32",
      "IsShowCustomFlag": false
    },
    {
      "code": "BF",
      "name": "Burkina Faso",
      "FlagCssClass": "flag-bf",
      "InputMasking": "99 99 99 99",
      "dial_code": "+226",
      "IsShowCustomFlag": false
    },
    {
      "code": "BG",
      "name": "Bulgaria",
      "FlagCssClass": "flag-bg",
      "InputMasking": "999 999 999",
      "dial_code": "+359",
      "IsShowCustomFlag": false
    },
    {
      "code": "BH",
      "name": "Bahrain",
      "FlagCssClass": "flag-bh",
      "InputMasking": "9999 9999",
      "dial_code": "+973",
      "IsShowCustomFlag": false
    },
    {
      "code": "BI",
      "name": "Burundi",
      "FlagCssClass": "flag-bi",
      "InputMasking": "99 99 99 99",
      "dial_code": "+257",
      "IsShowCustomFlag": false
    },
    {
      "code": "BJ",
      "name": "Benin",
      "FlagCssClass": "flag-bj",
      "InputMasking": "99 99 99 99",
      "dial_code": "+229",
      "IsShowCustomFlag": false
    },
    {
      "code": "BL",
      "name": "Saint Barthelemy",
      "FlagCssClass": "flag-bl",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+590",
      "IsShowCustomFlag": false
    },
    {
      "code": "BM",
      "name": "Bermuda",
      "FlagCssClass": "flag-bm",
      "InputMasking": "999-9999",
      "dial_code": "+1 (441)",
      "IsShowCustomFlag": false
    },
    {
      "code": "BN",
      "name": "Brunei",
      "FlagCssClass": "flag-bn",
      "InputMasking": "999 9999",
      "dial_code": "+673",
      "IsShowCustomFlag": false
    },
    {
      "code": "BO",
      "name": "Bolivia",
      "FlagCssClass": "flag-bo",
      "InputMasking": "99999999",
      "dial_code": "+591",
      "IsShowCustomFlag": false
    },
    {
      "code": "BR",
      "name": "Brazil",
      "FlagCssClass": "flag-br",
      "InputMasking": "(99) 99999-9999",
      "dial_code": "+55",
      "IsShowCustomFlag": false
    },
    {
      "code": "BS",
      "name": "Bahamas",
      "FlagCssClass": "flag-bs",
      "InputMasking": "999-9999",
      "dial_code": "+1 (242)",
      "IsShowCustomFlag": false
    },
    {
      "code": "BT",
      "name": "Bhutan",
      "FlagCssClass": "flag-bt",
      "InputMasking": "99 99 99 99",
      "dial_code": "+975",
      "IsShowCustomFlag": false
    },
    {
      "code": "BW",
      "name": "Botswana",
      "FlagCssClass": "flag-bw",
      "InputMasking": "99 999 999",
      "dial_code": "+267",
      "IsShowCustomFlag": false
    },
    {
      "code": "BY",
      "name": "Belarus",
      "FlagCssClass": "flag-by",
      "InputMasking": "9 999 999-99-99",
      "dial_code": "+375",
      "IsShowCustomFlag": false
    },
    {
      "code": "BZ",
      "name": "Belize",
      "FlagCssClass": "flag-bz",
      "InputMasking": "999-9999",
      "dial_code": "+501",
      "IsShowCustomFlag": false
    },
    {
      "code": "CA",
      "name": "Canada",
      "FlagCssClass": "flag-ca",
      "InputMasking": "(999) 999-9999",
      "dial_code": "+1",
      "IsShowCustomFlag": false
    },
    {
      "code": "CC",
      "name": "Cocos Islands",
      "FlagCssClass": "flag-cc",
      "InputMasking": "9999 999 999",
      "dial_code": "+61",
      "IsShowCustomFlag": false
    },
    {
      "code": "CD",
      "name": "Democratic Republic of the Congo",
      "FlagCssClass": "flag-cd",
      "InputMasking": "9999 999 999",
      "dial_code": "+243",
      "IsShowCustomFlag": false
    },
    {
      "code": "CF",
      "name": "Central African Republic",
      "FlagCssClass": "flag-cf",
      "InputMasking": "99 99 99 99",
      "dial_code": "+236",
      "IsShowCustomFlag": false
    },
    {
      "code": "CG",
      "name": "Republic of the Congo",
      "FlagCssClass": "flag-cg",
      "InputMasking": " 99 999 9999",
      "dial_code": "+242",
      "IsShowCustomFlag": false
    },
    {
      "code": "CH",
      "name": "Switzerland",
      "FlagCssClass": "flag-ch",
      "InputMasking": "999 999 99 99",
      "dial_code": "+41",
      "IsShowCustomFlag": false
    },
    {
      "code": "CI",
      "name": "Ivory Coast",
      "FlagCssClass": "flag-ci",
      "InputMasking": "99 99 99 99",
      "dial_code": "+225",
      "IsShowCustomFlag": false
    },
    {
      "code": "CK",
      "name": "Cook Islands",
      "FlagCssClass": "flag-ck",
      "InputMasking": "99 9999",
      "dial_code": "+682",
      "IsShowCustomFlag": false
    },
    {
      "code": "CL",
      "name": "Chile",
      "FlagCssClass": "flag-cl",
      "InputMasking": "9 9999 9999",
      "dial_code": "+56",
      "IsShowCustomFlag": false
    },
    {
      "code": "CM",
      "name": "Cameroon",
      "FlagCssClass": "flag-cm",
      "InputMasking": "9 99 99 99 99",
      "dial_code": "+237",
      "IsShowCustomFlag": false
    },
    {
      "code": "CN",
      "name": "China",
      "FlagCssClass": "flag-cn",
      "InputMasking": "999 9999 9999",
      "dial_code": "+86",
      "IsShowCustomFlag": false
    },
    {
      "code": "CO",
      "name": "Colombia",
      "FlagCssClass": "flag-co",
      "InputMasking": "999 9999999",
      "dial_code": "+57",
      "IsShowCustomFlag": false
    },
    {
      "code": "CR",
      "name": "Costa Rica",
      "FlagCssClass": "flag-cr",
      "InputMasking": "9999 9999",
      "dial_code": "+506",
      "IsShowCustomFlag": false
    },
    {
      "code": "CU",
      "name": "Cuba",
      "FlagCssClass": "flag-cu",
      "InputMasking": "99 9999999",
      "dial_code": "+53",
      "IsShowCustomFlag": false
    },
    {
      "code": "CV",
      "name": "Cape Verde",
      "FlagCssClass": "flag-cv",
      "InputMasking": "999 99 99",
      "dial_code": "+238",
      "IsShowCustomFlag": false
    },
    {
      "code": "CW",
      "name": "Curacao",
      "FlagCssClass": "flag-cw",
      "InputMasking": "999 9999",
      "dial_code": "+599",
      "IsShowCustomFlag": false
    },
    {
      "code": "CX",
      "name": "Christmas Island",
      "FlagCssClass": "flag-cx",
      "InputMasking": "9999 999 999",
      "dial_code": "+61",
      "IsShowCustomFlag": false
    },
    {
      "code": "CY",
      "name": "Cyprus",
      "FlagCssClass": "flag-cy",
      "InputMasking": "99 999999",
      "dial_code": "+357",
      "IsShowCustomFlag": false
    },
    {
      "code": "CZ",
      "name": "Czech Republic",
      "FlagCssClass": "flag-cz",
      "InputMasking": "999 999 999",
      "dial_code": "+420",
      "IsShowCustomFlag": false
    },
    {
      "code": "DE",
      "name": "Germany",
      "FlagCssClass": "flag-de",
      "InputMasking": "99999 9999999",
      "dial_code": "+49",
      "IsShowCustomFlag": false
    },
    {
      "code": "DJ",
      "name": "Djibouti",
      "FlagCssClass": "flag-dj",
      "InputMasking": "99 99 99 99",
      "dial_code": "+253",
      "IsShowCustomFlag": false
    },
    {
      "code": "DK",
      "name": "Denmark",
      "FlagCssClass": "flag-dk",
      "InputMasking": "99 99 99 99",
      "dial_code": "+45",
      "IsShowCustomFlag": false
    },
    {
      "code": "DM",
      "name": "Dominica",
      "FlagCssClass": "flag-dm",
      "InputMasking": "999-9999",
      "dial_code": "+1 (767)",
      "IsShowCustomFlag": false
    },
    {
      "code": "DO",
      "name": "Dominican Republic",
      "FlagCssClass": "flag-do",
      "InputMasking": "999-9999",
      "dial_code": "+1 (809)",
      "IsShowCustomFlag": false
    },
    {
      "code": "DZ",
      "name": "Algeria",
      "FlagCssClass": "flag-dz",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+213",
      "IsShowCustomFlag": false
    },
    {
      "code": "EC",
      "name": "Ecuador",
      "FlagCssClass": "flag-ec",
      "InputMasking": "999 999 9999",
      "dial_code": "+593",
      "IsShowCustomFlag": false
    },
    {
      "code": "EE",
      "name": "Estonia",
      "FlagCssClass": "flag-ee",
      "InputMasking": "9999 9999",
      "dial_code": "+372",
      "IsShowCustomFlag": false
    },
    {
      "code": "EG",
      "name": "Egypt",
      "FlagCssClass": "flag-eg",
      "InputMasking": "9999 999 9999",
      "dial_code": "+20",
      "IsShowCustomFlag": false
    },
    {
      "code": "EH",
      "name": "Western Sahara",
      "FlagCssClass": "flag-eh",
      "InputMasking": "9999-999999",
      "dial_code": "+212",
      "IsShowCustomFlag": false
    },
    {
      "code": "ER",
      "name": "Eritrea",
      "FlagCssClass": "flag-er",
      "InputMasking": "99 999 999",
      "dial_code": "+291",
      "IsShowCustomFlag": false
    },
    {
      "code": "ES",
      "name": "Spain",
      "FlagCssClass": "flag-es",
      "InputMasking": "999 99 99 99",
      "dial_code": "+34",
      "IsShowCustomFlag": false
    },
    {
      "code": "ET",
      "name": "Ethiopia",
      "FlagCssClass": "flag-et",
      "InputMasking": "999 999 9999",
      "dial_code": "+251",
      "IsShowCustomFlag": false
    },
    {
      "code": "FI",
      "name": "Finland",
      "FlagCssClass": "flag-fi",
      "InputMasking": "999 9999999",
      "dial_code": "+358",
      "IsShowCustomFlag": false
    },
    {
      "code": "FJ",
      "name": "Fiji",
      "FlagCssClass": "flag-fj",
      "InputMasking": "999 9999",
      "dial_code": "+679",
      "IsShowCustomFlag": false
    },
    {
      "code": "FK",
      "name": "Falkland Islands",
      "FlagCssClass": "flag-fk",
      "InputMasking": "99999",
      "dial_code": "+500",
      "IsShowCustomFlag": false
    },
    {
      "code": "FM",
      "name": "Micronesia",
      "FlagCssClass": "flag-fm",
      "InputMasking": "999 9999",
      "dial_code": "+691",
      "IsShowCustomFlag": false
    },
    {
      "code": "FO",
      "name": "Faroe Islands",
      "FlagCssClass": "flag-fo",
      "InputMasking": "999999",
      "dial_code": "+298",
      "IsShowCustomFlag": false
    },
    {
      "code": "FR",
      "name": "France",
      "FlagCssClass": "flag-fr",
      "InputMasking": "99 99 99 99 99",
      "dial_code": "+33",
      "IsShowCustomFlag": false
    },
    {
      "code": "GA",
      "name": "Gabon",
      "FlagCssClass": "flag-ga",
      "InputMasking": "99 99 99 99",
      "dial_code": "+241",
      "IsShowCustomFlag": false
    },
    {
      "code": "GB",
      "name": "United Kingdom",
      "FlagCssClass": "flag-gb",
      "InputMasking": "99999 99999",
      "dial_code": "+44",
      "IsShowCustomFlag": false
    },
    {
      "code": "GD",
      "name": "Grenada",
      "FlagCssClass": "flag-gd",
      "InputMasking": "999-9999",
      "dial_code": "+1 (473)",
      "IsShowCustomFlag": false
    },
    {
      "code": "GE",
      "name": "Georgia",
      "FlagCssClass": "flag-ge",
      "InputMasking": "999 99 99 99",
      "dial_code": "+995",
      "IsShowCustomFlag": false
    },
    {
      "code": "GG",
      "name": "Guernsey",
      "FlagCssClass": "flag-gg",
      "InputMasking": "99999 999999",
      "dial_code": "+44",
      "IsShowCustomFlag": false
    },
    {
      "code": "GH",
      "name": "Ghana",
      "FlagCssClass": "flag-gh",
      "InputMasking": "999 999 9999",
      "dial_code": "+233",
      "IsShowCustomFlag": false
    },
    {
      "code": "GI",
      "name": "Gibraltar",
      "FlagCssClass": "flag-gi",
      "InputMasking": "99999999",
      "dial_code": "+350",
      "IsShowCustomFlag": false
    },
    {
      "code": "GL",
      "name": "Greenland",
      "FlagCssClass": "flag-gl",
      "InputMasking": "99 99 99",
      "dial_code": "+299",
      "IsShowCustomFlag": false
    },
    {
      "code": "GM",
      "name": "Gambia",
      "FlagCssClass": "flag-gm",
      "InputMasking": "999 9999",
      "dial_code": "+220",
      "IsShowCustomFlag": false
    },
    {
      "code": "GN",
      "name": "Guinea",
      "FlagCssClass": "flag-gn",
      "InputMasking": "999 99 99 99",
      "dial_code": "+224",
      "IsShowCustomFlag": false
    },
    {
      "code": "GQ",
      "name": "Equatorial Guinea",
      "FlagCssClass": "flag-gq",
      "InputMasking": "999 999 999",
      "dial_code": "+240",
      "IsShowCustomFlag": false
    },
    {
      "code": "GR",
      "name": "Greece",
      "FlagCssClass": "flag-gr",
      "InputMasking": "999 999 9999",
      "dial_code": "+30",
      "IsShowCustomFlag": false
    },
    {
      "code": "GT",
      "name": "Guatemala",
      "FlagCssClass": "flag-gt",
      "InputMasking": "9999 9999",
      "dial_code": "+502",
      "IsShowCustomFlag": false
    },
    {
      "code": "GU",
      "name": "Guam",
      "FlagCssClass": "flag-gu",
      "InputMasking": "999-9999",
      "dial_code": "+1 (671)",
      "IsShowCustomFlag": false
    },
    {
      "code": "GW",
      "name": "Guinea-Bissau",
      "FlagCssClass": "flag-gw",
      "InputMasking": "999 999 999",
      "dial_code": "+245",
      "IsShowCustomFlag": false
    },
    {
      "code": "GY",
      "name": "Guyana",
      "FlagCssClass": "flag-gy",
      "InputMasking": "999 9999",
      "dial_code": "+592",
      "IsShowCustomFlag": false
    },
    {
      "code": "HK",
      "name": "Hong Kong",
      "FlagCssClass": "flag-hk",
      "InputMasking": "9999 9999",
      "dial_code": "+852",
      "IsShowCustomFlag": false
    },
    {
      "code": "HN",
      "name": "Honduras",
      "FlagCssClass": "flag-hn",
      "InputMasking": "9999-9999",
      "dial_code": "+504",
      "IsShowCustomFlag": false
    },
    {
      "code": "HR",
      "name": "Croatia",
      "FlagCssClass": "flag-hr",
      "InputMasking": "999 999 9999",
      "dial_code": "+385",
      "IsShowCustomFlag": false
    },
    {
      "code": "HT",
      "name": "Haiti",
      "FlagCssClass": "flag-ht",
      "InputMasking": "99 99 9999",
      "dial_code": "+509",
      "IsShowCustomFlag": false
    },
    {
      "code": "HU",
      "name": "Hungary",
      "FlagCssClass": "flag-hu",
      "InputMasking": "(99) 999 9999",
      "dial_code": "+36",
      "IsShowCustomFlag": false
    },
    {
      "code": "ID",
      "name": "Indonesia",
      "FlagCssClass": "flag-id",
      "InputMasking": "9999-999-999",
      "dial_code": "+62",
      "IsShowCustomFlag": false
    },
    {
      "code": "IE",
      "name": "Ireland",
      "FlagCssClass": "flag-ie",
      "InputMasking": "999 999 9999",
      "dial_code": "+353",
      "IsShowCustomFlag": false
    },
    {
      "code": "IL",
      "name": "Israel",
      "FlagCssClass": "flag-il",
      "InputMasking": "999-999-9999",
      "dial_code": "+972",
      "IsShowCustomFlag": false
    },
    {
      "code": "IM",
      "name": "Isle of Man",
      "FlagCssClass": "flag-im",
      "InputMasking": "99999 999999",
      "dial_code": "+44",
      "IsShowCustomFlag": false
    },
    {
      "code": "IN",
      "name": "India",
      "FlagCssClass": "flag-in",
      "InputMasking": "99999 99999",
      "dial_code": "+91",
      "IsShowCustomFlag": false
    },
    {
      "code": "IO",
      "name": "British Indian Ocean Territory",
      "FlagCssClass": "flag-io",
      "InputMasking": "999 9999",
      "dial_code": "+246",
      "IsShowCustomFlag": false
    },
    {
      "code": "IQ",
      "name": "Iraq",
      "FlagCssClass": "flag-iq",
      "InputMasking": "9999 999 9999",
      "dial_code": "+964",
      "IsShowCustomFlag": false
    },
    {
      "code": "IR",
      "name": "Iran",
      "FlagCssClass": "flag-ir",
      "InputMasking": "9999 999 9999",
      "dial_code": "+98",
      "IsShowCustomFlag": false
    },
    {
      "code": "IS",
      "name": "Iceland",
      "FlagCssClass": "flag-is",
      "InputMasking": "999 9999",
      "dial_code": "+354",
      "IsShowCustomFlag": false
    },
    {
      "code": "IT",
      "name": "Italy",
      "FlagCssClass": "flag-it",
      "InputMasking": "999 999 9999",
      "dial_code": "+39",
      "IsShowCustomFlag": false
    },
    {
      "code": "JE",
      "name": "Jersey",
      "FlagCssClass": "flag-je",
      "InputMasking": "99999 999999",
      "dial_code": "+44",
      "IsShowCustomFlag": false
    },
    {
      "code": "JM",
      "name": "Jamaica",
      "FlagCssClass": "flag-jm",
      "InputMasking": "999-9999",
      "dial_code": "+1 (876)",
      "IsShowCustomFlag": false
    },
    {
      "code": "JO",
      "name": "Jordan",
      "FlagCssClass": "flag-jo",
      "InputMasking": "99 9999 9999",
      "dial_code": "+962",
      "IsShowCustomFlag": false
    },
    {
      "code": "JP",
      "name": "Japan",
      "FlagCssClass": "flag-jp",
      "InputMasking": "999 9999-9999",
      "dial_code": "+81",
      "IsShowCustomFlag": false
    },
    {
      "code": "KE",
      "name": "Kenya",
      "FlagCssClass": "flag-ke",
      "InputMasking": "9999 999999",
      "dial_code": "+254",
      "IsShowCustomFlag": false
    },
    {
      "code": "KG",
      "name": "Kyrgyzstan",
      "FlagCssClass": "flag-kg",
      "InputMasking": "9999 999 999",
      "dial_code": "+996",
      "IsShowCustomFlag": false
    },
    {
      "code": "KH",
      "name": "Cambodia",
      "FlagCssClass": "flag-kh",
      "InputMasking": "999 999 999",
      "dial_code": "+855",
      "IsShowCustomFlag": false
    },
    {
      "code": "KI",
      "name": "Kiribati",
      "FlagCssClass": "flag-ki",
      "InputMasking": "99999999",
      "dial_code": "+686",
      "IsShowCustomFlag": false
    },
    {
      "code": "KM",
      "name": "Comoros",
      "FlagCssClass": "flag-km",
      "InputMasking": "999 99 99",
      "dial_code": "+269",
      "IsShowCustomFlag": false
    },
    {
      "code": "KN",
      "name": "Saint Kitts and Nevis",
      "FlagCssClass": "flag-kn",
      "InputMasking": "999-9999",
      "dial_code": "+1 (869)",
      "IsShowCustomFlag": false
    },
    {
      "code": "KP",
      "name": "North Korea",
      "FlagCssClass": "flag-kp",
      "InputMasking": "9999 999 9999",
      "dial_code": "+850",
      "IsShowCustomFlag": false
    },
    {
      "code": "KR",
      "name": "South Korea",
      "FlagCssClass": "flag-kr",
      "InputMasking": "999-9999-9999",
      "dial_code": "+82",
      "IsShowCustomFlag": false
    },
    {
      "code": "KW",
      "name": "Kuwait",
      "FlagCssClass": "flag-kw",
      "InputMasking": "999 99999",
      "dial_code": "+965",
      "IsShowCustomFlag": false
    },
    {
      "code": "KY",
      "name": "Cayman Islands",
      "FlagCssClass": "flag-ky",
      "InputMasking": "999-9999",
      "dial_code": "+1 (345)",
      "IsShowCustomFlag": false
    },
    {
      "code": "KZ",
      "name": "Kazakhstan",
      "FlagCssClass": "flag-kz",
      "InputMasking": "9 (999) 999 9999",
      "dial_code": "+7",
      "IsShowCustomFlag": false
    },
    {
      "code": "LA",
      "name": "Laos",
      "FlagCssClass": "flag-la",
      "InputMasking": "999 99 999 999",
      "dial_code": "+856",
      "IsShowCustomFlag": false
    },
    {
      "code": "LB",
      "name": "Lebanon",
      "FlagCssClass": "flag-lb",
      "InputMasking": "99 999 999",
      "dial_code": "+961",
      "IsShowCustomFlag": false
    },
    {
      "code": "LC",
      "name": "Saint Lucia",
      "FlagCssClass": "flag-lc",
      "InputMasking": "999-9999",
      "dial_code": "+1 (758)",
      "IsShowCustomFlag": false
    },
    {
      "code": "LI",
      "name": "Liechtenstein",
      "FlagCssClass": "flag-li",
      "InputMasking": "999 999 999",
      "dial_code": "+423",
      "IsShowCustomFlag": false
    },
    {
      "code": "LK",
      "name": "Sri Lanka",
      "FlagCssClass": "flag-lk",
      "InputMasking": "999 999 9999",
      "dial_code": "+94",
      "IsShowCustomFlag": false
    },
    {
      "code": "LR",
      "name": "Liberia",
      "FlagCssClass": "flag-lr",
      "InputMasking": "999 999 9999",
      "dial_code": "+231",
      "IsShowCustomFlag": false
    },
    {
      "code": "LS",
      "name": "Lesotho",
      "FlagCssClass": "flag-ls",
      "InputMasking": "9999 9999",
      "dial_code": "+266",
      "IsShowCustomFlag": false
    },
    {
      "code": "LT",
      "name": "Lithuania",
      "FlagCssClass": "flag-lt",
      "InputMasking": "(9-999) 99999",
      "dial_code": "+370",
      "IsShowCustomFlag": false
    },
    {
      "code": "LU",
      "name": "Luxembourg",
      "FlagCssClass": "flag-lu",
      "InputMasking": "999 999 999",
      "dial_code": "+352",
      "IsShowCustomFlag": false
    },
    {
      "code": "LV",
      "name": "Latvia",
      "FlagCssClass": "flag-lv",
      "InputMasking": "99 999 999",
      "dial_code": "+371",
      "IsShowCustomFlag": false
    },
    {
      "code": "LY",
      "name": "Libya",
      "FlagCssClass": "flag-ly",
      "InputMasking": "999-9999999",
      "dial_code": "+218",
      "IsShowCustomFlag": false
    },
    {
      "code": "MA",
      "name": "Morocco",
      "FlagCssClass": "flag-ma",
      "InputMasking": "9999-999999",
      "dial_code": "+212",
      "IsShowCustomFlag": false
    },
    {
      "code": "MC",
      "name": "Monaco",
      "FlagCssClass": "flag-mc",
      "InputMasking": "99 99 99 99 99",
      "dial_code": "+377",
      "IsShowCustomFlag": false
    },
    {
      "code": "MD",
      "name": "Moldova",
      "FlagCssClass": "flag-md",
      "InputMasking": "9999 99 999",
      "dial_code": "+373",
      "IsShowCustomFlag": false
    },
    {
      "code": "ME",
      "name": "Montenegro",
      "FlagCssClass": "flag-me",
      "InputMasking": "999 999 999",
      "dial_code": "+382",
      "IsShowCustomFlag": false
    },
    {
      "code": "MF",
      "name": "Saint Martin",
      "FlagCssClass": "flag-mf",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+590",
      "IsShowCustomFlag": false
    },
    {
      "code": "MG",
      "name": "Madagascar",
      "FlagCssClass": "flag-mg",
      "InputMasking": "999 99 999 99",
      "dial_code": "+261",
      "IsShowCustomFlag": false
    },
    {
      "code": "MH",
      "name": "Marshall Islands",
      "FlagCssClass": "flag-mh",
      "InputMasking": "999-9999",
      "dial_code": "+692",
      "IsShowCustomFlag": false
    },
    {
      "code": "MK",
      "name": "Macedonia",
      "FlagCssClass": "flag-mk",
      "InputMasking": "999 999 999",
      "dial_code": "+389",
      "IsShowCustomFlag": false
    },
    {
      "code": "ML",
      "name": "Mali",
      "FlagCssClass": "flag-ml",
      "InputMasking": "99 99 99 99",
      "dial_code": "+223",
      "IsShowCustomFlag": false
    },
    {
      "code": "MM",
      "name": "Myanmar",
      "FlagCssClass": "flag-mm",
      "InputMasking": "99 999 9999",
      "dial_code": "+95",
      "IsShowCustomFlag": false
    },
    {
      "code": "MN",
      "name": "Mongolia",
      "FlagCssClass": "flag-mn",
      "InputMasking": "9999 9999",
      "dial_code": "+976",
      "IsShowCustomFlag": false
    },
    {
      "code": "MO",
      "name": "Macau",
      "FlagCssClass": "flag-mo",
      "InputMasking": "9999 9999",
      "dial_code": "+853",
      "IsShowCustomFlag": false
    },
    {
      "code": "MP",
      "name": "Northern Mariana Islands",
      "FlagCssClass": "flag-mp",
      "InputMasking": "999-9999",
      "dial_code": "+1 (670)",
      "IsShowCustomFlag": false
    },
    {
      "code": "MR",
      "name": "Mauritania",
      "FlagCssClass": "flag-mr",
      "InputMasking": "99 99 99 99",
      "dial_code": "+222",
      "IsShowCustomFlag": false
    },
    {
      "code": "MS",
      "name": "Montserrat",
      "FlagCssClass": "flag-ms",
      "InputMasking": "999-9999",
      "dial_code": "+1 (664)",
      "IsShowCustomFlag": false
    },
    {
      "code": "MT",
      "name": "Malta",
      "FlagCssClass": "flag-mt",
      "InputMasking": "9999 9999",
      "dial_code": "+356",
      "IsShowCustomFlag": false
    },
    {
      "code": "MU",
      "name": "Mauritius",
      "FlagCssClass": "flag-mu",
      "InputMasking": "9999 9999",
      "dial_code": "+230",
      "IsShowCustomFlag": false
    },
    {
      "code": "MV",
      "name": "Maldives",
      "FlagCssClass": "flag-mv",
      "InputMasking": "999-9999",
      "dial_code": "+960",
      "IsShowCustomFlag": false
    },
    {
      "code": "MW",
      "name": "Malawi",
      "FlagCssClass": "flag-mw",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+265",
      "IsShowCustomFlag": false
    },
    {
      "code": "MX",
      "name": "Mexico",
      "FlagCssClass": "flag-mx",
      "InputMasking": "999 999 999 9999",
      "dial_code": "+52",
      "IsShowCustomFlag": false
    },
    {
      "code": "MY",
      "name": "Malaysia",
      "FlagCssClass": "flag-my",
      "InputMasking": "999-999 9999",
      "dial_code": "+60",
      "IsShowCustomFlag": false
    },
    {
      "code": "MZ",
      "name": "Mozambique",
      "FlagCssClass": "flag-mz",
      "InputMasking": "99 999 9999",
      "dial_code": "+258",
      "IsShowCustomFlag": false
    },
    {
      "code": "NA",
      "name": "Namibia",
      "FlagCssClass": "flag-na",
      "InputMasking": "999 999 9999",
      "dial_code": "+264",
      "IsShowCustomFlag": false
    },
    {
      "code": "NC",
      "name": "New Caledonia",
      "FlagCssClass": "flag-nc",
      "InputMasking": "99 99 99",
      "dial_code": "+687",
      "IsShowCustomFlag": false
    },
    {
      "code": "NE",
      "name": "Niger",
      "FlagCssClass": "flag-ne",
      "InputMasking": "99 99 99 99",
      "dial_code": "+227",
      "IsShowCustomFlag": false
    },
    {
      "code": "NG",
      "name": "Nigeria",
      "FlagCssClass": "flag-ng",
      "InputMasking": "9999 999 9999",
      "dial_code": "+234",
      "IsShowCustomFlag": false
    },
    {
      "code": "NI",
      "name": "Nicaragua",
      "FlagCssClass": "flag-ni",
      "InputMasking": "9999 9999",
      "dial_code": "+505",
      "IsShowCustomFlag": false
    },
    {
      "code": "NL",
      "name": "Netherlands",
      "FlagCssClass": "flag-nl",
      "InputMasking": "99 99999999",
      "dial_code": "+31",
      "IsShowCustomFlag": false
    },
    {
      "code": "NO",
      "name": "Norway",
      "FlagCssClass": "flag-no",
      "InputMasking": "999 99 999",
      "dial_code": "+47",
      "IsShowCustomFlag": false
    },
    {
      "code": "NP",
      "name": "Nepal",
      "FlagCssClass": "flag-np",
      "InputMasking": "999-9999999",
      "dial_code": "+977",
      "IsShowCustomFlag": false
    },
    {
      "code": "NR",
      "name": "Nauru",
      "FlagCssClass": "flag-nr",
      "InputMasking": "999 9999",
      "dial_code": "+674",
      "IsShowCustomFlag": false
    },
    {
      "code": "NU",
      "name": "Niue",
      "FlagCssClass": "flag-nu",
      "InputMasking": "999 9999",
      "dial_code": "+683",
      "IsShowCustomFlag": false
    },
    {
      "code": "NZ",
      "name": "New Zealand",
      "FlagCssClass": "flag-nz",
      "InputMasking": "999 999 9999",
      "dial_code": "+64",
      "IsShowCustomFlag": false
    },
    {
      "code": "OM",
      "name": "Oman",
      "FlagCssClass": "flag-om",
      "InputMasking": "9999 9999",
      "dial_code": "+968",
      "IsShowCustomFlag": false
    },
    {
      "code": "PA",
      "name": "Panama",
      "FlagCssClass": "flag-pa",
      "InputMasking": "9999-9999",
      "dial_code": "+507",
      "IsShowCustomFlag": false
    },
    {
      "code": "PE",
      "name": "Peru",
      "FlagCssClass": "flag-pe",
      "InputMasking": "999 999 999",
      "dial_code": "+51",
      "IsShowCustomFlag": false
    },
    {
      "code": "PF",
      "name": "French Polynesia",
      "FlagCssClass": "flag-pf",
      "InputMasking": "99 99 99 99",
      "dial_code": "+689",
      "IsShowCustomFlag": false
    },
    {
      "code": "PG",
      "name": "Papua New Guinea",
      "FlagCssClass": "flag-pg",
      "InputMasking": "9999 9999",
      "dial_code": "+675",
      "IsShowCustomFlag": false
    },
    {
      "code": "PH",
      "name": "Philippines",
      "FlagCssClass": "flag-ph",
      "InputMasking": "9999 999 9999",
      "dial_code": "+63",
      "IsShowCustomFlag": false
    },
    {
      "code": "PK",
      "name": "Pakistan",
      "FlagCssClass": "flag-pk",
      "InputMasking": "9999 9999999",
      "dial_code": "+92",
      "IsShowCustomFlag": false
    },
    {
      "code": "PL",
      "name": "Poland",
      "FlagCssClass": "flag-pl",
      "InputMasking": "999 999 999",
      "dial_code": "+48",
      "IsShowCustomFlag": false
    },
    {
      "code": "PM",
      "name": "Saint Pierre and Miquelon",
      "FlagCssClass": "flag-pm",
      "InputMasking": "999 99 99",
      "dial_code": "+508",
      "IsShowCustomFlag": false
    },
    {
      "code": "PN",
      "name": "Pitcairn",
      "FlagCssClass": "flag-pn",
      "InputMasking": "99 999999",
      "dial_code": "+64",
      "IsShowCustomFlag": false
    },
    {
      "code": "PR",
      "name": "Puerto Rico",
      "FlagCssClass": "flag-pr",
      "InputMasking": "999-9999",
      "dial_code": "+1 (787)",
      "IsShowCustomFlag": false
    },
    {
      "code": "PS",
      "name": "Palestine",
      "FlagCssClass": "flag-ps",
      "InputMasking": "9999 999 999",
      "dial_code": "+970",
      "IsShowCustomFlag": false
    },
    {
      "code": "PT",
      "name": "Portugal",
      "FlagCssClass": "flag-pt",
      "InputMasking": "999 999 999",
      "dial_code": "+351",
      "IsShowCustomFlag": false
    },
    {
      "code": "PW",
      "name": "Palau",
      "FlagCssClass": "flag-pw",
      "InputMasking": "999 9999",
      "dial_code": "+680",
      "IsShowCustomFlag": false
    },
    {
      "code": "PY",
      "name": "Paraguay",
      "FlagCssClass": "flag-py",
      "InputMasking": "9999 999999",
      "dial_code": "+595",
      "IsShowCustomFlag": false
    },
    {
      "code": "QA",
      "name": "Qatar",
      "FlagCssClass": "flag-qa",
      "InputMasking": "9999 9999",
      "dial_code": "+974",
      "IsShowCustomFlag": false
    },
    {
      "code": "RE",
      "name": "Reunion",
      "FlagCssClass": "flag-re",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+262",
      "IsShowCustomFlag": false
    },
    {
      "code": "RO",
      "name": "Romania",
      "FlagCssClass": "flag-ro",
      "InputMasking": "9999 999 999",
      "dial_code": "+40",
      "IsShowCustomFlag": false
    },
    {
      "code": "RS",
      "name": "Serbia",
      "FlagCssClass": "flag-rs",
      "InputMasking": "999 9999999",
      "dial_code": "+381",
      "IsShowCustomFlag": false
    },
    {
      "code": "RU",
      "name": "Russia",
      "FlagCssClass": "flag-ru",
      "InputMasking": "9 (999) 999-99-99",
      "dial_code": "+7",
      "IsShowCustomFlag": false
    },
    {
      "code": "RW",
      "name": "Rwanda",
      "FlagCssClass": "flag-rw",
      "InputMasking": "9999 999 999",
      "dial_code": "+250",
      "IsShowCustomFlag": false
    },
    {
      "code": "SA",
      "name": "Saudi Arabia",
      "FlagCssClass": "flag-sa",
      "InputMasking": "999 999 9999",
      "dial_code": "+966",
      "IsShowCustomFlag": false
    },
    {
      "code": "SB",
      "name": "Solomon Islands",
      "FlagCssClass": "flag-sb",
      "InputMasking": "99 99999",
      "dial_code": "+677",
      "IsShowCustomFlag": false
    },
    {
      "code": "SC",
      "name": "Seychelles",
      "FlagCssClass": "flag-sc",
      "InputMasking": "9 999 999",
      "dial_code": "+248",
      "IsShowCustomFlag": false
    },
    {
      "code": "SD",
      "name": "Sudan",
      "FlagCssClass": "flag-sd",
      "InputMasking": "999 999 9999",
      "dial_code": "+249",
      "IsShowCustomFlag": false
    },
    {
      "code": "SE",
      "name": "Sweden",
      "FlagCssClass": "flag-se",
      "InputMasking": "999-999 99 99",
      "dial_code": "+46",
      "IsShowCustomFlag": false
    },
    {
      "code": "SG",
      "name": "Singapore",
      "FlagCssClass": "flag-sg",
      "InputMasking": "9999 9999",
      "dial_code": "+65",
      "IsShowCustomFlag": false
    },
    {
      "code": "SH",
      "name": "Saint Helena",
      "FlagCssClass": "flag-sh",
      "InputMasking": "99999",
      "dial_code": "+290",
      "IsShowCustomFlag": false
    },
    {
      "code": "SI",
      "name": "Slovenia",
      "FlagCssClass": "flag-si",
      "InputMasking": "999 999 999",
      "dial_code": "+386",
      "IsShowCustomFlag": false
    },
    {
      "code": "SJ",
      "name": "Svalbard and Jan Mayen",
      "FlagCssClass": "flag-sj",
      "InputMasking": "999 99 999",
      "dial_code": "+47",
      "IsShowCustomFlag": false
    },
    {
      "code": "SK",
      "name": "Slovakia",
      "FlagCssClass": "flag-sk",
      "InputMasking": "9999 999 999",
      "dial_code": "+421",
      "IsShowCustomFlag": false
    },
    {
      "code": "SL",
      "name": "Sierra Leone",
      "FlagCssClass": "flag-sl",
      "InputMasking": "(999) 999999",
      "dial_code": "+232",
      "IsShowCustomFlag": false
    },
    {
      "code": "SM",
      "name": "San Marino",
      "FlagCssClass": "flag-sm",
      "InputMasking": "99 99 99 99",
      "dial_code": "+378",
      "IsShowCustomFlag": false
    },
    {
      "code": "SN",
      "name": "Senegal",
      "FlagCssClass": "flag-sn",
      "InputMasking": "99 999 99 99",
      "dial_code": "+221",
      "IsShowCustomFlag": false
    },
    {
      "code": "SO",
      "name": "Somalia",
      "FlagCssClass": "flag-so",
      "InputMasking": "9 9999999",
      "dial_code": "+252",
      "IsShowCustomFlag": false
    },
    {
      "code": "SR",
      "name": "Suriname",
      "FlagCssClass": "flag-sr",
      "InputMasking": "999-9999",
      "dial_code": "+597",
      "IsShowCustomFlag": false
    },
    {
      "code": "SS",
      "name": "South Sudan",
      "FlagCssClass": "flag-ss",
      "InputMasking": "9999 999 999",
      "dial_code": "+211",
      "IsShowCustomFlag": false
    },
    {
      "code": "ST",
      "name": "Sao Tome and Principe",
      "FlagCssClass": "flag-st",
      "InputMasking": "999 9999",
      "dial_code": "+239",
      "IsShowCustomFlag": false
    },
    {
      "code": "SV",
      "name": "El Salvador",
      "FlagCssClass": "flag-sv",
      "InputMasking": "9999 9999",
      "dial_code": "+503",
      "IsShowCustomFlag": false
    },
    {
      "code": "SX",
      "name": "Sint Maarten",
      "FlagCssClass": "flag-sx",
      "InputMasking": "999-9999",
      "dial_code": "+1 (721)",
      "IsShowCustomFlag": false
    },
    {
      "code": "SY",
      "name": "Syria",
      "FlagCssClass": "flag-sy",
      "InputMasking": "9999 999 999",
      "dial_code": "+963",
      "IsShowCustomFlag": false
    },
    {
      "code": "SZ",
      "name": "Swaziland",
      "FlagCssClass": "flag-sz",
      "InputMasking": "9999 9999",
      "dial_code": "+268",
      "IsShowCustomFlag": false
    },
    {
      "code": "TC",
      "name": "Turks and Caicos Islands",
      "FlagCssClass": "flag-tc",
      "InputMasking": "999-9999",
      "dial_code": "+1 (649)",
      "IsShowCustomFlag": false
    },
    {
      "code": "TD",
      "name": "Chad",
      "FlagCssClass": "flag-td",
      "InputMasking": "99 99 99 99",
      "dial_code": "+235",
      "IsShowCustomFlag": false
    },
    {
      "code": "TG",
      "name": "Togo",
      "FlagCssClass": "flag-tg",
      "InputMasking": "99 99 99 99",
      "dial_code": "+228",
      "IsShowCustomFlag": false
    },
    {
      "code": "TH",
      "name": "Thailand",
      "FlagCssClass": "flag-th",
      "InputMasking": "999 999 9999",
      "dial_code": "+66",
      "IsShowCustomFlag": false
    },
    {
      "code": "TJ",
      "name": "Tajikistan",
      "FlagCssClass": "flag-tj",
      "InputMasking": "999 99 9999",
      "dial_code": "+992",
      "IsShowCustomFlag": false
    },
    {
      "code": "TK",
      "name": "Tokelau",
      "FlagCssClass": "flag-tk",
      "InputMasking": "9999",
      "dial_code": "+690",
      "IsShowCustomFlag": false
    },
    {
      "code": "TL",
      "name": "East Timor",
      "FlagCssClass": "flag-tl",
      "InputMasking": "9999 9999",
      "dial_code": "+670",
      "IsShowCustomFlag": false
    },
    {
      "code": "TM",
      "name": "Turkmenistan",
      "FlagCssClass": "flag-tm",
      "InputMasking": "9 99 999999",
      "dial_code": "+993",
      "IsShowCustomFlag": false
    },
    {
      "code": "TN",
      "name": "Tunisia",
      "FlagCssClass": "flag-tn",
      "InputMasking": "99 999 999",
      "dial_code": "+216",
      "IsShowCustomFlag": false
    },
    {
      "code": "TO",
      "name": "Tonga",
      "FlagCssClass": "flag-to",
      "InputMasking": "999 9999",
      "dial_code": "+676",
      "IsShowCustomFlag": false
    },
    {
      "code": "TR",
      "name": "Turkey",
      "FlagCssClass": "flag-tr",
      "InputMasking": "9999 999 99 99",
      "dial_code": "+90",
      "IsShowCustomFlag": false
    },
    {
      "code": "TT",
      "name": "Trinidad and Tobago",
      "FlagCssClass": "flag-tt",
      "InputMasking": "999-9999",
      "dial_code": "+1 (868)",
      "IsShowCustomFlag": false
    },
    {
      "code": "TV",
      "name": "Tuvalu",
      "FlagCssClass": "flag-tv",
      "InputMasking": "999999",
      "dial_code": "+688",
      "IsShowCustomFlag": false
    },
    {
      "code": "TW",
      "name": "Taiwan",
      "FlagCssClass": "flag-tw",
      "InputMasking": "9999 999 999",
      "dial_code": "+886",
      "IsShowCustomFlag": false
    },
    {
      "code": "TZ",
      "name": "Tanzania",
      "FlagCssClass": "flag-tz",
      "InputMasking": "9999 999 999",
      "dial_code": "+255",
      "IsShowCustomFlag": false
    },
    {
      "code": "UA",
      "name": "Ukraine",
      "FlagCssClass": "flag-ua",
      "InputMasking": "999 999 9999",
      "dial_code": "+380",
      "IsShowCustomFlag": false
    },
    {
      "code": "UG",
      "name": "Uganda",
      "FlagCssClass": "flag-ug",
      "InputMasking": "9999 999999",
      "dial_code": "+256",
      "IsShowCustomFlag": false
    },
    {
      "code": "US",
      "name": "United States",
      "FlagCssClass": "flag-us",
      "InputMasking": "(999) 999-9999",
      "dial_code": "+1",
      "IsShowCustomFlag": false
    },
    {
      "code": "UY",
      "name": "Uruguay",
      "FlagCssClass": "flag-uy",
      "InputMasking": "999 999 999",
      "dial_code": "+598",
      "IsShowCustomFlag": false
    },
    {
      "code": "UZ",
      "name": "Uzbekistan",
      "FlagCssClass": "flag-uz",
      "InputMasking": "9 99 999 99 99",
      "dial_code": "+998",
      "IsShowCustomFlag": false
    },
    {
      "code": "VA",
      "name": "Vatican",
      "FlagCssClass": "flag-va",
      "InputMasking": "999 999 9999",
      "dial_code": "+39",
      "IsShowCustomFlag": false
    },
    {
      "code": "VC",
      "name": "Saint Vincent and the Grenadines",
      "FlagCssClass": "flag-vc",
      "InputMasking": "999-9999",
      "dial_code": "+1 (784)",
      "IsShowCustomFlag": false
    },
    {
      "code": "VE",
      "name": "Venezuela",
      "FlagCssClass": "flag-ve",
      "InputMasking": "9999-9999999",
      "dial_code": "+58",
      "IsShowCustomFlag": false
    },
    {
      "code": "VG",
      "name": "British Virgin Islands",
      "FlagCssClass": "flag-vg",
      "InputMasking": "999-9999",
      "dial_code": "+1 (284)",
      "IsShowCustomFlag": false
    },
    {
      "code": "VI",
      "name": "U.S. Virgin Islands",
      "FlagCssClass": "flag-vi",
      "InputMasking": "999-9999",
      "dial_code": "+1 (340)",
      "IsShowCustomFlag": false
    },
    {
      "code": "VN",
      "name": "Vietnam",
      "FlagCssClass": "flag-vn",
      "InputMasking": "999 999 99 99",
      "dial_code": "+84",
      "IsShowCustomFlag": false
    },
    {
      "code": "VU",
      "name": "Vanuatu",
      "FlagCssClass": "flag-vu",
      "InputMasking": "999 9999",
      "dial_code": "+678",
      "IsShowCustomFlag": false
    },
    {
      "code": "WF",
      "name": "Wallis and Futuna",
      "FlagCssClass": "flag-wf",
      "InputMasking": "99 99 99",
      "dial_code": "+681",
      "IsShowCustomFlag": false
    },
    {
      "code": "WS",
      "name": "Samoa",
      "FlagCssClass": "flag-ws",
      "InputMasking": "99 99999",
      "dial_code": "+685",
      "IsShowCustomFlag": false
    },
    {
      "code": "XK",
      "name": "Kosovo",
      "FlagCssClass": "flag-xk",
      "InputMasking": "999 999 999",
      "dial_code": "+383",
      "IsShowCustomFlag": false
    },
    {
      "code": "YE",
      "name": "Yemen",
      "FlagCssClass": "flag-ye",
      "InputMasking": "9999 999 999",
      "dial_code": "+967",
      "IsShowCustomFlag": false
    },
    {
      "code": "YT",
      "name": "Mayotte",
      "FlagCssClass": "flag-yt",
      "InputMasking": "9999 99 99 99",
      "dial_code": "+262",
      "IsShowCustomFlag": false
    },
    {
      "code": "ZA",
      "name": "South Africa",
      "FlagCssClass": "flag-za",
      "InputMasking": "999 999 9999",
      "dial_code": "+27",
      "IsShowCustomFlag": false
    },
    {
      "code": "ZM",
      "name": "Zambia",
      "FlagCssClass": "flag-zm",
      "InputMasking": "999 9999999",
      "dial_code": "+260",
      "IsShowCustomFlag": false
    },
    {
      "code": "ZW",
      "name": "Zimbabwe",
      "FlagCssClass": "flag-zw",
      "InputMasking": "999 999 9999",
      "dial_code": "+263",
      "IsShowCustomFlag": false
    }
  ];
}
