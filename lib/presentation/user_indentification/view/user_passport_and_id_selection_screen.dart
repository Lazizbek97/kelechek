import 'package:flutter/material.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_tapbar.dart';
import 'package:kelechek/core/common/widgets/cst_underline_textfield.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/user_indentification/data/user_data/user_model.dart';

import 'package:kelechek/presentation/user_indentification/view/user_id_and_selfi_select_screen.dart';

class UserPassportIdSelectionScreen extends StatefulWidget {
  const UserPassportIdSelectionScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const UserPassportIdSelectionScreen(),
    );
  }

  @override
  State<UserPassportIdSelectionScreen> createState() =>
      _UserPassportIdSelectionScreenState();
}

class _UserPassportIdSelectionScreenState
    extends State<UserPassportIdSelectionScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool isForeigner = false;
  UserMoodel userMoodel = UserMoodel();
  final hiveService = getIt<HiveService>();
  final keyGlobal = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userMoodel = hiveService.getUser ?? UserMoodel();
    isForeigner = hiveService.getUser?.isForiegner ?? false;
    _controller.text = hiveService.getUser?.fulllName ?? '';
    _controller2.text = isForeigner
        ? hiveService.getUser?.passportNumber ?? ''
        : hiveService.getUser?.inn ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.user_indentification),
      ),
      body: Form(
        key: keyGlobal,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 30),
            CstUnderlineTextField(
              controller: _controller,
              hintText: l10n.enter_fio,
              prefixIcon: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  l10n.full_name,
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              textAlign: TextAlign.end,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              validator: (p0) {
                if ((p0 ?? '').isEmpty) {
                  return l10n.enter_fio;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTabBar(
              initialIndex: isForeigner ? 1 : 0,
              onTapBarChange: (int index) {
                setState(() {
                  isForeigner = index == 1;
                });
              },
              options: [
                l10n.kyrgiz_rep,
                l10n.foriegn,
              ],
            ),
            CstUnderlineTextField(
              hintText: isForeigner
                  ? l10n.enter_pasport_number
                  : l10n.enter_inn_number,
              controller: _controller2,
              prefixIcon: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  isForeigner ? l10n.passport_number : l10n.inn,
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
              ),
              textAlign: TextAlign.end,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              validator: (p0) {
                if ((p0 ?? '').isEmpty) {
                  return l10n.enter_pasport_number_of_inn;
                }
                return null;
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: CstButton(
          text: l10n.continue_text,
          onPressed: () async {
            if (keyGlobal.currentState!.validate()) {
              await hiveService.addUser(
                userMoodel.copyWith(
                  fulllName: _controller.text,
                  isForiegner: isForeigner,
                  passportNumber: isForeigner ? _controller2.text : '',
                  inn: isForeigner ? '' : _controller2.text,
                ),
              );
              await Navigator.push(
                context,
                SelectUserIDandSelfiSelectScreen.route(),
              ).then((value) {
                if (value == false) {
                  Navigator.pop(context);
                }
              });
            }
          },
        ),
      ),
    );
  }
}
