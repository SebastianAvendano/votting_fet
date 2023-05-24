//#region user rol
const keyAdminRol = 'admin';
const keyUserRol = 'user';
//endregion

//#region bucket files
const String keyPathBucketFilesInstructions = 'instruction';
const String keyPathBucketFilesPets = 'pets';
const String keyPathBucketFilesMaintenances = 'maintenances';
const String keyPathBucketFilesReservations = 'reservations';
const String keyPathBucketImagesUsers = 'users';
//endregion

//#region status maintenance
const int keyMaintenancePending = 0;
const int keyMaintenanceApproved = 1;
const int keyMaintenanceRejected = 2;
const int keyMaintenanceFinalized = 3;
//endregion

//#region status reservation
const pendingStatus = 0;
const acceptedStatus = 1;
const canceledStatus = 2;
const finishedStatus = 3;
//endregion
