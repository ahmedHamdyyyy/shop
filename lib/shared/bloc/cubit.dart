

import 'package:aaaaaa/local/cach_helper.dart';
import 'package:aaaaaa/shared/bloc/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class bloc extends Cubit<appstatus> {
  bloc() : super(appinitialsyatus());

  static bloc get(context) => BlocProvider.of(context);

  bool isDark=false;
  void changAppMode(){
    isDark= !isDark;

    CachHealper.putBoll(value: isDark, key: "dark").then((value) {
      emit(NewsChangeAppMODEE());
    });
  }
}
