import 'package:dart_either/dart_either.dart';

abstract class AzkarAbstractRepo {
  Future<Either> displayAzkar(String fileName);
}