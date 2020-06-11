class CommentFormModel{
 final int houseId;
 final String comment;

 CommentFormModel({this.houseId, this.comment});
}

class CommentModel{
   final int houseId;
 final String comment;
 final int userId;

 CommentModel({this.houseId,this.userId, this.comment});
}