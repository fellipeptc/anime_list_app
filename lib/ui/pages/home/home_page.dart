import 'package:anime_list_app/ui/widget/home_card_widget.dart';
import 'package:anime_list_app/ui/widget/my_loader_widget.dart';
import 'package:anime_list_app/values_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    final textController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Anime List'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Ex: Naruto',
                suffixIcon: GestureDetector(
                  onTap: () => bloc.add(GetAnimeListEvent(textController.text)),
                  child: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) => bloc.add(GetAnimeListEvent(value)),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is HomeLoadedState) {
                final animeList = state.animeList;
                if (animeList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 200),
                        Lottie.asset(
                          kEmptyState,
                          width: 260,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Pesquisa não obteve resultados.',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .705,
                    ),
                    itemCount: animeList.length,
                    itemBuilder: (context, index) {
                      return HomeCard(anime: animeList[index]);
                    },
                  ),
                );
              }

              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }

              //Loading Home State
              return const MyLoader();
            },
          ),
        ],
      ),
    );
  }
}
