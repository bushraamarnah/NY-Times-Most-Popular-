class MediaMetaData {
  String url;
  String format;
  int height;
  int width;

  MediaMetaData({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  factory MediaMetaData.fromJson(Map<String, dynamic> json) => MediaMetaData(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
      };
}
