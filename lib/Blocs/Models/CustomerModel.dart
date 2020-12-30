class Customer {
  final String email;
  final String firstname;
  final String lastname;
  Customer({
    this.email,
    this.firstname,
    this.lastname
  });
}

class CustomerModel {
  final Customer customer;
  final String username;
  final String password;
  CustomerModel({
    this.customer,
    this.username,
    this.password
  });
  Map<String , dynamic> toJsonRegister() => {
    "customer" : {
      "email" : customer.email,
      "firstname" : customer.firstname,
      "lastname" : customer.lastname
    },
    "password" : password
  };
  Map<String , dynamic> toJsonLogin() => {
    "username" : username,
    "password" : password
  };
}