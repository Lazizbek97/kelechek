class ContactsOption {
  ContactsOption({
    required this.name,
    required this.iconPath,
    required this.id,
  });
  final String name;
  final String iconPath;
  final String id;
}

Map<String, ContactsOption> contactOptions = {
  'phone': ContactsOption(
    name: 'Телефон',
    iconPath: 'assets/svg/phone.svg',
    id: 'phone',
  ),
  'email': ContactsOption(
    name: 'Email',
    iconPath: 'assets/svg/email.svg',
    id: 'email',
  ),
  'whatsapp': ContactsOption(
    name: 'WhatsApp',
    iconPath: 'assets/svg/whatsapp.svg',
    id: 'whatsapp',
  ),
  'telegram': ContactsOption(
    name: 'Telegram',
    iconPath: 'assets/svg/telegram.svg',
    id: 'telegram',
  ),
  'viber': ContactsOption(
    name: 'Viber',
    iconPath: 'assets/svg/viber.svg',
    id: 'viber',
  ),
  'instagram': ContactsOption(
    name: 'Instagram',
    iconPath: 'assets/svg/instagram.svg',
    id: 'instagram',
  ),
  'chat': ContactsOption(
    name: 'Chat',
    iconPath: 'assets/svg/chat_circle.svg',
    id: 'chat',
  ),
  'website': ContactsOption(
    name: 'Веб-сайт',
    iconPath: 'assets/svg/website.svg',
    id: 'website',
  ),
  'other': ContactsOption(
    name: 'Другое',
    iconPath: 'assets/svg/other.svg',
    id: 'other',
  ),
  'whatsup': ContactsOption(
    name: 'WhatsApp',
    iconPath: 'assets/svg/whatsup.svg',
    id: 'whatsup',
  ),
};
