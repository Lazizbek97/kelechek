part of credit_card_form;

class CreditCardDarkTheme implements CreditCardTheme {
  @override
  Color backgroundColor = HexColor('181E28');
  @override
  Color textColor = HexColor('FFFFFF');
  @override
  Color borderColor = HexColor('232C3B');
  @override
  Color labelColor = HexColor('41546F');
}

class CreditCardLightTheme implements CreditCardTheme {
  @override
  Color backgroundColor = HexColor('EBF2FF');
  @override
  Color textColor = HexColor('313952');
  @override
  Color borderColor = HexColor('C5C4C6');
  @override
  Color labelColor = Colors.black45;
}

abstract class CreditCardTheme {
  late Color backgroundColor;
  late Color textColor;
  late Color borderColor;
  late Color labelColor;
}
