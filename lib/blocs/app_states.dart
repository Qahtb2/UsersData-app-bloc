import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_bloc2/Models/data_model.dart';

@immutable
abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState{
  final List<DataModel> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState{
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
//abstract class: فئة مجردة لا يمكن إنشاء كائن منها، لكن تُستخدم كأساس للحالات المختلفة.
// @immutable: تجعل جميع الحالات ثابتة (لا يمكن تغيير خصائصها بعد إنشائها).
// extends Equatable: لتفعيل المقارنة بين الكائنات بشكل ذكي.

//✅ الحالة الأولى: UserLoadingState
// تمثل حالة تحميل البيانات، أي: "جاري تحميل المستخدمين..."
// ولا تحتوي على أي خصائص.

//✅ الحالة الثانية: UserLoadedState
// تم تحميل المستخدمين بنجاح.
// users: قائمة من الكائنات DataModel.
// props: تحتوي على users .حتى تتم المقارنة بين حالتين بناءً على محتوى القائمة.

//✅ الحالة الثالثة: UserErrorState
// حدث خطأ أثناء تحميل البيانات.
// error: يحتوي على رسالة الخطأ.
// props: تشمل error, لكي تتمكن Equatable, .من مقارنة حالتين فيها نفس الخطأ أو لا.

//UserLoadingState	أثناء تحميل البيانات	لا شيء
// UserLoadedState	تم تحميل البيانات بنجاح	List<DataModel>
// UserErrorState	فشل تحميل البيانات (يوجد خطأ)	String error