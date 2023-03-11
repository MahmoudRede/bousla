
 abstract class AppStates{

 }

 class InitialStates extends AppStates{}

 class UserLoginLoadingStates extends AppStates{}
 class UserLoginSuccessStates extends AppStates{
   String ?uId;

   UserLoginSuccessStates(uId);

 }
 class UserLoginErrorStates extends AppStates{}

 class UserRegisterLoadingStates extends AppStates{}
 class UserRegisterSuccessStates extends AppStates{}
 class UserRegisterErrorStates extends AppStates{}

 class SaveUserLoadingStates extends AppStates{}
 class SaveUserSuccessStates extends AppStates{}
 class SaveUserErrorStates extends AppStates{}

 class GetUserLoadingStates extends AppStates{}
 class GetUserSuccessStates extends AppStates{}
 class GetUserErrorStates extends AppStates{}

 class UploadProfileImageSuccessState extends AppStates{}
 class UploadProfileImageLoadingState extends AppStates{}
 class UploadProfileImageErrorState extends AppStates{}

 class PickProfileImageErrorState extends AppStates{}
 class PickProfileImageSuccessState extends AppStates{}

 class UploadProductImageSuccessState extends AppStates{}
 class UploadProductImageLoadingState extends AppStates{}
 class UploadProductImageErrorState extends AppStates{}

 class PickProductImageErrorState extends AppStates{}
 class PickProductImageSuccessState extends AppStates{}

 class AddProductLoadingStates extends AppStates{}
 class AddProductSuccessStates extends AppStates{}
 class AddProductErrorStates extends AppStates{}

 class GetProductLoadingStates extends AppStates{}
 class GetProductSuccessStates extends AppStates{}
 class GetProductErrorStates extends AppStates{}


 class CreateTableState  extends AppStates{}
 class CreateDatabaseSuccessState  extends AppStates{}
 class CreateDatabaseErrorState  extends AppStates{}
 class InsertDatabaseSuccessState  extends AppStates{}
 class InsertDatabaseErrorState  extends AppStates{}
 class GetDatabaseSuccessState  extends AppStates{}
 class GetDatabaseErrorState  extends AppStates{}

 class UpdateDatabaseSuccessState  extends AppStates{}

 class UpdateFavoriteSuccessState  extends AppStates{}

 class DeleteDatabaseSuccessState  extends AppStates{}


 class GetAllUserLoadingStates extends AppStates{}
 class GetAllUserSuccessStates extends AppStates{}
 class GetAllUserErrorStates extends AppStates{}


 class SendMessageSuccessState extends AppStates{}
 class SendMessageErrorState extends AppStates{}

 class GetMessagesSuccessState extends AppStates{}
 class GetMessagesErrorState extends AppStates{}


