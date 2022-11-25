import 'package:adept_drive/modules/child/child_page.dart';
import 'package:adept_drive/modules/child/child_page_sub.dart';
import 'package:adept_drive/modules/detail/document_view.dart';
import 'package:adept_drive/modules/drive/drive_page.dart';
import 'package:adept_drive/modules/drive/shared_folder.dart';
import 'package:adept_drive/modules/home/home_page.dart';
import 'package:adept_drive/modules/login/login_page.dart';
import 'package:adept_drive/modules/workflow/workflow_detail.dart';
import 'package:adept_drive/modules/workflow/workflow_list.dart';
import 'package:adept_drive/utils/under_build.dart';
import 'package:get/get.dart';

import 'modules/workflow/workflow_webview.dart';

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
    name: DocumentView.routeName,
    page: () => const DocumentView(),
  ),
  GetPage(
    name: ChildPage.routeName,
    page: () => const ChildPage(),
  ),
  GetPage(
    name: ChildPageSub.routeName,
    page: () => const ChildPageSub(),
  ),
  GetPage(
    name: SharedFolder.routeName,
    page: () => const SharedFolder(),
  ),
  GetPage(
    name: WorkFlowList.routeName,
    page: () => const WorkFlowList(),
  ),
  GetPage(
    name: WorkflowDetailView.routeName,
    page: () => const WorkflowDetailView(),
  ),
  GetPage(
    name: WebViewWorkFlow.routeName,
    page: () => const WebViewWorkFlow(),
  ),
  GetPage(
    name: UnderBuild.routeName,
    page: () => const UnderBuild(),
  ),
];
