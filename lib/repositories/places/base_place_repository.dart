import '../../models/plasce_autocomplate_model.dart';

abstract class BasePalaceRepository {
  // ignore: body_might_complete_normally_nullable
  Future<List<PlaceAutocomplate>?> getAutocomplate(String searchInput) async {}
}
