abstract class LoginStrategy {
  
  void login(String username, String password);
}

class GoogleLoginStrategy implements LoginStrategy {
  @override
  void login(String username, String password) {
    // Implement Google login logic here
    print('Logging in with Google: $username');
  }
}


class FacebookLoginStrategy implements LoginStrategy {
  @override
  void login(String username, String password) {
    // Implement Facebook login logic here
    print('Logging in with Facebook: $username');
  }
}

class EmailLoginStrategy implements LoginStrategy {
  @override
  void login(String username, String password) {
    // Implement Email login logic here
    print('Logging in with Email: $username');
  }
}


class Login {
  late LoginStrategy _strategy;

  void setStrategy(LoginStrategy strategy) {
    _strategy = strategy;
  }

  void login(String username, String password) {
    _strategy.login(username, password);
  }
}


 enum LoginType { google, facebook, email }
void main() {
  final login = Login();

  // Using Google login strategy
 
  
  // Simulating user selection (in real app, this could come from UI)
  LoginType selectedType = LoginType.facebook;
  
  final strategies = {
    LoginType.google: GoogleLoginStrategy(),
    LoginType.facebook: FacebookLoginStrategy(),
    LoginType.email: EmailLoginStrategy(),
  };
  login.setStrategy(strategies[selectedType]!);
  login.login('','');

}