class UserData {
  final String username;
  final String password;

  UserData({required this.username, required this.password});
}

class AuthService {
  static final List<UserData> users = [
    UserData(username: 'gaby', password: '1234'),
  ];

  static bool login(String username, String password) {
    for (UserData user in users) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    return false;
  }
}
