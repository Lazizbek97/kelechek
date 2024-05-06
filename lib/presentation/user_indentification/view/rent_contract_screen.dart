import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_outlined_button.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/user_indentification/view/total_amount_calculation_screen.dart';

class RentContractScreen extends StatelessWidget {
  const RentContractScreen({required this.ordersModel, super.key});

  final OrdersModel ordersModel;

  static Route<void> route(OrdersModel ordersModel) {
    return MaterialPageRoute<void>(
      builder: (_) => RentContractScreen(
        ordersModel: ordersModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.rental_agrement),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          Text(
            '''
«12»  марта 2024 г.
г.Бишкек,​Проспект Чуй, 202​1 этаж 5 
Офисное помещение, площадью 27 m2. 
в лице , действующего на основании , именуемый в дальнейшем «Арендодатель», с одной стороны, и  в лице , действующего на основании , именуемый в дальнейшем «Арендатор: Лыков Сергей Петрович; ИНН: 12345678901234», с другой стороны, именуемые в дальнейшем «Стороны», заключили настоящий договор, в дальнейшем «Договор», о нижеследующем:
1. ПРЕДМЕТ ДОГОВОРА
1.1. Арендодатель передает, а Арендатор принимает во временное пользование нежилые помещения, общей площадью  кв.м., расположенные в здании, кадастровый (условный) номер: , по адресу: , в дальнейшем именуемые «Помещения» (согласно Плану-схеме арендуемых помещений – Приложение №1 к Договору).
1.2. Нежилое помещение передается в аренду на условиях и сроками, указанными в настоящем Договоре.
2. Арендная плата
2.1. Арендная плата за пользование нежилым помещением составляет [сумма] сомов в месяц и подлежит оплате Арендатором ежемесячно до [дата] каждого месяца.
2.2. Арендная плата включает в себя [условия, включенные в аренду].
3. Срок действия договора
3.1. Настоящий Договор заключается на срок с [дата начала] по [дата окончания].
3.2. В случае необходимости продления срока аренды, стороны обязуются заключить дополнительное соглашение к настоящему Договору.
4. Обязанности сторон
4.1. Арендодатель обязуется:
передать Арендатору нежилое помещение в надлежащем состоянии;
провести ремонтные работы по обслуживанию помещения;
предоставить все необходимые документы, подтверждающие право собственности на нежилое помещение.
4.2. Арендатор обязуется:
использовать нежилое помещение только в целях, предусмотренных настоящим Договором;
своевременно оплачивать арендную плату и коммунальные услуги;
поддерживать нежилое помещение в чистоте и порядке.
5. Заключительные положения
5.1. Настоящий Договор вступает в силу с момента его подписания сторонами и действует до завершения срока, указанного в пункте 3.1.
5.2. Все изменения и дополнения к настоящему Договору действительны при условии их оформления в письменной форме и подписания обеими сторонами.
5.3. Во всем остальном, что не предусмотрено настоящим Договором, стороны руководствуются действующим законодательством Кыргызстана.''',
          ),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CstOutlinedButton(
                text: l10n.cancel_agrement,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              CstButton(
                text: l10n.continue_text,
                onPressed: () {
                  Navigator.push(
                      context, TotalAmountCalculationScreen.route(ordersModel));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
