class MessageModel {
  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
    required this.message,
  });

  final String senderId;
  final String receiverId;
  final String dateTime;
  final String message;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    senderId: json["senderId"]??"",
    receiverId: json["receiverId"]??"",
    dateTime: json["dateTime"]??"",
    message: json["message"]??"",
  );

  Map<String, dynamic> toMap() => {
    "senderId": senderId,
    "receiverId": receiverId,
    "dateTime": dateTime,
    "message": message,
  };
}