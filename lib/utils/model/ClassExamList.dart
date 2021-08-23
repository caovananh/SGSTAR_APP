// ignore: camel_case_types
class classExam {
  String subjectName;
  String date;
  String roomNo;
  String startTime;
  String endTime;

  classExam(
      {this.subjectName, this.date, this.roomNo, this.startTime, this.endTime});

  factory classExam.fromJson(Map<String, dynamic> json) {
    return classExam(
        subjectName: json['subject_name'],
        date: json['date'],
        roomNo: json['room_no'],
        startTime: json['start_time'],
        endTime: json['end_time']);
  }
}

// ignore: camel_case_types
class classExamScheduleList {

  List<classExam> exams;

  classExamScheduleList(this.exams);

  factory classExamScheduleList.fromJson(List<dynamic> json) {
    List<classExam> examList;

    examList = json.map((i) => classExam.fromJson(i)).toList();

    return classExamScheduleList(examList);
  }
}
