import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dart_openai/dart_openai.dart';
part 'ai_event.dart';
part 'ai_state.dart';

void main() {
  final AiBloc ai = AiBloc();
  ai.add(AiExamRequested());
}

class AiBloc extends Bloc<AiEvent, AiState> {
  late final OpenAI ai = OpenAI.instance;
  AiBloc() : super(AiInitial()) {
    on<AiExamRequested>(_onAiExamRequested);
    OpenAI.apiKey = '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';
  }

  Future<void> _onAiExamRequested(
    AiExamRequested event,
    Emitter<AiState> emit,
  ) async {
    // emit(const AiExamListLoadSuccess());
    final OpenAIChatCompletionModel completion = await ai.chat.create(
      model: 'gpt-3.5-turbo',
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.system,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              'ты генератор тестов для проверки уровня знаний английского языка, который дает 10 тестов с вариантами ответов.',
            ),
          ],
        ),
      ],
    );
    emit(AiExamListLoadSuccess(output: completion.choices));
  }
}
