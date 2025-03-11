import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final IconData iconData;
  final String? Function(String?)? validator; // Validator function as a parameter

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator, required this.iconData, this.errorText, // Nullable validator function
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visible =true;
  bool hasError=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      
      obscureText: visible,
      decoration: InputDecoration(
contentPadding: EdgeInsets.symmetric(
  vertical: 10
),

suffixIcon: IconButton(onPressed: (){
visible = !visible;
setState(() {
  
});
}, icon: Icon(

  visible? Icons.visibility_off:Icons.visibility, 
  color:hasError?Theme.of(context).colorScheme.error: Colors.grey,
  size: 18,
)),
        filled: true,
        fillColor: Colors.grey[200],
        errorText: widget.errorText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey ,
          fontSize: 15
        ),
        prefixIcon:Icon(widget.iconData, color: Theme.of(context).primaryColor , size: 18,  ) ,
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
      validator: (value) {
        widget.validator!(value);
        final validationMessage = widget.validator?.call(value);
        setState(() {
          hasError = validationMessage != null; // Update error state
        });
        return validationMessage;
      },
    );
  }
}
