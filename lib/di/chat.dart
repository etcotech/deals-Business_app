import 'package:deals_and_business/di/di.dart';
import 'package:deals_and_business/shared/providers/chat_provider.dart';

Future<void> registerChatFeature()async{


sl.registerFactory(()=> ChatProvider(postRepository: sl(), 

userRepository: sl()
));



}