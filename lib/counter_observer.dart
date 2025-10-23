import 'package:bloc/bloc.dart';

class StateObserver extends BlocObserver {
  const StateObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print("${bloc.runtimeType} $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print("${bloc.runtimeType} $transition");
  }
}