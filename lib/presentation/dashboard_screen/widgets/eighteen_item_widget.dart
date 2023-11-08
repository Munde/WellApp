import '../controller/dashboard_controller.dart';
import '../models/eighteen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:wellapp/core/app_export.dart';
import 'package:wellapp/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class EighteenItemWidget extends StatelessWidget {
  EighteenItemWidget(
    this.eighteenItemModelObj, {
    Key? key,
    this.onTapBtnUser,
  }) : super(
          key: key,
        );

  EighteenItemModel eighteenItemModelObj;

  var controller = Get.find<DashboardController>();

  VoidCallback? onTapBtnUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71.h,
      child: Obx(
        () => CustomIconButton(
          height: 71.adaptSize,
          width: 71.adaptSize,
          padding: EdgeInsets.all(16.h),
          decoration: IconButtonStyleHelper.fillCyan,
          onTap: () {
            onTapBtnUser!.call();
          },
          child: CustomImageView(
            imagePath: eighteenItemModelObj.user!.value,
          ),
        ),
      ),
    );
  }
}
