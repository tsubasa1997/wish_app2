import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:wish_list_app_mk2/ui/widgets/add_item.dart';
import 'package:wish_list_app_mk2/ui/widgets/item_card.dart';
import 'package:wish_list_app_mk2/ui/widgets/item_dialog.dart';
import 'package:wish_list_app_mk2/ui/widgets/select_item_screen.dart';
import 'package:wish_list_app_mk2/ui/widgets/text_field_input.dart';


import '../controllers/auth_controller.dart';
import '../providers/auth_provider.dart';
import '../providers/user_items_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late StreamSubscription _intentDataStreamSubscription;
  String? _sharedText;

  @override
  void initState() {
    super.initState();

    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
          setState(() {
            _sharedText = value;
          });
        }, onError: (err) {
          print("getLinkStream error: $err");
        });

    ReceiveSharingIntent.getInitialText().then((String? value) {
      setState(() {
        _sharedText = value;
      });
    });
  }


  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authUserProvider);
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return uid.when(
      data: (uid) {
        if (uid != null) {
          final items = ref.watch(userItemsProvider(uid));

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: ((_) {
                        return AlertDialog(
                          title: const Text('ログアウトしますか？'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                ref.read(authProvider).signOut();
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      }),
                    );
                  },
                  icon: const Icon(Icons.logout)),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return SelectItemScreen(uid: uid);
                        }),
                      );
                    },
                    child: const Text(
                      '選択',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return AddItem(uid: uid, url: _sharedText ?? 'URL:',);
                }));
              },
            ),
            body: items.when(
              data: (user) {
                int totalPrice = user.items.isNotEmpty ? user.items.map((e) => e.price).reduce((value, element) => value + element) : 0;
                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: user.items.length,
                          itemBuilder: (context, index) {
                            return ItemCard(
                              item: user.items[index],
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: ((_) {
                                    return ItemDialog(
                                      item: user.items[index],
                                      uid: uid,
                                    );
                                  }),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.2,
                        child: Column(
                          children: [
                            const Text(
                              '合計金額',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '$totalPrice円',
                              style: const TextStyle(fontSize: 40, color: Colors.orange),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (e, _) => const Text('e'),
              loading: () => const CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Log In'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: double.infinity,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: deviceHeight * 0.2,
                        ),
                        TextFieldInput(
                          hintText: 'Enter your e-mail',
                          textEditingController: _emailController,
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFieldInput(
                          hintText: 'Enter your password',
                          textEditingController: _passwordController,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(authProvider).signIn(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                          },
                          child: Container(
                            width: 250,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              color: Colors.blue,
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
      error: (e, _) => const Text('e'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
