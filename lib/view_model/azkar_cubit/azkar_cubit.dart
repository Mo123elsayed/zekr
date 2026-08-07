import 'package:bloc/bloc.dart';
import 'package:dart_either/dart_either.dart';
import 'package:equatable/equatable.dart';
import 'package:zekr/data/repositories/azkar_repo/azkar_abstarct_repo.dart';
import 'package:zekr/data/repositories/azkar_repo/azkar_implementaion_repo.dart';
import 'package:zekr/models/azkar_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarAbstractRepo azkar = AzkarImplementaionRepo();

  AzkarCubit() : super(AzkarInitial());

  Future<void> displayAzkar(String fileName) async {
    emit(AzkarLoading());
    final result = await azkar.loadAzkar(fileName);
    result.fold(
      ifLeft: (error) { emit(AzkarFailure(error)); },
      ifRight: (azkar) { emit(AzkarSuccess(azkar)); },
    );
  }
}
