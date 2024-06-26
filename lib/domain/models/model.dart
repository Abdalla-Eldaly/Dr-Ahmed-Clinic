class Customer{
  String id;

  String name;

  int numberOfNotification;

  Customer(this.name, this.id, this.numberOfNotification);
}

class Contact{
  String phone;

  String email;


  Contact(this.phone, this.email);
}


class Authentication{
  Customer? customer;

  Contact? contacts;

  Authentication(this.customer, this.contacts);
}