import 'dart:developer';
import 'dart:io';

import 'package:deals_and_business/configs/app_localization.dart';
import 'package:deals_and_business/configs/custom_delegate.dart';
import 'package:deals_and_business/configs/theme.dart';
import 'package:deals_and_business/core/services/package_info_service.dart';
import 'package:deals_and_business/core/services/remote_config_services.dart';
import 'package:deals_and_business/features/auth/providers/auth_provider.dart';
import 'package:deals_and_business/features/category/providers/category_provider.dart';
import 'package:deals_and_business/features/home/providers/home_provider.dart';
import 'package:deals_and_business/features/language/providers/language_provider.dart';
import 'package:deals_and_business/features/profile/providers/profile_provider.dart';
import 'package:deals_and_business/features/search/providers/search_provider.dart';
import 'package:deals_and_business/features/splash/providers/splash_provider.dart';
import 'package:deals_and_business/features/splash/view/splash_screen.dart';
import 'package:deals_and_business/features/version/views/new_version_screen.dart';
import 'package:deals_and_business/shared/providers/chat_provider.dart';
import 'package:deals_and_business/shared/providers/post_provider.dart';
import 'package:deals_and_business/shared/views/error_screen.dart';
import 'package:deals_and_business/shared/views/success_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './di/di.dart' as di;

  late SharedPreferences globalSharedPrefs;

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  try {
    globalSharedPrefs= await SharedPreferences.getInstance();

try {
  if (Platform.isAndroid) {
  await Firebase.initializeApp(
    // name: 'SecondaryApp',
    options: const FirebaseOptions(
        appId: '1:1031436334714:android:cf1a2e0cbb9190f1786dc3',
        apiKey: 'AIzaSyAuHUkWGjuUbx9e9X0uQMmgzAWNV_eS8_Q',
        messagingSenderId: '1031436334714',
        projectId: 'newapps-f7e05'
    )
);
}else{
await Firebase.initializeApp(
   
);
}
await  RemoteConfigServices.initialize();
PackageInfoService().initialize();
} catch (e) {
  log(e.toString());
}
   await di.init();






  } catch (e) {
    log("///////////////////////////////////   $e");
  }
  runApp(MultiProvider(
    providers: [
     ChangeNotifierProvider(create: (_)=> di.sl<SplashProvider>()),

      ChangeNotifierProvider(create: (_)=>  di.sl<AuthProvider>()) , 

     ChangeNotifierProvider(create: (_)=>  di.sl<LanguageProvider>()) , 
     ChangeNotifierProvider(create: (_)=>  di.sl<PostProvider>()),
     ChangeNotifierProvider(create: (_)=>  di.sl<HomeProvider>()),
     ChangeNotifierProvider(create: (_)=>  di.sl<SearchProvider>()),
     ChangeNotifierProvider(create: (_)=>  di.sl<ProfileProvider>()),
     ChangeNotifierProvider(create: (_)=>  di.sl<CategoryProvider>()),
     ChangeNotifierProvider(create: (_)=>  di.sl<ChatProvider>()),


    ],
    child:  MyApp()));
}
class GlobalContext {
  // Singleton instance
  static final GlobalContext _instance = GlobalContext._internal();
  factory GlobalContext() => _instance;
  GlobalContext._internal();

  // Store the context
  BuildContext? _context;
  BuildContext? get context => _context;
  set context(BuildContext? context) => _context = context;
}
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        GlobalContext().context = context;
        List<Locale> locals = [];
 for (var language in languages) {
      locals.add(Locale(language['key'].toString()));
    }
    return Consumer<LanguageProvider>(
      builder: (context ,locale,child) {
        return MaterialApp(

          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
navigatorKey: navigatorKey,
        
          //  locale: Provider.of<LocalizationController>(context).locale,
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FallbackLocalizationDelegate()
          ],
          builder:(context,child){
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling), child: child!);
          },
supportedLocales: locals,
          locale:
          locale.locale
          //  Locale(locale.loadCurrentLocal(context))
           ,
          localeResolutionCallback: (local ,_)=>Locale(locale.loadCurrentLocal(context)) ,
          theme:
          light(
            
          ),
         
          home: 
          // NewVersionScreen()
          // SuccessScreen()
          // NetworkErrorScreen(onRetry: (){})
          SplashScreen()
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
