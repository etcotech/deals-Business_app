import 'package:deals_and_business/core/constants/images.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final String? flag;
  final String? code;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Validator function as a parameter
  final IconData? iconData;
final Function(String?)? onTextChange;
final Function()? onSelectCountryCode;
  const PhoneField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,  this.iconData, this.onTextChange, this.onSelectCountryCode, this.flag, this.code, // Nullable validator function
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
onChanged: onTextChange,
maxLength: 9,      
      decoration: InputDecoration(
contentPadding: EdgeInsets.symmetric(
  vertical: 10
),
hintMaxLines: null,
helperMaxLines: null,
        filled: true,
        fillColor: Colors.grey[200],
      
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey ,
          fontSize: 15
        ),
        prefixIcon:
        
        GestureDetector(
          onTap: (){
            onSelectCountryCode!();

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                flag!=null?
                Image.network(
              
              flag! ,
            
            height: 20,width: 20,
            ):
            Image.asset(
              
              Images.flag ,
            
            height: 20,width: 20,
            ), SizedBox(width: 8,),
            Text(
              code??
              "+996")
              ],
            ),
          ),
        )
         ,
        suffixIcon:Icon(iconData,
        
         color: Colors.grey, 
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
