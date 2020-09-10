import '../../models/mountains.dart';
import '../provider/api_mountain_provider.dart';

class ApiMountainRepository {
  final ApiMountainProvider _apiMountainProvider = ApiMountainProvider();

  Future<Mountains> fetchMountains() =>
      _apiMountainProvider.getMountains();
}
