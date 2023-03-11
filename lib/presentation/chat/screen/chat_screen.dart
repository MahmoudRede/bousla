import 'package:bosala/business_logic/App_cubit/app_cubit.dart';
import 'package:bosala/business_logic/App_cubit/app_states.dart';
import 'package:bosala/data/model/user_model.dart';
import 'package:bosala/presentation/chat/model/message_model.dart';
import 'package:bosala/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final UserModel receiverModel;
  const ChatScreen({Key? key, required this.receiverModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppCubit.get(context)..getMessages(
          receiverId: receiverModel!.uId!,
        );
        return BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit = AppCubit.get(context);

            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: ColorManager.primaryColor,
                ),
                elevation: 0.0,
                backgroundColor: ColorManager.primaryColor,

                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('${receiverModel.image}'),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '${receiverModel.name}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context , index){
                        var message = cubit.messages[index];

                        if(cubit.userModel!.uId == message.senderId)
                          return myMessageItem(message);
                        else
                          return messageItem(message);
                      },
                      separatorBuilder: (context , index) => const SizedBox(
                        height: 1.0,
                      ),
                      itemCount: cubit.messages.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Type a message here....',
                                border: InputBorder.none,
                              ),
                              controller: cubit.messageController,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            cubit.sendMessage(
                              receiverId: receiverModel.uId!,
                              dateTime: DateTime.now().toString(),
                              message: cubit.messageController.text,
                            );
                            cubit.messageController.text = '';
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: ColorManager.textColor,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    );

  }


  Widget messageItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              bottomEnd: Radius.circular(10.0),
            ),
          ),
          child: Text(
            model.message,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget myMessageItem(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
          decoration: const BoxDecoration(
            color: ColorManager.textColor,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              bottomStart: Radius.circular(10.0),
            ),
          ),
          child: Text(
            model.message,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }





}