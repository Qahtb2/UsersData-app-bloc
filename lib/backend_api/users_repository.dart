import 'dart:convert';
import 'package:http/http.dart';
import 'package:project_bloc2/Models/data_model.dart';

class UserRepository{
  String usersUrl = 'https://dummyjson.com/users';

  Future<List<DataModel>> getUsers() async{
    Response response = await get(Uri.parse(usersUrl));

    if(response.statusCode == 200 ){
      final List<Map<String, dynamic>> result = jsonDecode(response.body)["users"];
      return result.map((e) => DataModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}
// الفكرة الكاملة للمشروع:
// الكود يستدعي API.
// يحصل على JSON يحتوي على المستخدمين.
// يحوّل كل مستخدم إلى DataModel.
// يرجع قائمة جاهزة من كائنات DataModel.


//class UserRepository:
// هذا تعريف لكلاس اسمه UserRepository.
// الهدف منه هو جلب المستخدمين من الإنترنت (API).
// يعتبر هذا الكلاس كمصدر للبيانات (Repository Layer).

//String usersUrl = 'https://dummyjson.com/users';
// رابط API الذي يُستخدم للحصول على قائمة المستخدمين (Users).

//Future<List<DataModel>> getUsers() async:
// دالة اسمها getUsers.
// ترجع قائمة من الكائنات (List<DataModel>) بشكل غير مباشر (Future).
// تُستخدم لجلب المستخدمين من الإنترنت.

// Response response = await get(Uri.parse(usersUrl));
// يقوم بإرسال طلب GET إلى عنوان المستخدمين.
// ينتظر (await) حتى يكتمل الطلب.
// Uri.parse(usersUrl) يحوّل النص إلى كائن Uri.

//if (response.statusCode == 200):
// إذا كان كود الاستجابة 200 (نجاح) نبدأ بتحليل البيانات.
// غير ذلك نرمي خطأ.

// final List result = jsonDecode(response.body)["users"];:
// يحوّل الـ JSON من نص إلى خريطة (Map) :jsonDecode .
// ثم نأخذ منه فقط قائمة المستخدمين: ["users"].
// النتيجة ستكون List من المستخدمين (كل عنصر عبارة عن Map).
//["users"]: الوصول إلى المفتاح ("users") داخل الكائن المحول من JSON.

// return result.map((e) => DataModel.fromJson(e)).toList();:
// يقوم بتحويل كل عنصر من JSON إلى كائن DataModel باستخدام fromJson.
// map(): تمرّ على كل عنصر في القائمة.
// (e) => DataModel.fromJson(e): لكل عنصر e (وهو Map يمثل مستخدمًا)،
// يتم إنشاء كائن DataModel من خلال الدالة fromJson.
// 2. .toList()
// لأن map() يرجع Iterable، فنستخدم toList() لتحويله إلى List<DataModel>.
// يرجع [
//   DataModel(id: 1, name: "Ali"),
//   DataModel(id: 2, name: "Laila")
// ]

// else { throw Exception(response.reasonPhrase); }:
// إذا لم تكن الاستجابة ناجحة، يتم رمي استثناء (خطأ).
// response.reasonPhrase: تعطي سبب الخطأ (مثلاً: "Not Found").