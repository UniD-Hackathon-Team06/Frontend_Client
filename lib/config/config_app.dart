
class ServerEndpoints {
  static const String serverEndpoint = "http://ec2-43-201-77-177.ap-northeast-2.compute.amazonaws.com:8000";
}

class API {
  static const String sendphone = "${ServerEndpoints.serverEndpoint}/auth/signup/phonenumber";
  static const String checkphone = "${ServerEndpoints.serverEndpoint}/auth/check/phone";
  static const String checkemail = "${ServerEndpoints.serverEndpoint}/auth/check/email";
  static const String signup = "${ServerEndpoints.serverEndpoint}/users";
  static const String login = "${ServerEndpoints.serverEndpoint}/login";
}