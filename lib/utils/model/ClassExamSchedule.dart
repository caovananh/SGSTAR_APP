class ClassExamName{
  String examName;
  dynamic examId;

  ClassExamName({this.examName, this.examId});

  factory ClassExamName.fromJson(Map<String,dynamic> json){
    return ClassExamName(
      examId: json['exam_id'],
      examName: json['exam_name'],
    );
  }
}

class ClassExamList{

  List<ClassExamName> exams;

  ClassExamList(this.exams);

  factory ClassExamList.fromJson(List<dynamic> json){

    List<ClassExamName> exams = [];

    exams = json.map((i) => ClassExamName.fromJson(i)).toList();

    return ClassExamList(exams);

  }
}
