
class ServerEndpoints {
  static const String serverEndpoint = "http://ec2-43-201-77-177.ap-northeast-2.compute.amazonaws.com:8000";
}

class API {
  static const String sendphone = "${ServerEndpoints.serverEndpoint}/auth/signup/phonenumber";
  static const String getmessages = "${ServerEndpoints.serverEndpoint}/messages";
  static const String reply = "${ServerEndpoints.serverEndpoint}/reply";
  static const String signup = "${ServerEndpoints.serverEndpoint}/users";
  static const String login = "${ServerEndpoints.serverEndpoint}/login";
  static const String ME = "${ServerEndpoints.serverEndpoint}/login/test";
}