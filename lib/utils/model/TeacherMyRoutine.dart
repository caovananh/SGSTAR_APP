class TeacherMyRoutine {
  final String startTime;
  final String endTime;
  final String subject;
  final String room;
  final String mClass;
  final String mSection;
  final String period;

  TeacherMyRoutine({this.startTime, this.endTime, this.subject, this.room,this.mClass,this.mSection,this.period});

  factory TeacherMyRoutine.fromJson(Map<String, dynamic> json) {
    return TeacherMyRoutine(
        startTime: json['start_time'],
        endTime: json['end_time'],
        subject: json['subject_name'],
        room: json['room_no'],
        mClass: json['class_name'],
        mSection: json['section_name'],
        period: json['period'],
    );
  }
}
class TeacherMyRoutineList{

  final List<TeacherMyRoutine> schedules;

  TeacherMyRoutineList(this.schedules);


  factory TeacherMyRoutineList.fromJson(List<dynamic> parsedJson) {

    List<TeacherMyRoutine> routines = [];

    routines = parsedJson.map((i) => TeacherMyRoutine.fromJson(i)).toList();

    return TeacherMyRoutineList(routines);
  }

}
