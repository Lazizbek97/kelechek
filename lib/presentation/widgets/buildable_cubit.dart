import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BuildableCubit<STATE, BUILDABLE extends STATE>
    extends Cubit<STATE> {
  late BUILDABLE buildable;
  BuildableCubit(BUILDABLE initialBuildable) : super(initialBuildable) {
    buildable = initialBuildable;
  }

  build(BUILDABLE Function(BUILDABLE buildable) builder) {
    buildable = builder(buildable);
    emit(buildable);
  }
}
