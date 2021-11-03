// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:infixedu/screens/AboutScreen.dart';
import 'package:infixedu/screens/Home.dart';
import 'package:infixedu/screens/SettingsScreen.dart';
import 'package:infixedu/screens/admin/AdminAttendanceScreen.dart';
import 'package:infixedu/screens/admin/dormitoryAndRoom/AdminAddDormitory.dart';
import 'package:infixedu/screens/admin/dormitoryAndRoom/AdminAddRoom.dart';
import 'package:infixedu/screens/admin/dormitoryAndRoom/AdminDormitoryScreen.dart';
import 'package:infixedu/screens/admin/fees/AddFeeType.dart';
import 'package:infixedu/screens/admin/fees/AdminFeeList.dart';
import 'package:infixedu/screens/admin/fees/AdminFeesHome.dart';
import 'package:infixedu/screens/admin/leave/AdminLeaveHomeScreen.dart';
import 'package:infixedu/screens/admin/library/AddLibraryBook.dart';
import 'package:infixedu/screens/admin/library/AdminAddMember.dart';
import 'package:infixedu/screens/admin/library/AdminLibraryScreen.dart';
import 'package:infixedu/screens/admin/staff/AdminStaffList.dart';
import 'package:infixedu/screens/admin/transport/AddRouteScreen.dart';
import 'package:infixedu/screens/admin/transport/AdminAddVehicle.dart';
import 'package:infixedu/screens/admin/transport/AdminTransportScreen.dart';
import 'package:infixedu/screens/admin/transport/AssignVehicle.dart';
import 'package:infixedu/screens/parent/ChildListScreen.dart';
import 'package:infixedu/screens/student/Dormitory.dart';
import 'package:infixedu/screens/student/Fees.dart';
import 'package:infixedu/screens/student/Profile.dart';
import 'package:infixedu/screens/student/Routine.dart';
import 'package:infixedu/screens/student/StudentAttendance.dart';
import 'package:infixedu/screens/student/StudentTeacher.dart';
import 'package:infixedu/screens/student/SubjectScreen.dart';
import 'package:infixedu/screens/student/TimeLineScreen.dart';
import 'package:infixedu/screens/student/TransportScreen.dart';
import 'package:infixedu/screens/student/examination/ClassExamResult.dart';
import 'package:infixedu/screens/student/examination/ExaminationScreen.dart';
import 'package:infixedu/screens/student/examination/ScheduleScreen.dart';
import 'package:infixedu/screens/student/homework/StudentHomework.dart';
import 'package:infixedu/screens/student/leave/LeaveListStudent.dart';
import 'package:infixedu/screens/student/leave/LeaveStudentApply.dart';
import 'package:infixedu/screens/student/leave/LeaveStudentHome.dart';
import 'package:infixedu/screens/student/library/BookIssuedScreen.dart';
import 'package:infixedu/screens/student/library/BookListScreen.dart';
import 'package:infixedu/screens/student/library/LibraryScreen.dart';
import 'package:infixedu/screens/new_student/HomeStudent.dart';
import 'package:infixedu/screens/student/notice/NoticeScreen.dart';
import 'package:infixedu/screens/student/onlineExam/ActiveOnlineExamScreen.dart';
import 'package:infixedu/screens/student/onlineExam/OnlineExamResultScreen.dart';
import 'package:infixedu/screens/student/onlineExam/OnlineExamScreen.dart';
import 'package:infixedu/screens/student/studyMaterials/StudentAssignment.dart';
import 'package:infixedu/screens/student/studyMaterials/StudentOtherDownloads.dart';
import 'package:infixedu/screens/student/studyMaterials/StudentSyllabus.dart';
import 'package:infixedu/screens/student/studyMaterials/StudyMaterialScreen.dart';
import 'package:infixedu/screens/new_student/HomeStudent.dart';
import 'package:infixedu/screens/teacher/ClassAttendanceHome.dart';
import 'package:infixedu/screens/teacher/TeacherMyAttendance.dart';
import 'package:infixedu/screens/teacher/academic/AcademicsScreen.dart';
import 'package:infixedu/screens/teacher/academic/MySubjectScreen.dart';
import 'package:infixedu/screens/teacher/academic/SearchClassRoutine.dart';
import 'package:infixedu/screens/teacher/academic/TeacherRoutineScreen.dart';
import 'package:infixedu/screens/teacher/attendance/AttendanceScreen.dart';
import 'package:infixedu/screens/teacher/content/AddContentScreen.dart';
import 'package:infixedu/screens/teacher/content/ContentListScreen.dart';
import 'package:infixedu/screens/teacher/content/ContentScreen.dart';
import 'package:infixedu/screens/teacher/homework/AddHomeworkScreen.dart';
import 'package:infixedu/screens/teacher/homework/HomeworkScreen.dart';
import 'package:infixedu/screens/teacher/homework/TeacherHomeworkListScreen.dart';
import 'package:infixedu/screens/teacher/leave/ApplyLeaveScreen.dart';
import 'package:infixedu/screens/teacher/leave/LeaveListScreen.dart';
import 'package:infixedu/screens/teacher/leave/LeaveScreen.dart';
import 'package:infixedu/screens/teacher/students/StudentSearch.dart';
import 'package:infixedu/screens/zoom/virtual_class.dart';
import 'package:infixedu/screens/zoom/virtual_meeting.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';

