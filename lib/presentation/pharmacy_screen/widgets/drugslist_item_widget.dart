import '../controller/pharmacy_controller.dart';
import '../models/drugslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:wellapp/core/app_export.dart';

// ignore: must_be_immutable
class DrugslistItemWidget extends StatelessWidget {
  DrugslistItemWidget(
    this.drugslistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DrugslistItemModel drugslistItemModelObj;

  var controller = Get.find<PharmacyController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 7.v,
          ),
          decoration: AppDecoration.outlineTeal.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 16.v),
              Obx(
                () => CustomImageView(
                  imagePath: drugslistItemModelObj.panadol!.value,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  radius: BorderRadius.circular(
                    25.h,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Obx(
                  () => Text(
                    drugslistItemModelObj.panadol1!.value,
                    style: CustomTextStyles.labelLargeOnPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Obx(
                  () => Text(
                    drugslistItemModelObj.quantiity!.value,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Obx(
                        () => Text(
                          drugslistItemModelObj.price!.value,
                          style: CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 38.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
