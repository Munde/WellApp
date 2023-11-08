import '../pharmacy_screen/widgets/drugslist1_item_widget.dart';
import '../pharmacy_screen/widgets/drugslist_item_widget.dart';
import 'controller/pharmacy_controller.dart';
import 'models/drugslist1_item_model.dart';
import 'models/drugslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:wellapp/core/app_export.dart';
import 'package:wellapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:wellapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:wellapp/widgets/app_bar/appbar_trailing_image.dart';
import 'package:wellapp/widgets/app_bar/custom_app_bar.dart';
import 'package:wellapp/widgets/custom_elevated_button.dart';
import 'package:wellapp/widgets/custom_search_view.dart';

class PharmacyScreen extends GetWidget<PharmacyController> {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "msg_search_drug_category".tr)),
                  SizedBox(height: 25.v),
                  _buildOfferBanner(),
                  SizedBox(height: 52.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: _buildProductOnSale(
                          productOnSale: "lbl_popular_product".tr,
                          seeAll: "lbl_see_all".tr)),
                  SizedBox(height: 23.v),
                  _buildDrugsList(),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: _buildProductOnSale(
                          productOnSale: "lbl_product_on_sale".tr,
                          seeAll: "lbl_see_all".tr)),
                  SizedBox(height: 11.v),
                  _buildDrugsList1()
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_pharmacy".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v),
              onTap: () {
                onTapCart();
              })
        ]);
  }

  /// Section Widget
  Widget _buildOfferBanner() {
    return Container(
        width: 335.h,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
        decoration: AppDecoration.fillTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              SizedBox(
                  width: 160.h,
                  child: Text("msg_order_quickly_w".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMedium18
                          .copyWith(height: 1.50))),
              SizedBox(height: 7.v),
              CustomElevatedButton(
                  height: 26.v,
                  width: 155.h,
                  text: "msg_upload_prescription".tr,
                  buttonStyle: CustomButtonStyles.fillCyan,
                  buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold)
            ]));
  }

  /// Section Widget
  Widget _buildDrugsList() {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 165.v,
            child: Obx(() => ListView.separated(
                padding: EdgeInsets.only(left: 21.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 21.h);
                },
                itemCount: controller
                    .pharmacyModelObj.value.drugslistItemList.value.length,
                itemBuilder: (context, index) {
                  DrugslistItemModel model = controller
                      .pharmacyModelObj.value.drugslistItemList.value[index];
                  return DrugslistItemWidget(model);
                }))));
  }

  /// Section Widget
  Widget _buildDrugsList1() {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 165.v,
            child: Obx(() => ListView.separated(
                padding: EdgeInsets.only(left: 21.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 18.h);
                },
                itemCount: controller
                    .pharmacyModelObj.value.drugslist1ItemList.value.length,
                itemBuilder: (context, index) {
                  Drugslist1ItemModel model = controller
                      .pharmacyModelObj.value.drugslist1ItemList.value[index];
                  return Drugslist1ItemWidget(model);
                }))));
  }

  /// Common widget
  Widget _buildProductOnSale({
    required String productOnSale,
    required String seeAll,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(productOnSale,
          style: CustomTextStyles.titleMediumOnPrimaryContainer_1
              .copyWith(color: theme.colorScheme.onPrimaryContainer)),
      Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(seeAll,
              style: CustomTextStyles.labelLargeCyan300
                  .copyWith(color: appTheme.cyan300)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the cartScreen when the action is triggered.
  onTapCart() {
    Get.toNamed(
      AppRoutes.cartScreen,
    );
  }
}
