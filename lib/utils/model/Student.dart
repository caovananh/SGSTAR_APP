class Student{

  int id;
  int uid;
  String photo;
  String name;
  int roll;
  String className;
  String sectionName;

  Student({this.id, this.photo, this.name, this.roll, this.className,
      this.sectionName,this.uid});


  factory Student.fromJson(Map<String,dynamic> json){
    return Student(
      id: json['id'],
      photo: json['student_photo'],
      name: json['full_name'],
      roll: json['roll_no'],
      className: json['class_name'],
      sectionName: json['section_name'],
      uid: json['user_id'],
    );
  }
}
class StudentList{

  List<Student> students;

  StudentList(this.students);

  factory StudentList.fromJson(List<dynamic> json){

    List<Student> studentlist = [];

    studentlist = json.map((i) => Student.fromJson(i)).toList();

    return StudentList(studentlist);

  }

}
