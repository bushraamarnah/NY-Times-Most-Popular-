import 'MediaMetaData.dart';

class Media {
  String type;
  String subtype;
  String caption;
  String copyright;
  int approvedForSyndication;
  List<MediaMetaData> mediaMetadata;

  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"]!,
        subtype: json["subtype"]!,
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: List<MediaMetaData>.from(
            json["media-metadata"].map((x) => MediaMetaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata":
            List<dynamic>.from(mediaMetadata.map((x) => x.toJson())),
      };
}