class AppFunction {
  static var students = [
    'Profile',
    'Fees',
    'Routine',
    'Homework',
    'Study Materials',
    'Timeline',
    'Attendance',
    'Examination',
    'Online Exam',
    'Leave',
    'Notice',
    'Subjects',
    'Teacher',
    'Library',
    'Transport',
    'Dormitory',
    'Zoom',
    'Settings',
  ];
  static var studentIcons = [
    'assets/images/profile.png',
    'assets/images/fees_icon.png',
    'assets/images/routine.png',
    'assets/images/homework.png',
    'assets/images/downloads.png',
    'assets/images/timeline.png',
    'assets/images/attendance.png',
    'assets/images/examination.png',
    'assets/images/onlineexam.png',
    'assets/images/leave.png',
    'assets/images/notice.png',
    'assets/images/subjects.png',
    'assets/images/teacher.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/dormitory.png',
    'assets/images/addhw.png',
    'assets/images/addhw.png',
  ];
  static var students2 = [
    'Profile',
    'Fees',
    'Routine',
    'Homework',
    'Study Materials',
    'Timeline',
    'Attendance',
    'Examination',
    'Online Exam',
    'Leave',
    'Notice',
    'Subjects',
    'Teacher',
    'Library',
    'Transport',
    'Dormitory',
    'Settings',
  ];
  static var studentIcons2 = [
    'assets/images/profile.png',
    'assets/images/fees_icon.png',
    'assets/images/routine.png',
    'assets/images/homework.png',
    'assets/images/downloads.png',
    'assets/images/timeline.png',
    'assets/images/attendance.png',
    'assets/images/examination.png',
    'assets/images/onlineexam.png',
    'assets/images/leave.png',
    'assets/images/notice.png',
    'assets/images/subjects.png',
    'assets/images/teacher.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/dormitory.png',
    'assets/images/addhw.png',
  ];

  static var teachers = [
    'Students',
    'Academic',
    'Attendance',
    'Leave',
    'Contents',
    'Notice',
    'Library',
    'Homework',
    'Zoom',
    'About',
    'Settings',
  ];

  static var teachersIcons = [
    'assets/images/students.png',
    'assets/images/academics.png',
    'assets/images/attendance.png',
    'assets/images/leave.png',
    'assets/images/contents.png',
    'assets/images/notice.png',
    'assets/images/library.png',
    'assets/images/homework.png',
    'assets/images/addhw.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
  ];

