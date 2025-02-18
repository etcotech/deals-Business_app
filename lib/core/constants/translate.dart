import 'package:deals_and_business/configs/app_localization.dart';
import 'package:flutter/material.dart';

String? getTranslated(String? key, BuildContext context) {
  String? text = key;
  try{
    text = AppLocalization.of(context)!.translate(key);
  }catch (error){
    text = "$key";
  }
  return text;
}