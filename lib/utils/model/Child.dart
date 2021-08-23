class Child{

  dynamic id;
  String photo;
  String name;
  dynamic roll;
  String className;
  String sectionName;

  Child({this.id, this.photo, this.name, this.roll, this.className,
    this.sectionName});


  factory Child.fromJson(Map<String,dynamic> json){
    return Child(
      id: json['user_id'],
      photo: json['student_photo'],
      name: json['student_name'],
      roll: json['roll_no'],
      className: json['class_name'],
      sectionName: json['section_name'],
    );
  }
}
class ChildList{

  List<Child> students;

  ChildList(this.students);

  factory ChildList.fromJson(List<dynamic> json){

    List<Child> studentlist = [];

    studentlist = json.map((i) => Child.fromJson(i)).toList();

    return ChildList(studentlist);

  }

}
