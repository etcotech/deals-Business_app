import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
    final String? iconAsset;

  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Validator function as a parameter
  final IconData? iconData;
final Function(String?)? onTextChange;
  const PriceInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,  this.iconData, this.onTextChange, this.iconAsset, // Nullable validator function
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // keyboardType: keyboardType,
    onChanged: onTextChange,
    keyboardType: TextInputType.numberWithOptions(
    decimal: true,  // if you need decimal input
    signed: false,  // if you need negative numbers
  ),
  inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩]')), // Allow both English and Arabic numbers
        _ArabicToEnglishNumberInputFormatter()
  ],
      // ,
      decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: 10, horizontal: 8
    ),
    
        filled: true,
        fillColor: Colors.grey[200],
        
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey ,
          fontSize: 15
        ),
        prefixIcon:
        
        iconAsset!=null? 
      
        SizedBox(
          width: 40,
          child: Center(
            child: ImageIcon(AssetImage(iconAsset!), 
            
            color: Theme.of(context).primaryColor
            , size: 20
             ,),
          ),
        ) 
        :
        Icon(iconData, color: Theme.of(context).primaryColor, 
        size: 18,
        
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
    
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
    
        ),
    errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1 , color: Theme.of(context).colorScheme.error
          ), 
    
        ),
    focusedBorder: 
    OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2 , color: Theme.of(context).primaryColor
          ), 
    
        ),
    
    
      ),
      validator: validator, // Use the passed validator
    );
  }
}
class _ArabicToEnglishNumberInputFormatter extends TextInputFormatter {
  static const arabicToEnglishMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
    // Add other numeral systems if needed (Persian, Urdu, etc.)
  };

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, 
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    
    // Convert each Arabic digit to English
    for (final entry in arabicToEnglishMap.entries) {
      newText = newText.replaceAll(entry.key, entry.value);
    }

    // If text hasn't changed, return original
    if (newText == newValue.text) {
      return newValue;
    }

    // Calculate new cursor position
    final offset = newValue.selection.baseOffset + (newText.length - newValue.text.length);
    
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: offset.clamp(0, newText.length)),
      composing: TextRange.empty,
    );
  }

}
  

