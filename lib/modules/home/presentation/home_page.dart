import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:renatin/modules/home/presentation/home_bloc.dart';
import 'package:renatin/modules/home/presentation/home_event.dart';
import 'package:renatin/modules/home/presentation/home_state.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();
  @override
  void initState() {
    bloc.add(HomeFetchList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: MultiBlocListener(
            listeners: [
              BlocListener(
                bloc: bloc,
                listener: (context, state) {
                  if (state is HomeStateSuccess) {
                    print("seila");
                  }
                  if (state is HomeStateFailure) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Erro"),
                            content: Text(state.message),
                          );
                        });
                  }
                },
              )
            ],
            child: BlocBuilder<HomeBloc, HomeState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is HomeStateSuccess) {
                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          onLongPress: () {
                            bloc.add(HomeDeleteItemFromList(
                                user: state.users[index]));
                          },
                          title: Text(state.users[index].name),
                          subtitle: Text(state.users[index].age.toString()),
                        );
                      }),
                    );
                  }
                  if (state is HomeStateLoading) {
                    return Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: Colors.white,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return const ListTile(
                              title: Text("state.users[index].name"),
                              subtitle:
                                  Text("state.users[index].age.toString()"),
                            );
                          }),
                        ));
                  } else {
                    return const Text("não deu");
                  }
                })));
  }
}
