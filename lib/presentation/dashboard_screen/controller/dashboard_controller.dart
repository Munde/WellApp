import 'package:wellapp/core/app_export.dart';
import 'package:wellapp/presentation/dashboard_screen/models/dashboard_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the DashboardScreen.
///
/// This class manages the state of the DashboardScreen, including the
/// current dashboardModelObj
class DashboardController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<DashboardModel> dashboardModelObj = DashboardModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
