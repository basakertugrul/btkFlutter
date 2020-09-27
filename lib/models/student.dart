class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String status;
  String url;
  Student.withId(
      int id, String firstName, String lastName, int grade, String url) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.url = url;
  }
  Student(String firstName, String lastName, int grade, String url) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.url = url;
  }

  String get getStatus {
    String message;
    if (this.grade >= 50) {
      message = "Geçti";
    }
    if (this.grade <= 40) {
      message = "Bütünlemeye kaldı";
    }
    if (this.grade < 40) {
      message = "Kaldı";
    }

    return message;
  }
}
