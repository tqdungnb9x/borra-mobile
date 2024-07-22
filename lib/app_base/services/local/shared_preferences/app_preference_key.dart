part of 'app_preference.dart';

enum AppPreferenceKey {
  localTimeZone('localTimeZone'),
  language('language'),
  theme('theme'),
  darkOption('darkOption'),
  font('font'),
  reportPeriod('reportPeriod'),
  reportItems('reportItems'),
  rememberUser('rememberUser'),
  accessToken('accessToken'),
  refreshToken('refreshToken'),
  needChangePassword('needChangePassword'),
  welcome('welcome'),
  fromLoginPage('fromLoginPage');

  final String value;
  const AppPreferenceKey(this.value);
}
