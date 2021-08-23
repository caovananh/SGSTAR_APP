class UploadedContent {
  UploadedContent({
    this.contentTitle,
    this.uploadDate,
    this.description,
    this.uploadFile,
  });

  String contentTitle;
  String uploadDate;
  String description;
  String uploadFile;

  factory UploadedContent.fromJson(Map<String, dynamic> json) => UploadedContent(
    contentTitle: json["content_title"],
    uploadDate: json["upload_date"],
    description: json["description"],
    uploadFile: json["upload_file"],
  );

  Map<String, dynamic> toJson() => {
    "content_title": contentTitle,
    "upload_date": uploadDate,
    "description": description,
    "upload_file": uploadFile,
  };
}
class UploadedContentList {
  List<UploadedContent> uploadedContents;

  UploadedContentList(this.uploadedContents);

  factory UploadedContentList.fromJson(List<dynamic> json) {
    List<UploadedContent> uploadedContent = [];

    uploadedContent = json.map((i) => UploadedContent.fromJson(i)).toList();

    return UploadedContentList(uploadedContent);
  }
}
