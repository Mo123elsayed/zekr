import 'package:dart_either/dart_either.dart';

abstract class AzkarAbstractRepo {
  Future<Either> loadAzkar(String fileName);
}
