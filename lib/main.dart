import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        if (screenSize.width < screenSize.height) {
          return FontSizeResolvers.width(fontSize, instance);
        } else {
          final scaleRatio = display.devicePixelRatio > 3 ? 360 : (360 * 2.2);
          final scaleWidth = screenSize.width / scaleRatio;

          return fontSize * scaleWidth;
        }
      },
      builder: (context, _) {
        return GetMaterialApp(
          theme: buildThemeData(),
          translations: Translation(),
          locale: Get.deviceLocale,
          fallbackLocale: Get.deviceLocale,
          debugShowCheckedModeBanner: false,
          title: 'JakOne Pay',
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
        textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 57.sp,
        height: 1.123,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45.sp,
        height: 1.156,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36.sp,
        height: 1.123,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 32.sp,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28.sp,
        height: 1.286,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24.sp,
        height: 1.334,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22.sp,
        height: 1.273,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16.sp,
        height: 1.334,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        height: 1.455,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14.sp,
        height: 1.429,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12.sp,
        height: 1.334,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11.sp,
        height: 1.455,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: 0.15,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        height: 1.429,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        height: 1.334,
        letterSpacing: 0.4,
      ),
    ));
  }
}
