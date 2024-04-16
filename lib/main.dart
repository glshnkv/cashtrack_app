import 'package:cashtrack_app/cashtrack_app.dart';
import 'package:cashtrack_app/models/finance_model.dart';
import 'package:cashtrack_app/models/income_model.dart';
import 'package:cashtrack_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  await Hive.openBox('finances');

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<FinanceBloc>(create: (context) => FinanceBloc()),
      ],
      child: CashTrackApp()));
}