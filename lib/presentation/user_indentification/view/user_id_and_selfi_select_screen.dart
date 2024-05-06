import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_circular_progress_indicator.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/core/utils/image_picker_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/repository/office_premesis_repository.dart';
import 'package:kelechek/presentation/user_indentification/data/user_data/user_model.dart';

import 'package:kelechek/presentation/user_indentification/view/user_data_verification_completed_screen.dart';

class SelectUserIDandSelfiSelectScreen extends StatefulWidget {
  const SelectUserIDandSelfiSelectScreen({super.key});

  static Route<bool?> route() {
    return MaterialPageRoute<bool?>(
      builder: (_) => const SelectUserIDandSelfiSelectScreen(),
    );
  }

  @override
  State<SelectUserIDandSelfiSelectScreen> createState() =>
      _SelectUserIDandSelfiSelectScreenState();
}

class _SelectUserIDandSelfiSelectScreenState
    extends State<SelectUserIDandSelfiSelectScreen> {
  String image1 = '';
  String image2 = '';
  String image3 = '';
  final hiveService = getIt<HiveService>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.pasport_data),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _ImagePickContainer(
              onTap: (image) {
                setState(() {
                  image1 = image;
                });
              },
              status: image1.isNotEmpty
                  ? _PickImageStatus.done
                  : _PickImageStatus.notSelected,
              text: l10n.upload_frontside_of_pasport,
            ),
            const SizedBox(height: 20),
            _ImagePickContainer(
              onTap: (image) {
                setState(() {
                  image2 = image;
                });
              },
              status: image2.isNotEmpty
                  ? _PickImageStatus.done
                  : _PickImageStatus.notSelected,
              text: l10n.upload_back_of_your_passport,
            ),
            const SizedBox(height: 20),
            _ImagePickContainer(
              onTap: (image) {
                setState(() {
                  image3 = image;
                });
              },
              text: l10n.upload_selfi_with_pasport,
              status: image3.isNotEmpty
                  ? _PickImageStatus.done
                  : _PickImageStatus.notSelected,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: CstButton(
          text: l10n.continue_text,
          onPressed: image1.isNotEmpty && image2.isNotEmpty && image3.isNotEmpty
              ? () async {
                  // ignore: inference_failure_on_function_invocation
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierColor: Colors.transparent,
                    builder: (_) => const CstCircularProgressIndicator(),
                  );
                  await registerUser(context);
                }
              : null,
        ),
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    OfficePremesisRepository repository = OfficePremesisRepository();
    UserMoodel? userMoodel = hiveService.getUser;
    final response = await repository.registerUser(
      fio: "${userMoodel?.fulllName}",
      idcardNumber: (userMoodel?.isForiegner ?? false)
          ? (userMoodel?.passportNumber ?? '')
          : (userMoodel?.inn ?? ''),
      passportImage: image1,
      idcardImage: image2,
      selfieImage: image3,
    );
    response.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.toString()),
          ),
        );
        Navigator.of(context).pop();
      },
      (r) async {
        //{"id":11,"fio":"Lazizbek Fayziev","identification_code":"208970101190520045043","is_verified":0}
        hiveService.addUser(
          userMoodel!.copyWith(
            userId: r.id,
            isVerified: r.isVerified != 0,
          ),
        );
        await Navigator.pushReplacement(
          context,
          UserDataVerificationCompleted.route(),
          // (route) => false,
        );
      },
    );
  }
}

enum _PickImageStatus {
  done,
  notSelected,
}

class _ImagePickContainer extends StatelessWidget {
  const _ImagePickContainer({
    required this.text,
    required this.status,
    required this.onTap,
    super.key,
  });

  final String text;
  final _PickImageStatus status;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () async {
        final imageFile = await pickImage();
        if (imageFile != null) {
          onTap(imageFile.path);
        }
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(16),
        padding: EdgeInsets.zero,
        color: status == _PickImageStatus.done
            ? AppColors.blueGray
            : AppColors.lightGray,
        strokeWidth: 2,
        dashPattern: const [4, 2],
        child: Container(
          height: 137,
          width: double.infinity,
          decoration: BoxDecoration(
            color: status == _PickImageStatus.done
                ? AppColors.D9D9D9
                : AppColors.EBF2FF,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (status == _PickImageStatus.done) ...[
                  const CustomImageView(
                    imagePath: AppImagePaths.done,
                  ),
                  Text(
                    l10n.upload_finished,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.s16W400.copyWith(
                      color: AppColors.blueGray,
                    ),
                  ),
                ] else ...[
                  const Icon(
                    Icons.add,
                    color: AppColors.lightGray,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.s16W400.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
