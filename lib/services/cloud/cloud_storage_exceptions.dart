import 'package:flutter/foundation.dart';

@immutable
class CloudStroageException implements Exception {
  const CloudStroageException();
}
class CouldNotCreateNoteException extends CloudStroageException {}
class CouldNotGetAllNotesException extends CloudStroageException {}
class CouldNotUpdateNoteException extends CloudStroageException {}
class CouldNotDeleteNoteException extends CloudStroageException {}