class InterviewUser{
  late final String name;
  late final String q1;
  late final String q2;
  late final String q3;
  late final String q4;
  late final String q5;
  late final String qT;

  InterviewUser(this.name, this.q1, this.q2, this.q3, this.q4, this.q5, this.qT);



  InterviewUser.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String? ?? '';
    q1 = json['q1'] as String? ?? '';
    q2 = json['q2'] as String? ?? '';
    q3 = json['q3'] as String? ?? '';
    q4 = json['q4'] as String? ?? '';
    q5 = json['q5'] as String? ?? '';
    qT = json['qT'] as String? ?? '';
  }


  Map<String, dynamic> toJson() => {
    'name': name,
    'q1': q1,
    'q2': q2,
    'q3': q3,
    'q4': q4,
    'q5': q5,
    'qT': qT,
  };



}