part of 'main.dart';

const _envFileName = ".env";
const _tokenType = "Bearer";
const _tokenEnv = 'TMB_ACCESS_TOKEN';
const _tokenFailedMsg = "token wasn't found";

Future<ApiDecorator> createApi() async {
  await dotenv.load(fileName: _envFileName);

  final rawToken = dotenv.env[_tokenEnv];
  if (rawToken == null || rawToken.isEmpty) throw StateError(_tokenFailedMsg);

  return ApiDecorator(ApiMapper(), "$_tokenType $rawToken");
}