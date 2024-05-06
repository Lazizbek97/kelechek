part of 'kindergarden_cubit.dart';

class KindergardenState extends Equatable {
  const KindergardenState({
    required this.isLoading,
    this.kindergardenMdList = const [],
    this.errorMassage = '',
    this.filter1,
    this.filter2,
  });

  final bool isLoading;
  final List<KindergardenMd> kindergardenMdList;
  final String errorMassage;
  final KindergardenFilterOption? filter1;
  final KindergardenFilterOption? filter2;

  KindergardenState copyWith({
    bool? isLoading,
    List<KindergardenMd>? kindergardenMdList,
    String? errorMassage,
    KindergardenFilterOption? filter1,
    KindergardenFilterOption? filter2,
  }) {
    return KindergardenState(
      isLoading: isLoading ?? this.isLoading,
      kindergardenMdList: kindergardenMdList ?? this.kindergardenMdList,
      errorMassage: errorMassage ?? this.errorMassage,
      filter1: filter1 ?? this.filter1,
      filter2: filter2 ?? filter2,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        kindergardenMdList,
        errorMassage,
        filter1,
        filter2,
      ];
}
