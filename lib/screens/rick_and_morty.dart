import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and/bloc/gallery_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rick and Morty APP"),
          centerTitle: true,
        ),
        body: BlocBuilder<GalleryBloc, GalleryLoadedState>(
          builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      itemCount: state.images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(state.images[index]),
                              ),
                              Text(state.names[index]),
                            ],
                          ),
                        );
                      }),
                ),
              );
          },
        ));
  }
}
