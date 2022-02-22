abstract class INavigationService {
  Future<void> navPush({String path, Object object});
  Future<void> navPushRemove({String path, Object object});
}
