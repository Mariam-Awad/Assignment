import 'package:assignment/utils/app_colors_util.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomFunctions {
  bool loaderVisible = false;
  CancelFunc? cancelFunc;

  void showError({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColorUtil.red,
        content: Text(
          message,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStylesUtil.textRegularStyle(
              18, AppColorUtil.white, FontWeight.w400),
        )));
  }

  void showSuccess({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColorUtil.green,
        content: Text(
          message,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStylesUtil.textRegularStyle(
              18, AppColorUtil.white, FontWeight.w400),
        )));
  }

  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void showProgress(BuildContext context) {
    closeKeyboard(context);
    cancelFunc?.call();

    cancelFunc = BotToast.showCustomLoading(
      toastBuilder: (context) => CircularProgressIndicator(
        color: AppColorUtil.blue,
        backgroundColor: AppColorUtil.black26,
      ),
    );
    loaderVisible = true;
  }

  void hideProgress() {
    cancelFunc?.call();
    loaderVisible = false;
  }

  void closeKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void closeBottomSheet(BuildContext context) {
    Navigator.canPop(context);
  }
}
