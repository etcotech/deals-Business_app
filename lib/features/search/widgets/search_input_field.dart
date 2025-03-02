import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String?)? onChange;
  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Validator function as a parameter
  final IconData? iconData;

  const SearchInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,  this.iconData, this.onChange, // Nullable validator function
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      keyboardType: keyboardType,
onChanged: (value){
onChange!(value);
},

onTapOutside: (event){
FocusManager.instance.primaryFocus?.unfocus();
},
      
      decoration: InputDecoration(
contentPadding: EdgeInsets.symmetric(
  vertical: 10 , horizontal: 8
),

        filled: true,
        fillColor: Colors.grey[200],
        
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey ,
          fontSize: 15
        ),
        suffixIcon:Icon(iconData,           color: Colors.grey ,

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
