import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent extends Equatable{
  const UserEvent();
}

class LoadUserEvent extends UserEvent{
  @override
  List<Object?> get props => [];
}
//equatable: (props)مكتبة تساعد على مقارنة الكائنات بسهولة. بدلاً من مقارنة كل خاصية يدويًا، يمكنك فقط استخدام  .
//تستورد أدوات iOS (لكن في هذا السياق، فقط تستورد @immutable وهي مفيدة لتثبيت الكائنات).cupertino
//abstract class: هذا تعريف لفئة مجردة، لا يمكن إنشاء كائن منها مباشرة، بل فقط يمكن الوراثة منها.

//extends Equatable: هذا يجعل Dart يعرف كيف يقارن الأحداث لاحقًا
// (مثلاً في BLoC) حتى لا يعيد تنفيذ نفس الشيء لو لم يتغير الحدث.
// const UserEvent();: مُنشئ ثابت (constructor) للفئة الأب.

// LoadUserEvent:  يمثل حدث (Event) "واحد، مثلاً: "حمّل المستخدمين.
// يرث من UserEvent: لكي تتمكن مكتبة BLoC من التعامل مع جميع الأحداث بنفس الأسلوب.

// props => []:
// هذه خاصة بمكتبة equatable.
// المقارنة لا تعتمد على أي خاصية (لأنه لا توجد خصائص).
// لذلك أي كائنين من LoadUserEvent يُعتبران متساويين تلقائيًا.
// المقارنة تصبح بناءً على قيم الخصائص التي تحددها في props.

// إذا أضفت خصائص داخل الحدث لاحقًا، يجب إضافتها داخل props، :
// لكي تتم مقارنة الأحداث بشكل صحيح في BLoC.



//UserEvent	الفئة الأساسية لجميع الأحداث
// LoadUserEvent	حدث محدد لإطلاق عملية تحميل المستخدمين
// Equatable	لتسهيل المقارنة بين الأحداث
// @immutable	لجعل الكائن غير قابل للتغيير