class ActiveOnlineExam {
  String title;
  String subject;
  String date;
  int status;
  int isRunning;
  int isWaiting;
  int isClosed;

  ActiveOnlineExam(
      {this.title,
      this.subject,
      this.date,
      this.status,
      this.isRunning,
      this.isWaiting,
      this.isClosed});

  factory ActiveOnlineExam.fromJson(Map<String, dynamic> json) {
    return ActiveOnlineExam(
      title: json['exam_title'],
      subject: json['subject_name'],
      date: json['date'],
      status: json['onlineExamTakeStatus'],
      isRunning: json['is_running'],
      isWaiting: json['is_waiting'],
      isClosed: json['is_closed'],
    );
  }
}

class ActiveExamList {
  List<ActiveOnlineExam> activeExams;

  ActiveExamList(this.activeExams);

  factory ActiveExamList.fromJson(List<dynamic> jsonArr) {
    List<ActiveOnlineExam> examlist = [];

    examlist = jsonArr.map((i) => ActiveOnlineExam.fromJson(i)).toList();

    return ActiveExamList(examlist);
  }
}
