// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kelechek/core/constants/constants.dart';
// import 'package:kelechek/presentation/home_search/widgets/search_field.dart';

// import '../../../di/injection.dart';
// import '../../widgets/buildable.dart';
// import '../cubit/home_search_cubit.dart';
// import '../widgets/focused_search_body.dart';
// import '../widgets/unfocused_search_body.dart';

// class HomeSearchScreen extends StatefulWidget {
//   const HomeSearchScreen({super.key});

//   static Route<void> route() {
//     return MaterialPageRoute<void>(
//       builder: (_) => const HomeSearchScreen(),
//     );
//   }

//   @override
//   State<HomeSearchScreen> createState() => _HomeSearchScreenState();
// }

// class _HomeSearchScreenState extends State<HomeSearchScreen> {
//   final FocusNode _focusNode = FocusNode();
//   final TextEditingController _searchController = TextEditingController();
//   bool isfocused = false;

//   @override
//   void initState() {
//     _focusNode.addListener(() {
//       isfocused = _focusNode.hasFocus;
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         var cubit = locator<HomeSearchCubit>();
//         cubit.fetchData("", context);
//         return cubit;
//       },
//       child: Buildable<HomeSearchCubit, HomeSearchState, HomeSearchBuildable>(
//         properties: (buildable) => [buildable.isfocused, buildable.data],
//         builder: (context, state) {
//           bool nothingFound =
//               state.data.isEmpty && _searchController.text.isNotEmpty;
//           return Scaffold(
//             backgroundColor:
//                 nothingFound ? AppColors.white : const Color(0XFFA7A7A7),
//             resizeToAvoidBottomInset: false,
//             body: FocusScope(
//               autofocus: true,
//               child: Column(
//                 children: [
//                   Container(
//                     color: nothingFound
//                         ? AppColors.white
//                         : const Color(0XFFA7A7A7),
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(16),
//                     child: SafeArea(
//                       bottom: false,
//                       child: SizedBox(
//                         height: 45,
//                         child: Row(
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               icon: const Icon(
//                                 Icons.arrow_back_ios,
//                                 size: 20,
//                                 color: AppColors.gray5,
//                               ),
//                             ),
//                             Expanded(
//                               child: Focus(
//                                 focusNode: _focusNode,
//                                 onFocusChange: (hasFocus) {
//                                   if (hasFocus) {
//                                     // context
//                                     //     .read<HomeSearchCubit>()
//                                     //     .chooseFocus(hasFocus);
//                                   }
//                                 },
//                                 child: SearchField(
//                                   controller: _searchController,
//                                   onChanged: (v) {
//                                     context
//                                         .read<HomeSearchCubit>()
//                                         .fetchData(v, context);
//                                   },
//                                   onPressed: () {
//                                     _focusNode.unfocus();
//                                     _searchController.clear();
//                                     context
//                                         .read<HomeSearchCubit>()
//                                         .chooseFocus(false);
//                                   },
//                                   onEditingComplete: () {
//                                     _focusNode.requestFocus();
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   !isfocused
//                       ? const UnFocusedSearchBody(
//                           isFocused: true,
//                         )
//                       : FocusedSearchBody(
//                           groupedData: state.groupedData,
//                           searchtext: _searchController.text,
//                           searchResults: state.data,
//                         ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
