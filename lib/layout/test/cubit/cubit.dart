import 'package:bloc/bloc.dart';
import 'package:etma2n/data/depressionq_qestions.dart';
import 'package:etma2n/data/question_list1.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:etma2n/layout/test/result_screen.dart';
import 'package:etma2n/layout/test/test_screen.dart';
import 'package:etma2n/layout/test/welcome.dart';
import 'package:etma2n/model/question_model.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<TestStates> {
  TestCubit() : super(TestInitialState());

  static TestCubit get(context) => BlocProvider.of(context);
  int totalResult = 0;

  int resultScore = 0;
  int testIndex = 0;

  var questions;

  String? testName;

  bool isPress = false;
  String? messageText ;
  final PageController? _controller = PageController();
  String? resultText;

  void changePage() {
    if (resultScore > (totalResult / 3) && resultScore <= ((totalResult / 3)*2)) {
      resultText = " $testName متوسط ";
      messageText =
      "ندعوك للعناية بصحتك النفسية وطلب الاستشارة فى أقرب فرصة ممكنة، تذكر أنك لست وحدك واطمئن هنا لمساعدتك 💙";

    } else if (resultScore > ((totalResult / 3)*2) && resultScore <= totalResult) {
      resultText = "احتمال $testName مرتفع";
      messageText =
      "ندعوك للعناية بصحتك النفسية وطلب الاستشارة فى أقرب فرصة ممكنة، نجاهل هذه الرحلة يؤدى لزيادة الحالةسوءا، لا تتجاهلهادون طلب للمساعدة، تذكر أنك لست وحدك واطمئن هنا لمساعدتك 💙";

    }
    else {
      resultText = "$testName منخفض ";
      messageText =
      "الشده لديك طبيعية ولا تظهر عليك أعراض. في حالة شعرت أن لديك مشكلة أو أعراض  جديدة يمكنك إعادة الاختبار مرة أخرى أو التحدث إلى متخصص واطمئن هنا لمساعدتك 💙";
    }

    emit(TestResultErrorState());
  }

/*  void testStart() {
    QuizScreen();
    emit(TestStartState());
  }*/

  takeTest() {
    if (testIndex == 0) {
      emit(TestTakenState());
      return QuizScreen(depressionqQestions);
    } else if (testIndex == 1) {
      emit(TestTakenState());
      return QuizScreen(questions1);
    }
  }
/*void chooseTest(int index) {
    if(index == 1) {
      questions = depressionqQestions;
    }
    emit(TestChooseState());
  }*/

}
