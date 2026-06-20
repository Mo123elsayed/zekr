import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zekr/core/routing/app_router.dart';

class ZekrApp extends StatelessWidget {
  const ZekrApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zekr App',
        theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
