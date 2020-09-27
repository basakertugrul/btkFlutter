import 'package:btk/models/student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Başak", "Ertuğrul", 20,
        "https://pbs.twimg.com/profile_images/1120379034553200641/MJFCCRHw.jpg"),
    Student.withId(2, "Ömer Can", "Sucu", 45,
        "https://i.pinimg.com/564x/ff/a3/48/ffa34877788a6f5784d2c684a116f3a9.jpg"),
    Student.withId(3, "Kıvanç", "Uzer", 60,
        "https://pbs.twimg.com/profile_images/378800000606361355/0aab171a94e66846960eef356dfa0a59_400x400.jpeg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildbody(context));
  }

  void mesajGoster(BuildContext context, String text) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(text),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildbody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(students[index].url)),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili öğrenci: " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              child: RaisedButton(
                  color: Colors.orangeAccent,
                  child: Row(children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text(
                      "Yeni Öğrenci",
                    )
                  ]),
                  onPressed: () {
                    var mesaj = "EKlendi";
                    mesajGoster(context, mesaj);
                  }),
              fit: FlexFit.tight,
              flex: 2,
            ),
            Flexible(
              child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle")
                  ]),
                  onPressed: () {
                    var mesaj = "Güncellendi";
                    mesajGoster(context, mesaj);
                  }),
              fit: FlexFit.tight,
              flex: 2,
            ),
            Flexible(
              child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("Sil")
                  ]),
                  onPressed: () {
                    var mesaj = "Silindi: " +
                        selectedStudent.firstName +
                        " " +
                        selectedStudent.lastName;
                    mesajGoster(context, mesaj);
                    setState(() {
                      students.remove(selectedStudent);
                    });
                  }),
              fit: FlexFit.tight,
              flex: 1,
            )
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon([int grade]) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.work);
    } else {
      return Icon(Icons.clear);
    }
  }
}
