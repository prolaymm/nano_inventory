import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nano_inventory/core/service/persistence_service.dart';
import 'package:nano_inventory/core/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/presentation/route/app_route_name.dart';
import 'package:nano_inventory/presentation/route/register_page_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/helper/hive_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await HiveHelper().openBox();
   PersistenceService localStorageService = Get.put(PersistenceService());

   await localStorageService.readToken();

  runApp( MyApp(authValue: localStorageService.secureData,));
/*  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );*/
}

class MyApp extends StatelessWidget {

  final Map? authValue;
  const MyApp({Key? key, this.authValue}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:  AppTheme.lightTheme,
      getPages: RegisterPageRoute().getPages,
     initialRoute:authValue!["token"]==""? AppRouteName.rReadCsv : AppRouteName.rReadCsv,

    );
  }
}

