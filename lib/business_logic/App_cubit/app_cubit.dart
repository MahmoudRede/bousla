
 import 'dart:io';
 import 'package:bosala/data/model/product_model.dart';
import 'package:bosala/presentation/chat/model/message_model.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:bosala/widget/toast.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bloc/bloc.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/data/model/user_model.dart';
import 'package:bosala/utiles/local/cash_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  void userLogin({

  required String email,
  required String password,

}){

    emit(UserLoginLoadingStates());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      CashHelper.saveData(key: 'uId',value: value.user!.uid);
      debugPrint('Login Success');
      getUser();
      emit(UserLoginSuccessStates(value.user!.uid));

    }).catchError((error){

      debugPrint('Error in User Login is:${error.toString()}');
      emit(UserLoginErrorStates());

    });

  }

  void userRegister({

    required String email,
    required String password,
    required String name,
    required String phone,

  }){

    emit(UserRegisterLoadingStates());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      saveUser(
          name: name,
          email: email,
          uId:value.user!.uid ,
          phone:phone
      );

      debugPrint('Register Success');
      emit(UserRegisterSuccessStates());

    }).catchError((error){

      debugPrint('Error in User Register is:${error.toString()}');
      emit(UserRegisterErrorStates());

    });

  }


  void saveUser({

    required String email,
    required String uId,
    required String phone,
    required String name,

  }){

    emit(SaveUserLoadingStates());

    UserModel userModel=UserModel(
        name: name,
        image: 'https://firebasestorage.googleapis.com/v0/b/bosla-app.appspot.com/o/27470334_7309681.jpg?alt=media&token=df0c6933-f978-4c3d-bdd4-ce79d67e14a1',
        phoneNumber: phone,
        email: email,
        uId: uId
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {

          debugPrint('Register Success');
          emit(UserRegisterSuccessStates());

    }).catchError((error){

      debugPrint('Error in User Register is:${error.toString()}');
      emit(UserRegisterErrorStates());

    });

  }


  UserModel ?userModel;

  void getUser(){

    emit(GetUserLoadingStates());

    FirebaseFirestore.instance
        .collection('Users')
        .doc(CashHelper.getData(key: 'uId'))
        .get()
        .then((value) {

          debugPrint('Get User Success');
          userModel =UserModel.fromFire(value.data()!);
          debugPrint(userModel!.name);
          emit(GetUserSuccessStates());

    }).catchError((error){

      debugPrint('Error in Get User is:${error.toString()}');
      emit(GetUserErrorStates());

    });

  }


  // upload user image

  File? profileImage;

  ImageProvider profile = const AssetImage('assets/images/user.png');

  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      profile = FileImage(profileImage!);
      debugPrint('Path is ${pickedFile.path}');
      emit(PickProfileImageSuccessState());
    } else {
      debugPrint('No Image selected.');
      emit(PickProfileImageErrorState());
    }

  }


  String ?profilePath;

  Future uploadUserImage(){

    emit(UploadProfileImageLoadingState());
    return firebase_storage.FirebaseStorage.instance.ref()
        .child('usersImage/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!).then((value) {

      value.ref.getDownloadURL().then((value) {

        debugPrint('Upload Success');
        profilePath = value;

        FirebaseFirestore.instance.collection('Users').doc(CashHelper.getData(key: 'uId')).update({
          'image':'$profilePath'
        }).then((value) {

          debugPrint('Image Updates');
        });

        getUser();
        emit(UploadProfileImageSuccessState());

      }).catchError((error){

        debugPrint('Error in Upload profileImage ${error.toString()}');
        emit(UploadProfileImageErrorState());

      });

    }).catchError((error){

      debugPrint('Error in Upload profileImage ${error.toString()}');
      emit(UploadProfileImageErrorState());
    });
  }


  // upload product image

  File? productImage;

  ImageProvider product = const AssetImage('assets/images/recycle1.png');

  var picker2 = ImagePicker();

  Future<void> getProductImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      product = FileImage(productImage!);
      debugPrint('Path is ${pickedFile.path}');
      emit(PickProductImageSuccessState());
    } else {
      debugPrint('No Image selected.');
      emit(PickProductImageErrorState());
    }

  }


  String ?productPath;

  Future uploadProductImage({
    required String productName,
    required String productPrice,
    required String productDescription,
    required String productCategory,
}){

    emit(UploadProductImageLoadingState());
    return firebase_storage.FirebaseStorage.instance.ref()
        .child('productImages/${Uri.file(productImage!.path).pathSegments.last}')
        .putFile(productImage!).then((value) {

      value.ref.getDownloadURL().then((value) {

        debugPrint('Upload Success');
        productPath = value;

        uploadProduct(
            productName: productName,
            productPrice: productPrice,
            productDescription: productDescription,
            productCategory: productCategory,
            productImage: productPath!
        );

        emit(UploadProductImageSuccessState());

      }).catchError((error){

        debugPrint('Error in Upload profileImage ${error.toString()}');
        emit(UploadProductImageErrorState());

      });

    }).catchError((error){

      debugPrint('Error in Upload profileImage ${error.toString()}');
      emit(UploadProductImageErrorState());
    });
  }

  void uploadProduct({
    required String productName,
    required String productPrice,
    required String productDescription,
    required String productCategory,
    required String productImage,

  }){

    emit(AddProductLoadingStates());

     ProductModel productModel =ProductModel(
         productName: productName,
         productPrice: productPrice,
         productImage: productImage,
         productDescribtion: productDescription,
         productCategory: productCategory
     );

    FirebaseFirestore.instance
        .collection('Products')
        .add(productModel.toMap())
        .then((value) {

          getProduct();

      debugPrint('Add Product Success');
      emit(AddProductSuccessStates());

    }).catchError((error){

      debugPrint('Error in Add Product is:${error.toString()}');
      emit(AddProductErrorStates());

    });

  }



  List<bool> isFavorites= List.generate(30, (index) => false);

  void switchFavorites(int index){

    isFavorites[index] =!isFavorites[index];
    print(isFavorites[index]);
    emit(UserRegisterErrorStates());

  }

  List<ProductModel> allProducts=[];

  void getProduct(){

    allProducts=[];

    emit(GetProductLoadingStates());

    FirebaseFirestore.instance
        .collection('Products')
        .get()
        .then((value) {

          value.docs.forEach((element) {

            allProducts.add(ProductModel.fromFire(element.data()));

          });
      debugPrint('Add Product Success');
      emit(GetProductSuccessStates());

    }).catchError((error){

      debugPrint('Error in Get Product is:${error.toString()}');
      emit(GetProductErrorStates());

    });

  }



  Database ?database;
  List <Map>  allFavorite=[];


  void createDatabase() async {

    return await openDatabase(
        'favorite.db',
        version: 1,
        onCreate: (database,version){
          database.execute(
              'CREATE TABLE favorite (id INTEGER PRIMARY KEY , name TEXT , distance TEXT, image TEXT, favorite TEXT)'
          ).then((value) {
            print('Table Created');
            emit(CreateTableState());
          });
        },
        onOpen: (database){

          getAllFavorite(database).then((value){
            allFavorite=value;
          }).catchError((error){
            print('error i ${error.toString()}');
          });
          print('Database Opened');
        }

    ).then((value) {
      database=value;
      print('Database Created');
      emit(CreateDatabaseSuccessState());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(CreateDatabaseErrorState());

    });
  }

  Future addToFavorite({
    required String name,
    required String distance,
    required String image,
    required context,
  }) async{

    return database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO favorite (name,distance,image,favorite) VALUES ( "$name" , "$distance" , "$image" , "yes")'
      ).then((value) {
        print("${value} Insert Success");
        emit(InsertDatabaseSuccessState());
        getAllFavorite(database).then((value){
          allFavorite=value;
        });
        customToast(title: 'item added to favorite', color: ColorManager.red);
        emit(InsertDatabaseSuccessState());

      }).catchError((error){
        print('Error is ${error.toString()}');
      });

    });

  }


  Future <List<Map>> getAllFavorite(database)async {

    allFavorite=[];


    return await database?.rawQuery(
        'SELECT * FROM favorite'
    ).then((value) {

      value.forEach((element){
        allFavorite.add(element);
      });

      print(allFavorite);
      emit(GetDatabaseSuccessState());
    }).catchError((error){
      print('GetError is ${error.toString()}');
    });
  }


  Future deleteFromFavorite({required String name,required context})async{

    return await database?.rawDelete('DELETE FROM favorite WHERE name = ?', [name]).then((value) {
      debugPrint('Item Deleted');
      customToast(title:'item removed', color: ColorManager.red);
      getAllFavorite(database).then((value) {
        allFavorite=value;
      });
      emit(DeleteDatabaseSuccessState());
    });

  }

  List<UserModel> users = [];

  void getAllUser(){
    emit(GetAllUserLoadingStates());

    FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((value) {
      debugPrint('Get User Success');

      for (var element in value.docs) {
        if(element.id != CashHelper.getData(key: 'uId')){
          users.add(UserModel.fromFire(element.data()));
        }
      }

      debugPrint('All user is : ${users.length}');
      emit(GetAllUserSuccessStates());

    }).catchError((error){

      debugPrint('Error in Get All User is:${error.toString()}');
      emit(GetAllUserErrorStates());

    });
  }


  TextEditingController messageController = TextEditingController();


  void sendMessage({
    required String receiverId ,
    required String dateTime ,
    required String message,
  })
  {
    MessageModel model = MessageModel(
      receiverId: receiverId,
      senderId: userModel!.uId!,
      message: message,
      dateTime: dateTime,
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    })
        .catchError((error){
      emit(SendMessageErrorState());
    });


    FirebaseFirestore.instance
        .collection('Users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error){
      emit(SendMessageErrorState());
    });


  }


  List<MessageModel> messages = [];


  void getMessages ({required String receiverId ,})
  {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }
      emit(GetMessagesSuccessState());
    });
  }

}