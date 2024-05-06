part of 'home_appbar.dart';

class LanguageSelectionDropDown extends StatelessWidget {
  const LanguageSelectionDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        padding: EdgeInsets.zero,
        child: DropdownButton2(
          isDense: true,
          customButton: Text(
            context.l10n.language,
            style: AppTextStyle.s16W400,
          ),
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: context.l10n.languageCode == 'en'
                    ? AppColors.lightBlue
                    : AppColors.white,
                child: Text(
                  'En',
                  style: AppTextStyle.s16W400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'ru',
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: context.l10n.languageCode == 'ru'
                    ? AppColors.lightBlue
                    : AppColors.white,
                child: Text(
                  'Рус',
                  style: AppTextStyle.s16W400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'ky',
              child: Container(
                color: context.l10n.languageCode == 'ky'
                    ? AppColors.lightBlue
                    : AppColors.white,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'KG',
                  style: AppTextStyle.s16W400,
                ),
              ),
            ),
          ],
          value: context.l10n.languageCode,
          onChanged: (value) { 
            context.read<AppSettingsCubit>().changeAppLocale(
                  Locale(value?.toLowerCase() ?? 'en'),
                );
          },
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
            height: 36,
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
            useSafeArea: false,
            scrollPadding: EdgeInsets.zero,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            offset: const Offset(-16, 0),
          ),
        ),
      ),
    );
  }
}
