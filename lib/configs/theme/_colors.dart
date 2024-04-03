part of '../configs.dart';

abstract class AppColors {
  static const accent = ColorRef(Color(0xff003554), id: 'accent');
  static const primary = ColorRef(Color(0xff4dc6fa), id: 'primary');
  static const primaryDark = ColorRef(Color(0xff095aa1), id: 'primary');

  //
  static const textSub = ColorRef(Color(0xff3A3A3A), id: 'textSub');

  static const darkgrey = ColorRef(Color(0xff0f0f0f), id: 'darkGrey');
  static const grey = ColorRef(Color(0xff9E9E9E), id: 'grey');
  static const lightGrey = ColorRef(Color(0xffEAEAEA), id: 'lightGrey');
  static const lighterGrey = ColorRef(Color(0xffF5F5F5), id: 'lighterGrey');

  //
  static const error = ColorRef(Color(0xffC80000), id: 'error');
  static const success = ColorRef(Color(0xff22C55E), id: 'success');
  static const warning = ColorRef(Color(0xffE59D19), id: 'warning');
}
