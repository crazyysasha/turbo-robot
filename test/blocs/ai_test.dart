import 'package:bloc_test/bloc_test.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:test/scaffolding.dart';
import 'package:turbo_robot/bloc/ai_bloc.dart';

void main() async {
//   final AiBloc ai = AiBloc();
//   ai.add(AiExamRequested());
  OpenAI.apiKey = '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';
  final OpenAI ai = OpenAI.instance;
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
  print(completion);

  group(
    "AI",
    () {
      blocTest<AiBloc, AiState>(
        'test ai bloc',
        build: () => AiBloc(),
        act: (bloc) => bloc.add(AiExamRequested()),
        wait: const Duration(seconds: 30),
        expect: () => <AiState>[AiExamListLoadSuccess(output: [])],
      );
    },
  );
}
