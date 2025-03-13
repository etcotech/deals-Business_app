import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/features/auth/views/login_screen.dart';
import 'package:deals_and_business/features/dashboard/widgets/app_bar.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/messages/widgets/message_preview_widget.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/widgets/app_drawer.dart';
import 'package:deals_and_business/shared/widgets/countries_bottomsheet.dart';
import 'package:deals_and_business/shared/widgets/error_container.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  final bool? asGuest;
  const MessagesScreen({super.key,this.asGuest=false});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){

      context.read<PostProvider>().getMessages(context);
    });
  }


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
                return CountriesBottomsheet(
                   onSelectCountry: (country){
                    context.read<HomeProvider>().saveCountryData(country);
                  },
                );
              },
            );
        }, 
        isGuest: widget.asGuest!
      ),

drawer: AppDrawer(),
drawerEnableOpenDragGesture: false, 


body: SizedBox.expand(
  child: Consumer<PostProvider>(builder: (context, provider,child){
  
  if (provider.isLoading) {
    return Center(child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ),);
  }
 else  if (provider.errorData!=null) {
    return Center(
      child: ErrorContainer(
        errorData: provider.errorData,
        onRetry: (){
                context.read<PostProvider>().getMessages(context);

        },
        onLogin: (){
        

        Navigator.of(context).pushAndRemoveUntil(

          PageTransition(type: PageTransitionType.fade , 
          
          
          child: LoginScreen()), 
          (_)=> false
        );
        },
      ),
    );
  }
  else if(provider.messages.isEmpty){
return Center(child: 
Text(getTranslated(Strings.noMessages, context)!)
    );
  }
  else return ListView.builder(
    shrinkWrap: true,
    itemCount: provider.messages.length,
    itemBuilder: (BuildContext context, int index) {
      var message = provider.messages[index];
      return   MessagePreviewWidget(messageModel: message,);
    },
  );


  }),
),
    );
  }
}