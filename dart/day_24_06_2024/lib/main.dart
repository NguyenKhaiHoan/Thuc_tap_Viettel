void main() {
  // Variables: String, int, double, bool
  String lastName = 'Nguyen Khai';
  String firstName = 'Hoan';

  var name = lastName + firstName;
  var university = 'Dai hoc Cong Nghe, DHQGHN';

  const int yearOfBirth = 2002;
  String birthday = "15/11/$yearOfBirth";

  double gpa = 3.21;

  bool gender = true;

  // List, Iterable, Try catch
  var listDateOfBirth = birthday.split('/');
  print('Date: ${listDateOfBirth[0]}');
  print('Month: ${listDateOfBirth[1]}');
  print('Year: ${listDateOfBirth[2]}');

  try {
    print(listDateOfBirth[3]);
  } catch (e) {
    print(
        'Invalid index when access the forth element in listDateOfBirth. Detail error: ${e.toString()}');
  }

  var total = birthday
      .split('/')
      .map((e) => int.parse(e))
      .fold(0, (previousValue, element) => previousValue + element);

  final timePrint = DateTime.now();

  // Controll flow
  var classification = '';
  if (gpa >= 3.6) {
    classification += 'High Distinction';
  } else if (gpa >= 3.2) {
    classification += 'Distinction';
  } else if (gpa >= 2.5) {
    classification += 'Credit';
  } else if (gpa >= 2.0) {
    classification += 'Strong Pass';
  } else {
    classification += 'Pass';
  }

  var day = '';
  switch (DateTime.now().day.toString()) {
    case "Monday":
    case "Tuesday":
    case "Wednesday":
    case "Thursday":
    case "Friday":
      day = "Weekday";
      break;
    case "Saturday":
    case "Sunday":
      day = "Weekend";
      break;
    default:
      day = "Invalid";
      break;
  }

  print(
      '''Name: $name, with the length of name is ${name.length}, middle name is ${lastName.substring(7, 11)}
Birthday: $birthday, with total in birthday is $total
Gender: ${gender == true ? 'Nam' : 'Nu'}
University: $university
Datetime: $timePrint
Classification: $classification
Date: $day''');

  int currentIndex = 0;

  while (currentIndex < 5) {
    currentIndex++;
    print("CurrentIndex with While loop: $currentIndex");
  }

  currentIndex = 0;

  while (currentIndex < 5) {
    currentIndex++;
    print("CurrentIndex with Do-While loop: $currentIndex");
  }

  currentIndex = 0;
  for (; currentIndex < 5; currentIndex++) {
    print("CurrentIndex with For loop: $currentIndex");
  }

  int a = 4;
  int b = 6;

  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a * b = ${a * b}");
  print("b / a = ${b / a}");
  print("b ~/ a = ${b ~/ a}");
  print("b % a = ${b % a}");
}
