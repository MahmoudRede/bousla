
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


