import 'package:flutter_modular/flutter_modular.dart';
import 'package:renatin/modules/home/presentation/home_bloc.dart';
import 'package:renatin/modules/home/presentation/home_page.dart';
import 'package:renatin/modules/home/presentation/home_state.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          ((i) => HomeBloc(
                HomeStateEmpty(),
              )),
        ),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute("/", child: ((_, args) => const HomePage()))];
}
