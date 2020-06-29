class BaseResponse<T> {
  Status status;
  String message;
  T data;

 BaseResponse({this.status, this.message, this.data});

  BaseResponse.loading({this.message}) : status = Status.LOADING;
  BaseResponse.completed({this.data, this.message}) : status = Status.COMPLETED;
  BaseResponse.error({this.message,this.data}) : status = Status.ERROR;


}

enum Status { LOADING, COMPLETED, ERROR }