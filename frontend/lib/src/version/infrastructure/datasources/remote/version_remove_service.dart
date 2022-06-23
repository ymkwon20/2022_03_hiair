abstract class VersionRemoteService {
  Future<String> fetchLatestVersion();
  Future<String> fetchLatestUrl();
}
