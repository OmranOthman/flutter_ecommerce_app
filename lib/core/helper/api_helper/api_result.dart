class ApiResult<DataResponse, ErrorResponse> {
  final DataResponse? dataResponse;
  final ErrorResponse? errorResponse;
  ApiResult({this.dataResponse, this.errorResponse});

  ApiResult.withError(ErrorResponse errorResponse)
      : this(dataResponse: null, errorResponse: errorResponse);

  ApiResult.withSuccess(DataResponse dataResponse)
      : this(dataResponse: dataResponse, errorResponse: null);
}
