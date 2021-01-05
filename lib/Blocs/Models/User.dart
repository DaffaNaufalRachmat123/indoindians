class User {
  final int id;
  final int group_id;
  final String created_at;
  final String updated_at;
  final String created_in;
  final String email;
  final String firstname;
  final String lastname;
  final int store_id;
  final int website_id;
  final int disable_auto_group_change;
  final String token;
  final bool isRemember;
  User({
    this.id,
    this.group_id,
    this.created_at,
    this.updated_at,
    this.created_in,
    this.email,
    this.firstname,
    this.lastname,
    this.store_id,
    this.website_id,
    this.disable_auto_group_change,
    this.token,
    this.isRemember
  });
  factory User.fromJson(Map<String , dynamic> json){
    return User(
      id : json['id'] as int,
      group_id : json['id'] as int,
      created_at : json['created_at'] as String,
      updated_at : json['updated_at'] as String,
      created_in : json['created_in'] as String,
      email : json['email'] as String,
      firstname : json['firstname'] as String,
      lastname : json['lastname'] as String,
      store_id : json['store_id'] as int,
      website_id : json['website_id'] as int,
      disable_auto_group_change: json['disable_auto_group_change'] as int
    );
  }
  Map<String , dynamic> toJsonSave() => {
    "id" : id,
    "group_id" : group_id,
    "created_at" : created_at,
    "updated_at" : updated_at,
    "created_in" : created_in,
    "email" : email,
    "firstname" : firstname,
    "lastname" : lastname,
    "store_id" : store_id,
    "website_id" : website_id,
    "disable_auto_group_change" : disable_auto_group_change,
    "token" : token,
    "is_remember" : isRemember
  };
}