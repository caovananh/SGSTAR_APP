// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:infixedu/screens/student/studyMaterials/StudyMaterialViewer.dart';
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/custom_widgets/CustomRadioButton/CustomButton/ButtonTextStyle.dart';
import 'package:infixedu/utils/custom_widgets/CustomRadioButton/custom_radio_button.dart';
import 'package:infixedu/utils/exception/DioException.dart';
import 'package:infixedu/utils/widget/Line.dart';
// import 'package:infixedu/utils/pdf_flutter.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class EvaluateScreen extends StatefulWidget {
  final String studentName;
  final String marks;
  final String teacherComment;
  final String status;
  final int studentId;
  final int homeworkId;
  final List<String> files;
  final String totalMarks;

  EvaluateScreen(
      {this.studentName,
      this.marks,
      this.teacherComment,
      this.status,
      this.studentId,
      this.homeworkId,this.files,this.totalMarks});

  @override
  _EvaluateScreenState createState() => _EvaluateScreenState();
}

class _EvaluateScreenState extends State<EvaluateScreen> {
  TextEditingController marksController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String selectedComment = '';
  String selectedStatus = '';

  String evaluationDate = '';
  bool isResponse = false;

  Response response;
  Dio dio = Dio();

  String getAbsoluteDate(int date) {
    return date < 10 ? '0$date' : '$date';
  }

  var id;
  var _token;

  @override
  void initState() {
    marksController.text = widget.marks;
    print(marksController.text);
    selectedComment = widget.teacherComment;
    selectedStatus = widget.status;
    evaluationDate =
        "${DateTime.now().year}-${getAbsoluteDate(DateTime.now().month)}-${getAbsoluteDate(DateTime.now().day)}";
    print(evaluationDate);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
        Utils.getStringValue('id').then((idValue) {
          setState(() {
            id = idValue;
          });
        });
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: widget.studentName,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
            child: Column(
              children: [
                TextFormField(
                  controller: marksController,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  style: Theme.of(context).textTheme.headline6,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String value) {
                    RegExp regExp = new RegExp(r'^[0-9]*$');
                    if (value.isEmpty) {
                      return 'Please enter a valid mark';
                    }
                    if (!regExp.hasMatch(value)) {
                      return 'Please enter a number';
                    }
                    if (int.tryParse(value) >
                        int.tryParse(widget.totalMarks)) {
                      return 'Marks must not greater than total marks';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Set Marks out of ${widget.totalMarks}",
                    labelText: "Set Marks out of ${widget.totalMarks}",
                    labelStyle: Theme.of(context).textTheme.headline4,
                    errorStyle:
                    TextStyle(color: Colors.pinkAccent, fontSize: 15.0),
                    errorMaxLines: 3,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text('Comment',style: Theme.of(context).textTheme.headline4),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRadioButton(
                          defaultSelected: widget.teacherComment,
                          elevation: 0,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: [
                            'Good',
                            'Not Good',
                          ],
                          buttonValues: [
                            "G",
                            "NG",
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Color(0xff415094),
                              textStyle: TextStyle(fontSize: ScreenUtil().setSp(14))),
                          radioButtonValue: (value) {
                            print(value);
                            setState(() {
                              selectedComment = value;
                            });
                          },
                          selectedColor: Theme.of(context).accentColor,
                          enableShape: true,
                          customShape: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          horizontal: false,
                          width: ScreenUtil().setWidth(65),
                          height: ScreenUtil().setHeight(25),
                          enableButtonWrap: true,
                          wrapAlignment: WrapAlignment.start,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:2.0),
                      child: Text('Homework Status',style: Theme.of(context).textTheme.headline4),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomRadioButton(
                            defaultSelected: widget.status,
                            elevation: 0,
                            absoluteZeroSpacing: false,
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              'Completed',
                              'Not Completed',
                            ],
                            buttonValues: [
                              "C",
                              "NC",
                            ],
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Color(0xff415094),
                                textStyle: TextStyle(fontSize: ScreenUtil().setSp(14))),
                            radioButtonValue: (value) {
                              print(value);
                              setState(() {
                                selectedStatus = value;
                              });
                            },
                            selectedColor: Theme.of(context).accentColor,
                            enableShape: true,
                            customShape: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            horizontal: false,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(25),
                            enableButtonWrap: false,
                            wrapAlignment: WrapAlignment.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: ScreenUtil().setHeight(30),
                      decoration: Utils.gradientBtnDecoration,
                      child: Text(
                        "Evaluate",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    onTap: evaluateSubmit,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isResponse == true
                      ? LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                  )
                      : Text(''),
                ),

                ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.files.length,
                    separatorBuilder: (context, index) {
                      return BottomLine();
                    },
                    itemBuilder: (context, index) {
                      return widget.files[index].contains('.pdf')
                          ? Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DownloadViewer(
                                  title: 'PDF',
                                  filePath:
                                  InfixApi.root + widget.files[index],
                                )));
                          },
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              PDF.network(
                                InfixApi.root + widget.files[index],
                                height: 300,
                                width: double.maxFinite,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.deepPurple,
                                    ),
                                    Text(
                                      'View',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : ExtendedImage.network(
                        InfixApi.root + widget.files[index],
                        fit: BoxFit.fill,
                        cache: true,
                        mode: ExtendedImageMode.gesture,
                        initGestureConfigHandler: (state) {
                          return GestureConfig(
                            minScale: 0.9,
                            animationMinScale: 0.7,
                            maxScale: 3.0,
                            animationMaxScale: 3.5,
                            speed: 1.0,
                            inertialSpeed: 100.0,
                            initialScale: 1.0,
                            inPageView: true,
                            initialAlignment: InitialAlignment.center,

                          );
                        },
                        //cancelToken: cancellationToken,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void evaluateSubmit() async{
    if(_formKey.currentState.validate()){

      setState(() {
        isResponse = true;
      });
      FormData formData = FormData.fromMap({
        "homework_id": widget.homeworkId,
        "student_id[]": widget.studentId,
        "marks[]": marksController.text,
        "teacher_comments[${widget.studentId}]": selectedComment,
        "homework_status[${widget.studentId}]": selectedStatus,
        "login_id": 1,
        "evaluation_date": evaluationDate,
      });

      response = await dio
          .post(
        InfixApi.evaluateHomework,
        data: formData,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": _token.toString(),
          },
        ),
      )
          .catchError((e) {
        final errorMessage =
        DioExceptions.fromDioError(e).toString();
        print(errorMessage);
        Utils.showToast(errorMessage);
        setState(() {
          isResponse = false;
        });
      });
      if (response.statusCode == 200) {
        print(response.data.toString());
        Utils.showToast('Homework Evaluate done for ${widget.studentName}');
        setState(() {
          isResponse = false;
        });
        Navigator.of(context).pop();
      } else {
        Utils.showToast('Something went wrong');
      }
    }
  }
}
