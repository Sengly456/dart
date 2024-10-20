class BankAccount {
  String name;
  double _balance;
  int _accId;

  BankAccount(this._balance,this.name,this._accId);
  int get accId=>_accId;
  double get balance => _balance;
  set balance(double value){
    if(value<0){
      print("cannot be negative number");
    }else{
      _balance=value;
    }
  }
  
  double withdraw(double amount){
  
    if(amount<=_balance ){
      return _balance-=amount;
    }
    else{
      print("the balance is 0 cannot withdraw");
      return _balance;
    }
    
  }

  double credit(double amount){
   if(amount>=0){
      _balance+=amount;
      return _balance; 
   }else{
    print("cannot add negative number to the balance");
    return _balance;
   }
    
  }
   

  void printDetails(){
    print("Account name:$name, Balance:$_balance");
  }
  @override
  String toString(){
    return "Account ID:$_accId,Name:$name,Balance:$_balance";
  }
    
}

class Bank {
  String name;
  List<BankAccount> _account;

  List<BankAccount> get account => _account;

  Bank({required this.name}) : _account = []; 

  
 BankAccount createAccount(int accountId, String accountOwner) {
    
    for (var account in _account) {
      if (account.accId == accountId) {
        throw Exception("Account with ID $accountId already exists!");
      }
    }

   
    var newAccount = BankAccount(0, accountOwner, accountId);
    _account.add(newAccount); 
    return newAccount;
  }
  

    
}
 
void main() {


  

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  // try {
  //   myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Account with ID 100 already exists!
  // }
}
