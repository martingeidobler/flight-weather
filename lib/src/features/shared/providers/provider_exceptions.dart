///location exceptions
// Turned off by user
class LocationTurnedOffException implements Exception {

}
// Can't be reached
class LocationUnavailableException implements Exception{

}
// Permission denied, ask user again
class LocationPermissionDeniedException implements Exception {

}
// Permission permanently denied, prompt user to go to settings
class LocationPermissionDeniedForeverException implements Exception {

}
// User has not given the correct type of permission
class WrongLocationPermissionGivenException implements Exception {

}
///