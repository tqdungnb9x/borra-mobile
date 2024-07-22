part of '../rest_api.dart';

class Api {
  Dio get _dio => _initDio();
  Dio _initDio() {
    final Dio dio = Dio();

    final env = AppConfig.instance.env;
    final accessToken =
        AppPreferences.instance.get<String>(AppPreferenceKey.accessToken);

    dio
      ..options.baseUrl = env.baseUrl
      ..options.connectTimeout = Duration(milliseconds: env.connectionTimeout)
      ..options.receiveTimeout = Duration(milliseconds: env.receiveTimeout)
      ..options.headers = accessToken != null
          ? {
              'Content-Type': 'application/json; charset=utf-8',
              'accept': 'application/json',
              'Referer': env.siteUrl,
              'Origin': env.siteUrl,
              'authorization':
                  "Bearer ${AppPreferences.instance.get<String>(AppPreferenceKey.accessToken)}"
            }
          : {
              'accept': 'application/json',
              'Content-Type': 'application/json; charset=utf-8',
              'Referer': env.siteUrl,
              'Origin': env.siteUrl,
            }
      // ..interceptors.add(
      //   PrettyDioLogger(
      //     request: true,
      //     requestBody: true,
      //     responseBody: true,
      //     requestHeader: true,
      //     responseHeader: false,
      //     error: true,
      //   ),
      // )
      ..interceptors.add(JWTInterceptor());
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );

    return dio;
  }

  Future<BaseResponse> get<T>(
    String endpoint, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data is Map && (response.data as Map).length == 1) {
        return BaseResponse.fromJson(response.data,
            codeSuccess: response.statusCode!);
      }
      return BaseResponse.success(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        //Check status code if status code is 401, access token expired.
        //Call API refresh token to get a new access token.
        //And then, call previous API again.
        if (e.response!.statusCode == 401) {
          final resRefresh = await refreshToken();
          if (resRefresh.success) {
            return get(
              endpoint,
              query: query,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            );
          } else {
            return BaseResponse.error(resRefresh.message);
          }
        }
        return BaseResponse.error(e.response!.statusMessage,
            code: e.response!.statusCode!);
      } else {
        return BaseResponse.error(e.message);
      }
    }
  }

  Future<BaseResponse> getWithRetry<T>(
    String endpoint, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = _initDio();

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // specify log function (optional)
        retries: 3,
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 5), // wait 3 sec before third retry
        ],
      ),
    );

    try {
      final response = await dio.get(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data is Map && (response.data as Map).length == 1) {
        return BaseResponse.fromJson(response.data,
            codeSuccess: response.statusCode!);
      }
      return BaseResponse.success(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          final resRefresh = await refreshToken();
          if (resRefresh.success) {
            return getWithRetry(
              endpoint,
              query: query,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            );
          } else {
            return BaseResponse.error(resRefresh.message);
          }
        }
        return BaseResponse.error(e.response!.statusMessage,
            code: e.response!.statusCode!);
      } else {
        return BaseResponse.error(e.message);
      }
    }
  }

  Future<BaseResponse> post<T>(
    String endpoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.data is Map && (response.data as Map).length == 1) {
        return BaseResponse.fromJson(response.data,
            codeSuccess: response.statusCode!);
      }
      return BaseResponse.success(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        //Check status code if status code is 401, access token expired.
        //Call API refresh token to get a new access token.
        //And then, call previous API again.
        if (e.response!.statusCode == 401) {
          final resRefresh = await refreshToken();
          if (resRefresh.success) {
            return post(
              endpoint,
              query: query,
              data: data,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            );
          } else {
            return BaseResponse.error(resRefresh.message);
          }
        }
        if (e.response!.statusCode == 402) {
          return BaseResponse.error(e.response!.statusMessage, code: 402);
        }
        return BaseResponse.error(e.response!.statusMessage,
            code: e.response!.statusCode!);
      } else {
        return BaseResponse.error(e.response!.statusMessage,
            code: e.response!.statusCode!);
      }
    }
  }

  Future<BaseResponse> put<T>(
    String endpoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return BaseResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        //Check status code if status code is 401, access token expired.
        //Call API refresh token to get a new access token.
        //And then, call previous API again.
        if (e.response!.statusCode == 401) {
          final resRefresh = await refreshToken();
          if (resRefresh.success) {
            return put(
              endpoint,
              query: query,
              data: data,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
            );
          } else {
            return BaseResponse.error(resRefresh.message);
          }
        }
        if (jsonDecode(e.response!.toString())["message"] != null) {
          return BaseResponse.error(
              jsonDecode(e.response!.toString())["message"].toString());
        }
        return BaseResponse.error(e.response!.statusMessage);
      } else {
        return BaseResponse.error(e.message);
      }
    }
  }

  Future<BaseResponse> delete<T>(
    String endpoint, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return BaseResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        //Check status code if status code is 401, access token expired.
        //Call API refresh token to get a new access token.
        //And then, call previous API again.
        if (e.response!.statusCode == 401) {
          final resRefresh = await refreshToken();
          if (resRefresh.success) {
            return delete(
              endpoint,
              query: query,
              options: options,
              cancelToken: cancelToken,
            );
          } else {
            return BaseResponse.error(resRefresh.message);
          }
        }
        return BaseResponse.error(e.response!.statusMessage);
      } else {
        return BaseResponse.error(e.message);
      }
    }
  }

  Future<BaseResponse> requestApi<T>(
      Future<Response<T>> Function() apiCall) async {
    try {
      final res = await apiCall();
      if (res.statusCode == HttpStatus.ok ||
          res.statusCode == HttpStatus.created ||
          res.statusCode == HttpStatus.accepted) {
        var dataResponse;
        //Trick to parse the data response.
        switch (T) {
          default:
            dataResponse = res.data;
            break;
        }
        var baseResponse = BaseResponse.fromJson(dataResponse);
        if (baseResponse.success) {
          return baseResponse;
        } else {
          return BaseResponse.error(baseResponse.message);
        }
      } else {
        return BaseResponse.error(res.statusMessage);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        //Check status code if status code is 401, access token expired.
        //Call API refresh token to get a new access token.
        //And then, call previous API again.
        if (e.response!.statusCode == 401) {
          final resRefresh = await refreshToken();
          if (resRefresh.success) {
            return requestApi<T>(() => apiCall());
          } else {
            return BaseResponse.error(resRefresh.message);
          }
        }
        return BaseResponse.error(e.response!.statusMessage);
      } else {
        return BaseResponse.error(e.message);
      }
    }
  }

  Future<BaseResponse<bool>> refreshToken() async {
    var refToken =
        AppPreferences.instance.get<String>(AppPreferenceKey.refreshToken);
    if (refToken != null) {
      return BaseResponse.success(true);
    }
    return BaseResponse.error("Unknown");
  }
}
