library credit_card_form;

import 'package:credit_card_form/text_input_widget.dart';
import 'package:credit_card_form/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'component.dart';
part 'theme.dart';

enum CardType {
  master,
  visa,
  verve,
  discover,
  americanExpress,
  dinersClub,
  jcb,
  others,
  mir,
  invalid
}

Map<CardType, String> cardTypeImagePathes = {
  CardType.master: 'images/brand_mastercard.png',
  CardType.visa: 'images/brand_visa.png',
  CardType.verve: 'images/brand_verve.png',
  CardType.discover: 'images/brand_discover.png',
  CardType.americanExpress: 'images/brand_amex.png',
  CardType.dinersClub: 'images/brand_dinersclub.png',
  CardType.jcb: 'images/brand_jcb.png',
  CardType.others: 'images/brand_creditcard.png',
  CardType.mir: 'images/brand_mir.png',
  CardType.invalid: 'images/brand_creditcard.png',
};

class CreditCardController extends ChangeNotifier {
  CreditCardValue value = CreditCardValue();

  void setValue(CreditCardValue initialValue) {
    value = initialValue;
    notifyListeners();
  }
}

class CreditCardResult {
  final String cardNumber;
  final String cvc;
  final String cardHolderName;
  final String expirationMonth;
  final String expirationYear;
  final CardType? cardType;
  const CreditCardResult({
    required this.cardNumber,
    required this.cvc,
    required this.cardHolderName,
    required this.expirationMonth,
    required this.expirationYear,
    this.cardType,
  });
}

class CreditCardValue {
  String? cardNumber;
  String? cardHolderName;
  String? expiryDate;
  CreditCardValue({
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
  });
}
