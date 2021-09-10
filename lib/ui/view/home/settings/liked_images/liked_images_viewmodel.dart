import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/models/image_db_item.dart';
import 'package:extraterrestrial_weather/services/database_service/database_service.dart';
import 'package:stacked/stacked.dart';

class LikedImagesViewModel extends BaseViewModel {
  DataBaseService _dataBaseService = locator<DataBaseService>();

  List<ImageDbItem> images = [];

  Future<void> _viewPreload() async {
    images = await _dataBaseService.getAllImages();
    notifyListeners();
  }

  LikedImagesViewModel() {
    _viewPreload();
  }

  deleteImage(String hdURL) async {
    await _dataBaseService.deleteImage(hdURL);
    images = await _dataBaseService.getAllImages();
    notifyListeners();
  }
}