  static var teachers2 = [
    'Students',
    'Academic',
    'Attendance',
    'Leave',
    'Contents',
    'Notice',
    'Library',
    'Homework',
    'About',
    'Settings',
  ];

  static var teachersIcons2 = [
    'assets/images/students.png',
    'assets/images/academics.png',
    'assets/images/attendance.png',
    'assets/images/leave.png',
    'assets/images/contents.png',
    'assets/images/notice.png',
    'assets/images/library.png',
    'assets/images/homework.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
  ];

  static var admins = [
    'Students',
    'Leave',
    'Staff',
    'Dormitory',
    'Attendance',
    'Fees',
    'Contents',
    'Library',
    'Transport',
    'Zoom',
    'Settings',
  ];
  static var adminIcons = [
    'assets/images/students.png',
    'assets/images/leave.png',
    'assets/images/staff.png',
    'assets/images/dormitory.png',
    'assets/images/attendance.png',
    'assets/images/fees_icon.png',
    'assets/images/contents.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/addhw.png',
    'assets/images/addhw.png',
  ];

  static var admins2 = [
    'Students',
    'Leave',
    'Staff',
    'Dormitory',
    'Attendance',
    'Fees',
    'Contents',
    'Library',
    'Transport',
    'Settings',
  ];
  static var adminIcons2 = [
    'assets/images/students.png',
    'assets/images/leave.png',
    'assets/images/staff.png',
    'assets/images/dormitory.png',
    'assets/images/attendance.png',
    'assets/images/fees_icon.png',
    'assets/images/contents.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/addhw.png',
  ];

  static var parent = [
    'Child',
    'About',
    'Zoom',
    'Settings',
  ];
  static var parentIcons = [
    'assets/images/mychild.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
    'assets/images/addhw.png',
  ];

  static var parent2 = [
    'Child',
    'About',
    'Settings',
  ];

  static var parentIcons2 = [
    'assets/images/mychild.png',
    'assets/images/about.png',
    'assets/images/addhw.png',
  ];

  static var adminTransport = [
    'Route',
    'Vehicle',
    'Assign Vehicle',
    'Transport',
  ];
  static var adminTransportIcons = [
    'assets/images/transport.png',
    'assets/images/transport.png',
    'assets/images/addhw.png',
    'assets/images/transport.png',
  ];

  static var adminDormitory = [
    'Add Dormitory',
    'Add Room',
    'Room List',
  ];
  static var adminDormitoryIcons = [
    'assets/images/addhw.png',
    'assets/images/addhw.png',
    'assets/images/dormitory.png',
  ];

  static var librarys = [
    'Book List',
    'Books Issued',
  ];
  static var libraryIcons = [
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
  ];
  static var examinations = [
    'Schedule',
    'Result',
  ];
  static var examinationIcons = [
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
  ];

  static var onlineExaminations = [
    'Active Exam',
    'Exam Result',
  ];
  static var onlineExaminationIcons = [
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
  ];

