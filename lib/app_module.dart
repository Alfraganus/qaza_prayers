import 'package:flutter_modular/flutter_modular.dart';
import 'package:qaza_tracker/screens/home/homeMain.dart';

class AppModular extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomeMain()),
  ];


}