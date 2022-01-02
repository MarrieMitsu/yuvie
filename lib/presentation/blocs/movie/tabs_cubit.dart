import 'package:flutter_bloc/flutter_bloc.dart';

// Tabs Cubit
class TabsCubit extends Cubit<int> {

  TabsCubit() : super(0);

  void switchTab(int tab) {
    emit(tab);
  }

}