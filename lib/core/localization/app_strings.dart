import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppStrings {
  const AppStrings(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<AppStrings> delegate =
      _AppStringsDelegate();

  static const List<Locale> supportedLocales = [Locale('ar'), Locale('en')];

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings)!;
  }

  bool get isArabic => locale.languageCode == 'ar';

  String _t(String ar, String en) => isArabic ? ar : en;

  String get appTitle => _t('عرب اورا', 'Arab Aura');
  String get english => 'English';
  String get arabic => 'العربية';

  String get skip => _t('تخطي', 'Skip');
  String get startNow => _t('ابدأ الآن', 'Get started');

  String get onboarding1Start => _t('كل البراندات ..', 'All brands ..');
  String get onboarding1End => _t('في مكان واحد', 'in one place');
  String get onboarding1Subtitle => _t(
    'اكتشف آلاف المنتجات من أفضل البراندات في تجربة تسوق واحدة وسهلة',
    'Discover thousands of products from the best brands in one easy shopping experience',
  );
  String get onboarding2Start => _t('أشهر البراندات ..', 'Top brands ..');
  String get onboarding2End => _t('بين يديك', 'at your fingertips');
  String get onboarding2Subtitle => _t(
    'تسوق من أفضل العلامات التجارية العالمية والمحلية في مكان واحد',
    'Shop from the best global and local brands in one place',
  );
  String get onboarding3Start => _t('توصيل سريع ..', 'Fast delivery ..');
  String get onboarding3End => _t('لباب بيتك', 'to your door');
  String get onboarding3Subtitle => _t(
    'اطلب منتجاتك المفضلة من مختلف البراندات واستلمها بسرعة وأمان',
    'Order your favorite products from various brands and get them quickly and safely',
  );

  String get roleSelectionStart => _t('زائرنا', 'Welcome,');
  String get roleSelectionEnd => _t('الكريم!', 'dear guest!');
  String get roleSelectionSubtitle => _t(
    'استكشف الأدوار المتاحة وانضم إلينا في عرب أورا واختر ما يناسبك للبدء',
    'Explore the available roles and join us at Arab Aura. Pick what suits you to get started',
  );
  String get joinNow => _t('انضم إلينا الآن', 'Join us now');
  String get haveAccount => _t('لديك حساب بالفعل؟', 'Already have an account?');
  String get login => _t('تسجيل الدخول', 'Log in');

  String get roleMerchantTitle => _t('تاجر', 'Merchant');
  String get roleMerchantDescription => _t(
    'اعرض منتجاتك، وسَّع مبيعاتك ووصل لعملاء أكثر.',
    'Showcase your products, grow your sales and reach more customers.',
  );
  String get roleCourierTitle => _t('مندوب توصيل', 'Delivery courier');
  String get roleCourierDescription => _t(
    'انضم لفريق التوصيل وابدأ تحقيق دخل مرن مع كل طلب.',
    'Join the delivery team and earn a flexible income with every order.',
  );
  String get roleCustomerTitle => _t('مستخدم عادي', 'Regular user');
  String get roleCustomerDescription => _t(
    'تسوّق من مختلف المتاجر واستمتع بأفضل العروض.',
    'Shop from a variety of stores and enjoy the best offers.',
  );

  String get loginTitleStart => _t('مرحباً بك', 'Welcome');
  String get loginTitleEnd => _t('مجدداً', 'back');
  String get loginSubtitle => _t(
    'سجّل الدخول لمتابعة التسوق وطلب منتجاتك المفضلة',
    'Log in to keep shopping and order your favorite products',
  );
  String get email => _t('البريد الإلكتروني', 'Email');
  String get password => _t('كلمة المرور', 'Password');
  String get confirmPassword => _t('تأكيد كلمة المرور', 'Confirm password');
  String get rememberMe => _t('تذكرني', 'Remember me');
  String get forgotPassword => _t('نسيت كلمة المرور؟', 'Forgot password?');
  String get or => _t('أو', 'or');
  String get loginWithApple => _t('الدخول بحساب Apple', 'Continue with Apple');
  String get loginWithGoogle =>
      _t('الدخول بحساب Google', 'Continue with Google');
  String get noAccount => _t('ليس لديك حساب؟', "Don't have an account?");
  String get createNewAccount => _t('إنشاء حساب جديد', 'Create an account');

  String get fullName => _t('الاسم بالكامل', 'Full name');
  String get phone => _t('رقم الهاتف', 'Phone number');
  String get termsLabel => _t(
    'أوافق على الشروط والأحكام وسياسة الخصوصية',
    'I agree to the terms, conditions and privacy policy',
  );
  String get submitJoinRequest =>
      _t('إرسال طلب الانضمام', 'Submit join request');

  String get customerTitleStart => _t('إنشاء', 'Create');
  String get customerTitleEnd => _t('حساب جديد', 'a new account');
  String get customerSubtitle => _t(
    'سجّل بياناتك وابدأ التسوق من أفضل البراندات',
    'Enter your details and start shopping from the best brands',
  );
  String get createAccountButton => _t('إنشاء الحساب', 'Create account');

  String get merchantTitleStart => _t('سجّل', 'Register');
  String get merchantTitleEnd => _t('كتاجر', 'as a merchant');
  String get merchantSubtitle => _t(
    'أدخل بيانات متجرك لنراجعها ونفعّل حسابك بسرعة',
    'Enter your store details and we will review and activate your account quickly',
  );
  String get storeName => _t('اسم المتجر / البراند', 'Store / brand name');
  String get ownerName => _t('اسم المالك بالكامل', 'Owner full name');
  String get commercialRegister =>
      _t('رقم السجل التجاري', 'Commercial register number');
  String get taxNumber =>
      _t('الرقم الضريبي (اختياري)', 'Tax number (optional)');
  String get storeAddress => _t('عنوان المتجر', 'Store address');
  String get commercialRegisterPhoto =>
      _t('صورة السجل التجاري', 'Commercial register photo');

  String get courierTitleStart => _t('انضم', 'Join');
  String get courierTitleEnd => _t('كمندوب توصيل', 'as a delivery courier');
  String get courierSubtitle => _t(
    'أكمل بياناتك ومستنداتك لنراجعها ونفعّل حسابك',
    'Complete your details and documents so we can review and activate your account',
  );
  String get nationalId => _t('الرقم القومي', 'National ID');
  String get city => _t('المدينة / المنطقة', 'City / area');
  String get vehicleType => _t('نوع المركبة', 'Vehicle type');
  String get vehicleMotorcycle => _t('دراجة نارية', 'Motorcycle');
  String get vehicleBicycle => _t('دراجة', 'Bicycle');
  String get vehicleCar => _t('سيارة', 'Car');
  String get nationalIdFront => _t('صورة البطاقة (الوجه)', 'ID card (front)');
  String get nationalIdBack => _t('صورة البطاقة (الظهر)', 'ID card (back)');
  String get personalPhoto => _t('صورة شخصية', 'Personal photo');

  String get photoRequired => _t('هذه الصورة مطلوبة', 'This photo is required');
  String get tapToAddPhoto => _t('اضغط لإضافة صورة', 'Tap to add a photo');
  String get photoPicked => _t('تم اختيار الصورة', 'Photo selected');
  String get takePhoto => _t('التقاط صورة', 'Take a photo');
  String get chooseFromGallery => _t('اختيار من المعرض', 'Choose from gallery');

  String get fieldRequired => _t('هذا الحقل مطلوب', 'This field is required');
  String get invalidEmail =>
      _t('البريد الإلكتروني غير صحيح', 'Invalid email address');
  String get invalidPhone => _t('رقم الهاتف غير صحيح', 'Invalid phone number');
  String get invalidNationalId => _t(
    'الرقم القومي يجب أن يكون 14 رقماً صحيحاً',
    'National ID must be a valid 14-digit number',
  );
  String get passwordTooShort => _t(
    'كلمة المرور يجب ألا تقل عن 8 أحرف',
    'Password must be at least 8 characters',
  );
  String get passwordsMismatch =>
      _t('كلمتا المرور غير متطابقتين', 'Passwords do not match');
  String get termsRequired => _t(
    'يجب الموافقة على الشروط للمتابعة',
    'You must accept the terms to continue',
  );
}

class _AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const _AppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ar' || locale.languageCode == 'en';
  }

  @override
  Future<AppStrings> load(Locale locale) {
    return SynchronousFuture<AppStrings>(AppStrings(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppStrings> old) => false;
}
