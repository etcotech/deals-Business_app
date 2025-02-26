import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final bool? asGuest;
  const MessagesScreen({super.key,this.asGuest=false});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
key: scaffoldKey,

      appBar: 
      
      MyAppBar(context,
      currentCountry: 'assets/images/ksa.png',
      title: 'Messages',
        onTapDrawer: (){
          scaffoldKey.currentState!.openDrawer();
        },
        onCountryTap: (){
  showModalBottomSheet(
              context: context,
              isDismissible: false, // Prevent dismissal
              enableDrag: false, // Prevent dragging to dismiss
              backgroundColor: Colors.transparent, // Make background transparent
              builder: (context) {
                return CountriesBottomsheet();
              },
            );
        }, 
        isGuest: widget.asGuest!
      ),

drawer: AppDrawer(),
drawerEnableOpenDragGesture: false, 
    );
  }
}