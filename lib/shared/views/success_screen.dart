import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/dashboard/view/dashboard.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessScreen> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(Strings.succss, context)!,)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${getTranslated(Strings.succss, context)}!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
             getTranslated(Strings.postSentSuccesfully, context)!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            MiniButton(
              title: getTranslated(Strings.backToHome, context),
              color: Theme.of(context).primaryColor,
              onTap: (){
                Navigator.pushAndRemoveUntil(context, 
                PageTransition(type: 
                
                PageTransitionType.leftToRight , 

                child: Dashboard()
                )
                , (route)=> false);
              },
            )
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to the next screen or perform an action
            //   },
            //   child: Text(getTranslated(Strings.backToHome, context)),
            // ),
          ],
        ),
      ),
    );
  }
}