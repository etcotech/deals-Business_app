import 'package:deals_and_business/core/constants/images.dart';
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EmailSentAlert extends StatefulWidget {
  const EmailSentAlert({super.key});

  @override
  State<EmailSentAlert> createState() => _DeleteAccountAlertState();
}

class _DeleteAccountAlertState extends State<EmailSentAlert>  with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35), // Rounded corners
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height*.20,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
            ),
            SizedBox(height: 16),


              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox( width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    getTranslated("we_emailed", context)!, 
               
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
            
          
          
            ],
          ),
        ),
      );
  }
}