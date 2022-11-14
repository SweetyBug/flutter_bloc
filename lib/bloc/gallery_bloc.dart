import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and/services/network_helper.dart';
part 'gallery_state.dart';
part 'gallery_event.dart';

class GalleryBloc extends Bloc<LoadGalleryEvent, GalleryLoadedState>{
  GalleryBloc() : super(const GalleryLoadedState(images: [],names: [])) {
    on<LoadGalleryEvent>((event, emit) async {
      List<String> images = [];
      List<String> names = [];
      String url = "https://rickandmortyapi.com/api/character";

      NetworkHelper networkHelper = NetworkHelper(url: url);
      dynamic data = await networkHelper.getData();
      List<dynamic> results = data["results"] as List;
      for(int i=0; i<results.length; i++) {
        images.add(results[i]["image"]);
        names.add(results[i]["name"]);
      }
      emit(GalleryLoadedState(images: images, names: names));
    }
    );
  }
}