  static var homework = [
    'Add HW',
    'HW List',
  ];
  static var homeworkIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
  ];

  static var zoomMeeting = [
    'Virtual Class',
    'meeting',
  ];
  static var zoomMeetingIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
  ];

  static var contents = [
    'Add Content',
    'Content List',
  ];
  static var contentsIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
  ];

  static var leaves = [
    'Apply Leave',
    'Leave List',
  ];
  static var leavesIcons = [
    'assets/images/hwlist.png',
    'assets/images/addhw.png',
  ];

  static var adminFees = [
    'Add Fee',
    'Fee List',
  ];
  static var adminFeeIcons = [
    'assets/images/fees_icon.png',
    'assets/images/addhw.png',
  ];

  static var adminLibrary = [
    'Add Book',
    'Book List',
    'Add Member',
  ];
  static var adminLibraryIcons = [
    'assets/images/addhw.png',
    'assets/images/hwlist.png',
    'assets/images/addhw.png',
  ];

  static var academics = [
    'My Routine',
    'Class Routine',
    'Subjects',
  ];
  static var academicsIcons = [
    'assets/images/myroutine.png',
    'assets/images/classroutine.png',
    'assets/images/subjects.png',
  ];

  static var attendance = [
    'Class Atten',
    'Search Atten',
  ];
  static var attendanceIcons = [
    'assets/images/classattendance.png',
    'assets/images/searchattendance.png',
  ];

  static var downloadLists = ['Assignment', 'Syllabus', 'Other Downloads'];
  static var downloadListIcons = [
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
    'assets/images/fees_icon.png',
  ];

  static var studentLeaves = [
    'Apply Leave',
    'Leave List',
  ];

  static var studentLeavesIcons = [
    'assets/images/hwlist.png',
    'assets/images/addhw.png',
  ];

  static void getFunctions(BuildContext context, String rule, String zoom) {
    Route route;

    switch (rule) {
      case '1':
        if (zoom == '1') {
          route =
              MaterialPageRoute(builder: (context) => Home(admins, adminIcons));
          Navigator.pushReplacement(context, route);
        } else {
          route = MaterialPageRoute(
              builder: (context) => Home(admins2, adminIcons2));
          Navigator.pushReplacement(context, route);
        }
        break;
      case '2':
        if (zoom == '1') {
          route = MaterialPageRoute(
              builder: (context) => HomeStudent(students, studentIcons));
          Navigator.pushReplacement(context, route);
        } else {
          route = MaterialPageRoute(
              builder: (context) => HomeStudent(students2, studentIcons2));
          Navigator.pushReplacement(context, route);
        }
        break;
      case '3':
        if (zoom == '1') {
          route = MaterialPageRoute(
              builder: (context) => Home(parent, parentIcons));
          Navigator.pushReplacement(context, route);
        } else {
          route = MaterialPageRoute(
              builder: (context) => Home(parent2, parentIcons2));
          Navigator.pushReplacement(context, route);
        }
        break;
      case '4':
        if (zoom == '1') {
          route = MaterialPageRoute(
              builder: (context) => HomeStudent(students, studentIcons));
          Navigator.pushReplacement(context, route);
        } else {
          route = MaterialPageRoute(
              builder: (context) => HomeStudent(students2, studentIcons2));
          Navigator.pushReplacement(context, route);
        }
        break;
    }
  }

  static void getDashboardPage(BuildContext context, String title,
      {var id, String image, int zoom, String token}) {
    switch (title) {
      case 'Profile':
        Navigator.push(
            context,
            ScaleRoute(
                page: Profile(
              id: id,
              image: image,
            )));
        break;
      case 'Fees':
        Navigator.push(context, ScaleRoute(page: FeeScreen(id: id)));
        break;
      case 'Routine':
        Navigator.push(context, ScaleRoute(page: Routine(id: id)));
        break;
      case 'Homework':
        Navigator.push(context, ScaleRoute(page: StudentHomework(id: id)));
        break;
      case 'Study Materials':
        Navigator.push(
            context,
            ScaleRoute(
                page: DownloadsHome(downloadLists, downloadListIcons, id: id)));
        break;
      case 'Leave':
        Navigator.push(
            context,
            ScaleRoute(
                page: LeaveStudentHome(studentLeaves, studentLeavesIcons,
                    id: id)));
        break;
      case 'Dormitory':
        Navigator.push(context, ScaleRoute(page: DormitoryScreen()));
        break;
      case 'Transport':
        Navigator.push(context, ScaleRoute(page: TransportScreen()));
        break;
      case 'Subjects':
        Navigator.push(
            context,
            ScaleRoute(
                page: SubjectScreen(
              id: id,
            )));
        break;
      case 'Teacher':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentTeacher(
              id: id,
              token: token,
            )));
        break;
      case 'Library':
        Navigator.push(
            context,
            ScaleRoute(
                page: LibraryHome(
              librarys,
              libraryIcons,
              id: id,
            )));
        break;
      case 'Zoom':
        Navigator.push(
            context,
            ScaleRoute(
                page: VirtualClassScreen(
              uid: id,
            )));
        break;
      case 'Notice':
        Navigator.push(context, ScaleRoute(page: NoticeScreen()));
        break;
      case 'Timeline':
        Navigator.push(context, ScaleRoute(page: TimelineScreen(id: id)));
        break;
      case 'Examination':
        Navigator.push(
            context,
            ScaleRoute(
                page: ExaminationHome(
              examinations,
              examinationIcons,
              id: id,
            )));
        break;
      case 'Online Exam':
        Navigator.push(
            context,
            ScaleRoute(
                page: OnlineExaminationHome(
              onlineExaminations,
              onlineExaminationIcons,
              id: id,
            )));
        break;
      case 'Attendance':
        Navigator.push(context,
            ScaleRoute(page: StudentAttendanceScreen(id: id, token: token)));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
    }
  }

  static void getAdminDashboardPage(
      BuildContext context, String title, String uid) {
    switch (title) {
      case 'Students':
        Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Fees':
        Navigator.push(
            context, ScaleRoute(page: AdminFeesHome(adminFees, adminFeeIcons)));
        break;
      case 'Library':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminLibraryHome(adminLibrary, adminLibraryIcons)));
        break;
      case 'Attendance':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminAttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Transport':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminTransportHome(adminTransport, adminTransportIcons)));
        break;
      case 'Staff':
        Navigator.push(context, ScaleRoute(page: AdminStaffList()));
        break;
      case 'Contents':
        Navigator.push(context,
            ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Dormitory':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminDormitoryHome(adminDormitory, adminDormitoryIcons)));
        break;
      case 'Leave':
        Navigator.push(context, ScaleRoute(page: LeaveAdminHomeScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
      case 'Zoom':
        Navigator.push(
            context,
            ScaleRoute(
                page: VirtualMeetingScreen(
              uid: uid,
            )));
        break;
    }
  }

  static void getSaasAdminDashboardPage(
      BuildContext context, String title, String uid) {
    switch (title) {
      case 'Students':
        Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Fees':
        Navigator.push(
            context, ScaleRoute(page: AdminFeesHome(adminFees, adminFeeIcons)));
        break;
      case 'Library':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminLibraryHome(adminLibrary, adminLibraryIcons)));
        break;
      case 'Attendance':
        Navigator.push(
            context,
            ScaleRoute(
                page: AttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Contents':
        Navigator.push(context,
            ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Transport':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminTransportHome(adminTransport, adminTransportIcons)));
        break;
      case 'Staff':
        Navigator.push(context, ScaleRoute(page: AdminStaffList()));
        break;
      case 'Dormitory':
        Navigator.push(
            context,
            ScaleRoute(
                page: AdminDormitoryHome(adminDormitory, adminDormitoryIcons)));
        break;
      case 'Leave':
        Navigator.push(context, ScaleRoute(page: LeaveAdminHomeScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
      case 'Zoom':
        Navigator.push(
            context,
            ScaleRoute(
                page: VirtualMeetingScreen(
              uid: uid,
            )));
        break;
    }
  }

  static void getAdminFeePage(BuildContext context, String title) {
    switch (title) {
      case 'Add Fee':
        Navigator.push(context, ScaleRoute(page: AddFeeType()));
        break;
      case 'Fee List':
        Navigator.push(context, ScaleRoute(page: AdminFeeListView()));
        break;
    }
  }

  static void getAdminLibraryPage(BuildContext context, String title) {
    switch (title) {
      case 'Add Book':
        Navigator.push(context, ScaleRoute(page: AddAdminBook()));
        break;
      case 'Add Member':
        Navigator.push(context, ScaleRoute(page: AddMember()));
        break;
      case 'Book List':
        Navigator.push(context, ScaleRoute(page: BookListScreen()));
        break;
    }
  }

  static void getAdminDormitoryPage(BuildContext context, String title) {
    switch (title) {
      case 'Room List':
        Navigator.push(context, ScaleRoute(page: DormitoryScreen()));
        break;
      case 'Add Room':
        Navigator.push(context, ScaleRoute(page: AddRoom()));
        break;
      case 'Add Dormitory':
        Navigator.push(context, ScaleRoute(page: AddDormitory()));
        break;
    }
  }

  static void getAdminTransportPage(BuildContext context, String title) {
    switch (title) {
      case 'Route':
        Navigator.push(context, ScaleRoute(page: AddRoute()));
        break;
      case 'Vehicle':
        Navigator.push(context, ScaleRoute(page: AddVehicle()));
        break;
      case 'Assign Vehicle':
        Navigator.push(context, ScaleRoute(page: AssignVehicle()));
        break;
      case 'Transport':
        Navigator.push(context, ScaleRoute(page: TransportScreen()));
        break;
    }
  }

  static void getTeacherDashboardPage(
      BuildContext context, String title, String uid) {
    switch (title) {
      case 'Students':
        Navigator.push(context, ScaleRoute(page: StudentSearch()));
        break;
      case 'Academic':
        Navigator.push(context,
            ScaleRoute(page: AcademicHomeScreen(academics, academicsIcons)));
        break;
      case 'Attendance':
        Navigator.push(
            context,
            ScaleRoute(
                page: AttendanceHomeScreen(attendance, attendanceIcons)));
        break;
      case 'Homework':
        Navigator.push(context,
            ScaleRoute(page: HomeworkHomeScreen(homework, homeworkIcons)));
        break;
      case 'Contents':
        Navigator.push(context,
            ScaleRoute(page: ContentHomeScreen(contents, contentsIcons)));
        break;
      case 'Leave':
        Navigator.push(
            context, ScaleRoute(page: LeaveHomeScreen(leaves, leavesIcons)));
        break;
      case 'Library':
        Navigator.push(context, ScaleRoute(page: BookListScreen()));
        break;
      case 'Notice':
        Navigator.push(context, ScaleRoute(page: NoticeScreen()));
        break;
      case 'About':
        Navigator.push(context, ScaleRoute(page: AboutScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
      case 'Zoom':
        Navigator.push(
            context,
            ScaleRoute(
                page: VirtualMeetingScreen(
              uid: uid,
            )));
        break;
    }
  }

  static void getParentDashboardPage(
      BuildContext context, String title, String uid) {
    switch (title) {
      case 'Child':
        Navigator.push(context, ScaleRoute(page: ChildListScreen()));
        break;
      case 'About':
        Navigator.push(context, ScaleRoute(page: AboutScreen()));
        break;
      case 'Settings':
        Navigator.push(context, ScaleRoute(page: SettingScreen()));
        break;
      case 'Zoom':
        Navigator.push(
            context,
            ScaleRoute(
                page: VirtualMeetingScreen(
              uid: uid,
            )));
        break;
    }
  }

  static void getAttendanceDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Class Atten':
        Navigator.push(context, ScaleRoute(page: StudentAttendanceHome()));
        break;
      case 'Search Atten':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentSearch(
              status: 'attendance',
            )));
        break;
      case 'My Atten':
        Navigator.push(context, ScaleRoute(page: TeacherAttendanceScreen()));
        break;
    }
  }

  static void getAdminAttendanceDashboardPage(
      BuildContext context, String title) {
    switch (title) {
      case 'Class Atten':
        Navigator.push(context, ScaleRoute(page: StudentAttendanceHome()));
        break;
      case 'Search Atten':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentSearch(
              status: 'attendance',
            )));
        break;
    }
  }

  static void getAcademicDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Subjects':
        Navigator.push(context, ScaleRoute(page: MySubjectScreen()));
        break;
      case 'Class Routine':
        Navigator.push(context, ScaleRoute(page: SearchRoutineScreen()));
        break;
      case 'My Routine':
        Navigator.push(context, ScaleRoute(page: TeacherMyRoutineScreen()));
        break;
    }
  }

  static void getLibraryDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Book List':
        Navigator.push(context, ScaleRoute(page: BookListScreen()));
        break;
      case 'Books Issued':
        Navigator.push(
            context,
            ScaleRoute(
                page: BookIssuedScreen(
              id: id,
            )));
        break;
    }
  }

  static void getHomeworkDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'HW List':
        Navigator.push(context, ScaleRoute(page: TeacherHomework()));
        break;
      case 'Add HW':
        Navigator.push(context, ScaleRoute(page: AddHomeworkScrren()));
        break;
    }
  }

  static void getContentDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Content List':
        Navigator.push(context, ScaleRoute(page: ContentListScreen()));
        break;
      case 'Add Content':
        Navigator.push(context, ScaleRoute(page: AddContentScreeen()));
        break;
    }
  }

  static void getLeaveDashboardPage(BuildContext context, String title) {
    switch (title) {
      case 'Leave List':
        Navigator.push(context, ScaleRoute(page: LeaveListScreen()));
        break;
      case 'Apply Leave':
        Navigator.push(context, ScaleRoute(page: ApplyLeaveScreen()));
        break;
    }
  }

  static void getExaminationDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Schedule':
        Navigator.push(
            context,
            ScaleRoute(
                page: ScheduleScreen(
              id: id,
            )));
        break;
      case 'Result':
        Navigator.push(
            context,
            ScaleRoute(
                page: ClassExamResultScreen(
              id: id,
            )));
        break;
    }
  }

  static void getDownloadsDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Assignment':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentAssignment(
              id: id,
            )));
        break;
      case 'Syllabus':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentSyllabus(
              id: id,
            )));
        break;
      case 'Other Downloads':
        Navigator.push(
            context,
            ScaleRoute(
                page: StudentOtherDownloads(
              id: id,
            )));
        break;
    }
  }

  static void getStudentLeaveDashboardPage(BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Apply Leave':
        Navigator.push(context, ScaleRoute(page: LeaveStudentApply(id)));
        break;
      case 'Leave List':
        Navigator.push(
            context,
            ScaleRoute(
                page: LeaveListStudent(
              id: id,
            )));
        break;
    }
  }

  static void getOnlineExaminationDashboardPage(
      BuildContext context, String title,
      {var id}) {
    switch (title) {
      case 'Active Exam':
        Navigator.push(
            context,
            ScaleRoute(
                page: ActiveOnlineExamScreen(
              id: id,
            )));
        break;
      case 'Exam Result':
        Navigator.push(
            context,
            ScaleRoute(
                page: OnlineExamResultScreen(
              id: id,
            )));
        break;
    }
  }

  static String getContentType(String ctype) {
    String type = '';
    switch (ctype) {
      case 'as':
        type = 'assignment';
        break;
      case 'st':
        type = 'study material';
        break;
      case 'sy':
        type = 'syllabus';
        break;
      case 'ot':
        type = 'others download';
        break;
    }
    return type;
  }

  static var weeks = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  //formet time
  static String getAmPm(String time) {
    var parts = time.split(":");
    String part1 = parts[0];
    String part2 = parts[1];

    int hr = int.parse(part1);
    int min = int.parse(part2);

    if (hr <= 12) {
      if (hr == 10 || hr == 11 || hr == 12) {
        return "$hr:$min" + "am";
      }
      return "0$hr:$min" + "am";
    } else {
      hr = hr - 12;
      return "0$hr:$min" + "pm";
    }
  }

  static String getExtention(String url) {
    var parts = url.split("/");
    return parts[parts.length - 1];
  }

  //return day of month
  static String getDay(String date) {
    var parts = date.split("-");
    return parts[parts.length - 1];
  }
}
