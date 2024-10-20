import 'dart:convert';

enum Skill { FLUTTER, DART, OTHER }
class Address{
  String street;
  String city;
  String zipCode;

  Address(this.street,this.city,this.zipCode);

}

class Employee {
  String _name;
  double _baseSalary;
  int _yearOfExperience;
  List<Skill> _skill;
  Address _address;

  //getter method
  String get name => _name;
  double get baseSalary => _baseSalary;
  int get yearOfExperience => _yearOfExperience;
  List<Skill> get skill => _skill;
  Address get address=>_address;
  

  Employee(this._name, this._baseSalary,this._skill,this._address,this._yearOfExperience);

  Employee.mobileDeveloper(this._name,this._baseSalary,this._address,this._yearOfExperience)
  :_skill=[Skill.FLUTTER,Skill.DART];

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}, skill:$skill');
    print(' address:${address.street}, ${address.city}, ${address.zipCode}, yearOfExperience:$yearOfExperience');
    print("totalSalary:\$${calculateSalary()}\n");
  } 

  double calculateSalary(){
    double totalSalary = _baseSalary;

    totalSalary+=_yearOfExperience*2000;
    if(_skill == Skill.FLUTTER){
      totalSalary+=5000;
    }else if(_skill == Skill.DART){
      totalSalary+=3000;
    }else{
      totalSalary+=1000;
    }
    return totalSalary;
  }

}

void main() {
  var address1=Address('st2','phnom penh','12345');
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER],address1,5);
  emp1.printDetails();


  var address2=Address('st3','phnom penh','1342');
  var emp2 = Employee('Ronan', 45000,[Skill.DART],address2,10);
  emp2.printDetails();

  var address3=Address('st5','LA','#12');
  var mobileDev = Employee.mobileDeveloper('John',40000,address3,12);
  mobileDev.printDetails();
}