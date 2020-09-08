import '../../models/mountains.dart';
import '../provider/api_mountain_provider.dart';

class ApiMountainRepository {
  final ApiMountainProvider _apiMountainProvider = ApiMountainProvider();

  Future<List<Mountain>> fetchMountains() =>
      _apiMountainProvider.getMountains();
}
