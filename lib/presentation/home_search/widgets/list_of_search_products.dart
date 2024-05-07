import 'package:flutter/material.dart';
import 'package:kelechek/core/extentions/number_helpers.dart';
import 'package:kelechek/presentation/hunting_farm/domain/models/hunting_rental_list.dart';
import 'package:kelechek/presentation/hunting_farm/widgets/hunting_farms_details_screen.dart';
import 'package:kelechek/presentation/kindergardens/domain/models/kindergarden_list_md.dart';
import 'package:kelechek/presentation/kindergardens/widgets/kindergarden_details_screen.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/office_premesis_md.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart';
import 'package:kelechek/presentation/rent_office_premises/office_details/office_details_screen.dart';
import 'package:kelechek/presentation/rental_home/domain/models/rental_homes_list.dart';
import 'package:kelechek/presentation/rental_home/widgets/rental_home_details_screen.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/models/rental_homes_and_service_list.dart';
import 'package:kelechek/presentation/rental_home_with_service/widgets/rental_home_with_service_details_screen.dart';
import '../domain/model/search_model.dart';

class ListOfSearchProducts extends StatelessWidget {
  const ListOfSearchProducts(
      {super.key, required this.data, required this.typeText});
  final List<SearchModel> data;
  final String typeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        top: 8,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            typeText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(
            height: 4,
            color: Color(0XFFC5C4C6),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                data.length,
                (index) => SearchProduct(
                  data: data[index],
                  ontap: () {
                    FocusScope.of(context).unfocus();
                    if (data[index].pageId == 'kiyal') {
                      navigateTo(
                        OfficePremisesDetailsScreen(
                          kiyal: ProductsListModel(),
                          productId:0,
                        ),
                        context,
                      );
                    } else if (data[index].pageId == 'vzmore') {
                      navigateTo(
                        RentalHomeDetailsScreen(
                          rentalHousesMd: data[index].data as RentalHousesMd,
                        ),
                        context,
                      );
                    } else if (data[index].pageId == 'vityaz') {
                      navigateTo(
                        RentalHomeWithServiceDetailsScreen(
                          rentalHomeAndServiceMd:
                              data[index].data as RentalHomeAndServiceMd,
                        ),
                        context,
                      );
                    } else if (data[index].pageId == 'kindergarden') {
                      navigateTo(
                        KinderGardenDetailsScreen(
                          kindergardenMd: data[index].data as KindergardenMd,
                        ),
                        context,
                      );
                    } else if (data[index].pageId == 'hunting_farm') {
                      navigateTo(
                        HuntingFarmDetailsScreen(
                          rentalHuntingMd: data[index].data as RentalHuntingMd,
                        ),
                        context,
                      );
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void navigateTo(Widget page, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key, required this.ontap, required this.data});
  final Function ontap;
  final SearchModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    data.image ?? "",
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      data.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF313952),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      AppHelpers.formatNumber(data.price ?? 0) + ' KGS',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF313952),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      data.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Divider(
                    color: Color(0XFFC5C4C6),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
