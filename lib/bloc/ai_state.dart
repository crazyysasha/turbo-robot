part of 'ai_bloc.dart';

sealed class AiState extends Equatable {
  const AiState();

  @override
  List<Object> get props => [];
}

final class AiInitial extends AiState {}

final class AiExamListLoadSuccess extends AiState {
  final List output;
  const AiExamListLoadSuccess({required this.output});
}
