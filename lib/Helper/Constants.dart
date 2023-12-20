class Constants {
  static const baseUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/";
  static const section = "all-sections";
  static const period = "7";
  static const key = "9JxAhc9AIbGmxmDvBehrO68mYKSd47Qj";
  //static const getAllData = "$baseUrl+$section/$period.json?api-key=$key";
  static const getAllData =
      baseUrl + "all-sections/30.json?api-key=9JxAhc9AIbGmxmDvBehrO68mYKSd47Qj";
}
