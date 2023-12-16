class GameQuestion {
  final String id;
  final String question;

  GameQuestion({required this.id, required this.question});
}

final questions = <GameQuestion>[
  GameQuestion(
    id: '1',
    question: 'Your password must be at least 5 characters',
  ),
  GameQuestion(
    id: '2',
    question: 'Your password must include a number',
  ),
  GameQuestion(
    id: '3',
    question: 'Your password must include a special character',
  ),
  GameQuestion(
    id: '4',
    question: 'Your password must include a capital letter',
  ),
];
