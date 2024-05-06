
import 'package:credit_card_form/credit_card_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_underline_textfield.dart';
import 'package:kelechek/core/common/widgets/flashbar/custom_flashbar.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/user_indentification/view/payment_success_screen.dart';
import 'package:kelechek/presentation/user_indentification/widgets/payment_button.dart';
import 'package:kelechek/presentation/user_indentification/widgets/payment_type_selection_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const PaymentScreen(),
    );
  }

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController expiredDateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentOrder = context.select(
      (MainAppCubit cubit) => cubit.state.currentOrder,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.card_online),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            l10n.payment_to_order,
            style: AppTextStyle.s16.copyWith(
              color: AppColors.lightGray,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 30),
          PaymentButton(
            iconPath: AppImagePaths.applePay,
            ontap: () {
              AppFlashController.showInfo(
                context,
                message: l10n.this_payment_method_isnot_available_yet,
              );
            },
          ),
          const SizedBox(height: 15),
          PaymentButton(
            iconPath: AppImagePaths.googlePay,
            ontap: () {
              AppFlashController.showInfo(
                context,
                message: l10n.this_payment_method_isnot_available_yet,
                type: AppInfoType.danger,
              );
            },
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Expanded(
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  l10n.or_pay_in_another_way,
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const PaymentTypeSelectionButton(),
          const SizedBox(height: 30),
          CreditCardForm(
            theme: CreditCardLightTheme(),
            controller: CreditCardController(),
            cardTypes: const [CardType.visa, CardType.master],
            onChanged: (CreditCardResult result) {
              cardHolderController.text = result.cardHolderName;
              cardNumberController.text = result.cardNumber;
              cvcController.text = result.cvc;
              expiredDateController.text =
                  '${result.expirationMonth}/${result.expirationYear}';
              setState(() {});
            },
          ),
          const SizedBox(height: 30),
          Text(
            l10n.phone_number,
            style: AppTextStyle.s13.copyWith(color: AppColors.lightGray),
          ),
          CstUnderlineTextField(
            keyboardType: TextInputType.phone,
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 20, right: 5),
              child: Text(
                '+996',
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 100),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: CstButton(
          text: '${l10n.pay} 34 567,00 KGS',
          onPressed: () {
            if (cardNumberController.text.isEmpty ||
                cardHolderController.text.isEmpty ||
                expiredDateController.text.isEmpty ||
                cvcController.text.isEmpty) {
              AppFlashController.showInfo(
                context,
                message: l10n.fill_all_fields_to_make_payment,
                type: AppInfoType.danger,
              );
            } else {
              final ordersCount = getIt<HiveService>().orders.length;
              getIt<HiveService>().addOrder(
                currentOrder!.copyWith(
                  date: DateTime.now().toString(),
                  orderType: 'new',
                  orderNumber: ordersCount + 1,
                ),
              );
              Navigator.pushAndRemoveUntil(
                context,
                PaymentSuccessScreen.route(),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
