import 'package:adept_drive/modules/detail/detail_page.dart';
import 'package:adept_drive/modules/detail/document_view.dart';
import 'package:adept_drive/modules/drive/drive_page.dart';
import 'package:adept_drive/modules/home/home_page.dart';
import 'package:adept_drive/modules/login/login_page.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
    name: LoginPage.routeName,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: DrivePage.routeName,
    page: () => const DrivePage(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
  ),
  GetPage(
    name: DetailPage.routeName,
    page: () => const DetailPage(),
  ),
  GetPage(
    name: DocumentView.routeName,
    page: () => const DocumentView(),
  ),
];
