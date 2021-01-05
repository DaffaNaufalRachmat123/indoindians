class ChangePwd {
  final String curPassword;
  final String newPassword;
  ChangePwd({
    this.curPassword,
    this.newPassword
  });
  Map<String , dynamic> toJsonChange() => {
    "currentPassword" : curPassword,
    "newPassword" : newPassword
  };
}