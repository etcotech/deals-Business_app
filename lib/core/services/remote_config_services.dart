import 'dart:developer';

import 'package:deals_and_business/core/constants/strings.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigServices {
  final remoteConfig = FirebaseRemoteConfig.instance;
RemoteConfigServices(): _remoteConfig = FirebaseRemoteConfig.instance;
 static Future<void> initialize() async {
  log("INIIT REMOTE");
    final remoteConfig = FirebaseRemoteConfig.instance;
// await remoteConfig.fetch();
// await remoteConfig.activate();


    // Set configuration
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 15),
      ),
    );

    // Fetch the values from Firebase Remote Config
    // await remoteConfig.fetchAndActivate();
  // These will be used before the values are fetched from Firebase Remote Config.
    await remoteConfig.setDefaults( {
     Strings.appleCurrentVersion  : '1.0.0',
     Strings.appleCurrentBuild:"4", 
     Strings.googleCurrentBuild:"5", 
     Strings.googleCurrentVersion:"10.0.0"
    });

    // Fetch the values from Firebase Remote Config
    await remoteConfig.fetchAndActivate();
  
    // Optional: listen for and activate changes to the Firebase Remote Config values
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
    });
    
 }
 final FirebaseRemoteConfig? _remoteConfig;



String getValue(String key){
  log(_remoteConfig!.pluginConstants.toString());
 return _remoteConfig!.getString(key);
}
}