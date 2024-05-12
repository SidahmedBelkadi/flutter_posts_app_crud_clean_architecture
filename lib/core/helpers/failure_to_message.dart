import '../constants/messages.dart';
import '../error/failure.dart';

abstract class FailureToMessage {
  static String convert({required Failure failure}) {
    if (failure is ServerFailure) {
      return AppMessages.serverFailureMessage;
    } else if (failure is CacheFailure) {
      return AppMessages.cacheFailureMessage;
    } else if (failure is OfflineFailure) {
      return AppMessages.offlineFailureMessage;
    } else {
      return 'Unexpected error has occured, please try again later ...';
    }
  }
}
