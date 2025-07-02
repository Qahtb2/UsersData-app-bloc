// lib/Models/data_model.dart

class DataModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  String? image;

  DataModel({this.id, this.firstName, this.lastName, this.maidenName, this.image});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'image': image,
    };
  }
}
// الكود يحتوي على تعريف نموذج بيانات (قالب Data Model) في Flutter/Dart
// يُستخدم غالبًا لتمثيل البيانات القادمة من JSON (مثل API).

// علامة ? تعني أن هذه القيم اختيارية (nullable)، أي:
// يمكن أن تحتوي على قيمة null.
// ليس من الضروري إعطاء قيم لها عند إنشاء الكائن.

// Constructor: عادي يستخدم الأقواس {} لجعل الخصائص اختيارية.

//كلمة factory تُستخدم في Dart لإنشاء دالة مصنع (Factory Constructor).
// 📌 الفرق بينها وبين constructor العادي:
// factory يمكنها إرجاع كائن جديد أو كائن موجود مسبقًا.
// تعطيك مرونة أكبر (مثل التحقق من البيانات قبل الإنشاء، أو إعادة نفس الكائن).
// تُستخدم كثيرًا مع fromJson لتحويل JSON إلى كائن.

// fromJson: (تحويل json to Map)
// toJson: تحويل الكائن إلى JSON










