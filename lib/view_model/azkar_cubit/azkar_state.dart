part of 'azkar_cubit.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}
final class AzkarLoading extends AzkarState {}
final class AzkarSuccess extends AzkarState {
  final List<AzkarModel> azkar;
  const AzkarSuccess(this.azkar);
}
final class AzkarFailure extends AzkarState {
  final String error;
  const AzkarFailure(this.error);
}
