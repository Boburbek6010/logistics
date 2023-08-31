class InterviewUser{
  late final String name;
  late final String question1;
  late final String question2;
  late final String question3;
  late final String question4;
  late final String question5;

  InterviewUser(this.name, this.question1, this.question2, this.question3, this.question4, this.question5);



  InterviewUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    question1 = json['question1'];
    question2 = json['question2'];
    question3 = json['question3'];
    question4 = json['question4'];
    question5 = json['question5'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'question1': question1,
    'question2': question2,
    'question3': question3,
    'question4': question4,
    'question5': question5,
  };



}