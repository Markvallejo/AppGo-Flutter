import 'package:appgo/Service/Api_Service.dart';
import 'package:appgo/user/model/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  Service api = new Service();
  LoginScreenPresenter(this._view);

  // doLogin(String username, String password, String concessionare) {
  //   api.login(username, password, concessionare).then((User user) {
  //     _view.onLoginSuccess(user);
  //   }).catchError((Exception error) => _view.onLoginError(error.toString()));
  // }
}
