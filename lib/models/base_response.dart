class BaseResponse<T> {
  final bool status;
  final String message;
 final Object data; 

 BaseResponse({this.status, this.message, this.data});
}