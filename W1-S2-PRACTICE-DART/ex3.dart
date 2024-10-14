

void main (){
  List<int> scores= [45, 78, 62, 49, 85, 33, 90, 50];
  var passed = scores.where((score) =>score>=50).toList();

  print(passed);
  print("${passed.length} student has passe");

}


