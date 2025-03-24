import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DeleteAccountAlert extends StatefulWidget {
  final bool? isDelete;
  final Function()? onConfirm;
  final String? title;
  const DeleteAccountAlert({super.key, this.isDelete =false, this.onConfirm, this.title});

  @override
  State<DeleteAccountAlert> createState() => _DeleteAccountAlertState();
}

class _DeleteAccountAlertState extends State<DeleteAccountAlert> {
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
          scale: CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeInOut,
          ),
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35), // Rounded corners
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height*.15,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox( width: MediaQuery.sizeOf(context).width,
                    child: Text(
                      widget.title??
                      getTranslated("are_you_sure_delete_account", context)!, 
                 
                 maxLines: 2,
                 textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                     color: Colors.grey[400],
                      )
                    ),
                  ),
                ),
               Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                widget.onConfirm!();
              },
              child: Container(
                   height: (MediaQuery.sizeOf(context).height*.15)/3,
                        width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius:BorderRadius.vertical(
                      bottom: Radius.circular(35)
                    )), 
                    child: Center(
                      child: Text(
                        getTranslated('continue', context)!, 
                        style: TextStyle(
                          color: Colors.red, 
                          fontWeight: FontWeight.w400, 
                          fontSize: 22
                        ),
                      ),
                    ),
                  
                ),
            ),
            
            
              ],
            ),
          ),
        ),
    );
  }
}