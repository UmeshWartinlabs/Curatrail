class QuestionAnswerModel {
  String? question;
  List<OptionModel>? options;
  OptionModel? answer;

  QuestionAnswerModel({this.question, this.options, this.answer});

  factory QuestionAnswerModel.fromMap(Map<String, dynamic> map) {
    return QuestionAnswerModel(
      question: map['question'] as String?,
      options: (map['options'] as List<dynamic>?)
          ?.map((e) => OptionModel.fromMap(e))
          .toList(),
      answer: map['answer'] != null ? OptionModel.fromMap(map['answer']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "question": question,
      "options": options?.map((e) => e.toMap()).toList(),
      "answer": answer?.toMap(),
    };
  }
}

class OptionModel {
  String? text;
  int? score;

  OptionModel({this.text, this.score});

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      text: map['text'] as String?,
      score: map['score'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "text": text,
      "score": score,
    };
  }

  void operator [](int other) {}
}
