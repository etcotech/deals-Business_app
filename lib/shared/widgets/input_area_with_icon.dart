import 'package:flutter/material.dart';

class InputAreaWithIcon extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Validator function as a parameter
final IconData? iconData;
  const InputAreaWithIcon({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.multiline,
    this.validator, this.iconData, this.errorText,  // Nullable validator function
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
      keyboardType: keyboardType,
maxLines: 3,
      onTapOutside: (event){
FocusManager.instance.primaryFocus?.unfocus();
},
      decoration: InputDecoration(
// contentPadding: EdgeInsets.symmetric(
//   vertical: 15
// ),
helperText: '',
counterText: '',
errorText: errorText,
        filled: true,
        fillColor: Colors.grey[200],
        
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey ,
          fontSize: 15
        ),
        prefixIcon:Icon(iconData, color: Theme.of(context).primaryColor, 
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
