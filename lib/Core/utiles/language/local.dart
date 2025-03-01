import 'package:asroo_app/core/utiles/language/langKeys.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:get/get.dart';

class MyLocal extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          '${LangKeys.language}': '${LangkeysAR.language}',
          '${LangKeys.login}': '${LangkeysAR.login}',
          '${LangKeys.welcome}': '${LangkeysAR.welcome}',
          '${LangKeys.email}': '${LangkeysAR.your_email}',
          '${LangKeys.password}': '${LangkeysAR.password}',
          '${LangKeys.createAccount}': '${LangkeysAR.create_account}',
          '${LangKeys.signUp}': '${LangkeysAR.sign_up}',
          '${LangKeys.signUpWelcome}': '${LangkeysAR.sign_up_welcome}',
          '${LangKeys.fullName}': '${LangkeysAR.full_name}',
          '${LangKeys.youHaveAccount}': '${LangkeysAR.you_have_account}',
          '${LangKeys.appName}': '${LangkeysAR.app_name}',
          '${LangKeys.applicationFeatures}':
              '${LangkeysAR.application_features}',
          '${LangKeys.buildDeveloper}':
              '${LangkeysAR.build_versbuild_developerion}',
          '${LangKeys.buildVersion}': '${LangkeysAR.build_version}',
          '${LangKeys.cancel}': '${LangkeysAR.cancel}',
          '${LangKeys.changeToTheLanguage}':
              '${LangkeysAR.change_to_the_language}',
          '${LangKeys.chooseProducts}': '${LangkeysAR.choose_products}',
          '${LangKeys.darkMode}': '${LangkeysAR.dark_mode}',
          '${LangKeys.imageRemoved}': '${LangkeysAR.image_removed}',
          '${LangKeys.imageUploaded}': '${LangkeysAR.image_uploaded}',
          '${LangKeys.langCode}': '${LangkeysAR.lang_code}',
          '${LangKeys.languageTilte}': '${LangkeysAR.language_tilte}',
          '${LangKeys.logOut}': '${LangkeysAR.log_out}',
          '${LangKeys.logOutFromApp}':
              '${LangkeysAR.build_versbuild_develolog_olog_out_from_apputperion}',
          '${LangKeys.loggedError}': '${LangkeysAR.logged_error}',
          '${LangKeys.loggedSuccessfully}': '${LangkeysAR.logged_successfully}',
          '${LangKeys.no}': '${LangkeysAR.no}',
          '${LangKeys.validEmail}': '${LangkeysAR.valid_email}',
          '${LangKeys.validName}': '${LangkeysAR.valid_name}',
          '${LangKeys.validPasswrod}': '${LangkeysAR.valid_passwrod}',
          '${LangKeys.validPickImage}': '${LangkeysAR.valid_pick_image}',
          '${LangKeys.restart}': '${LangkeysAR.restart}',
          '${LangKeys.account_created}': '${LangkeysAR.account_created}',
          '${LangKeys.notifications}': '${LangkeysAR.notifications}',
          '${LangKeys.appFeatures}': '${LangkeysAR.appFeatures}',
          '${LangKeys.subscribedTonotifications}':
              '${LangkeysAR.subscribedTonotifications}',
          '${LangKeys.UnsubscribedTonotifications}':
              '${LangkeysAR.UnsubscribedTonotifications}',
        },
        'en': {
          '${LangKeys.language}': '${LangKeysEn.language}',
          '${LangKeys.login}': '${LangKeysEn.login}',
          '${LangKeys.welcome}': '${LangKeysEn.welcome}',
          '${LangKeys.email}': '${LangKeysEn.your_email}',
          '${LangKeys.password}': '${LangKeysEn.password}',
          '${LangKeys.createAccount}': '${LangKeysEn.create_account}',
          '${LangKeys.signUp}': '${LangKeysEn.sign_up}',
          '${LangKeys.signUpWelcome}': '${LangKeysEn.sign_up_welcome}',
          '${LangKeys.fullName}': '${LangKeysEn.full_name}',
          '${LangKeys.youHaveAccount}': '${LangKeysEn.you_have_account}',
          '${LangKeys.appName}': '${LangKeysEn.app_name}',
          '${LangKeys.applicationFeatures}':
              '${LangKeysEn.application_features}',
          '${LangKeys.buildDeveloper}':
              '${LangKeysEn.build_versbuild_developerion}',
          '${LangKeys.buildVersion}': '${LangKeysEn.build_version}',
          '${LangKeys.cancel}': '${LangKeysEn.cancel}',
          '${LangKeys.changeToTheLanguage}':
              '${LangKeysEn.change_to_the_language}',
          '${LangKeys.chooseProducts}': '${LangKeysEn.choose_products}',
          '${LangKeys.darkMode}': '${LangKeysEn.dark_mode}',
          '${LangKeys.imageRemoved}': '${LangKeysEn.image_removed}',
          '${LangKeys.imageUploaded}': '${LangKeysEn.image_uploaded}',
          '${LangKeys.langCode}': '${LangKeysEn.lang_code}',
          '${LangKeys.languageTilte}': '${LangKeysEn.language_tilte}',
          '${LangKeys.logOut}': '${LangKeysEn.log_out}',
          '${LangKeys.logOutFromApp}':
              '${LangKeysEn.build_versbuild_develolog_outperion}',
          '${LangKeys.loggedError}': '${LangKeysEn.logged_error}',
          '${LangKeys.loggedSuccessfully}': '${LangKeysEn.logged_successfully}',
          '${LangKeys.no}': '${LangKeysEn.no}',
          '${LangKeys.validEmail}': '${LangKeysEn.valid_email}',
          '${LangKeys.validName}': '${LangKeysEn.valid_name}',
          '${LangKeys.validPasswrod}': '${LangKeysEn.valid_passwrod}',
          '${LangKeys.validPickImage}': '${LangKeysEn.valid_pick_image}',
          '${LangKeys.restart}': '${LangKeysEn.restart}',
          '${LangKeys.account_created}': '${LangKeysEn.account_created}',
          '${LangKeys.notifications}': '${LangKeysEn.notifications}',
          '${LangKeys.appFeatures}': '${LangKeysEn.appFeatures}',
          '${LangKeys.subscribedTonotifications}':
              '${LangKeysEn.subscribedTonotifications}',
          '${LangKeys.UnsubscribedTonotifications}':
              '${LangKeysEn.UnsubscribedTonotifications}',
        }
      };
}
