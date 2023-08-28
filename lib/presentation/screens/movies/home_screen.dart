import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget{
  static const name = 'home-screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
    
  }


  @override
  Widget build(BuildContext context) {

    final nowPlayinMovies = ref.watch(nowPlayingMoviesProviders);



    return ListView.builder(
      itemCount: nowPlayinMovies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = nowPlayinMovies[index];

        return ListTile(
          title: Text (movie.title),
        );
      },
    );
  }
}