import 'package:dart_either/dart_either.dart';
import 'package:zekr/data/datasources/local_datasources.dart';
import 'package:zekr/data/repositories/azkar_repo/azkar_abstarct_repo.dart';

class AzkarImplementaionRepo implements AzkarAbstractRepo {
  final LocalDataSource localDataSource = LocalDataSource();
  @override
  Future<Either> loadAzkar(String fileName) async {
    try {
      final azkar = await localDataSource.loadAzkar(fileName);
      return Right(azkar);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
