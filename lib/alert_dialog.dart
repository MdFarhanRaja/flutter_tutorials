import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  State<AlertDialogDemo> createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scafoldKey,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  scafoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  size: 34,
                )),
            title: const Text("Drawer Menu")),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: SafeArea(
              child: Column(
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                          'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                          height: 128,
                          width: 128,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            return child;
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                                height: 128, width: 128, child: Placeholder());
                          },
                        )),
                    Text(
                      "Md Farhan Raja\nemaild@gmail.com",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          scafoldKey.currentState?.closeDrawer();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 34,
                        ))),
              ]),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Show Alert Dialog"),
                    onTap: () {
                      showAlertDialog();
                      scafoldKey.currentState?.closeDrawer();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Show Bottomsheet Dialog"),
                    onTap: () {
                      showBottomSheetDialog();
                      scafoldKey.currentState?.closeDrawer();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add User"),
                    onTap: () {},
                  ),
                ],
              ))),
              Text('App Version: 1.0.0')
            ],
          )),
        ),
        body: const Center(child: Text('Nav Drawer Demo')));
  }

  void showAlertDialog() async {
    final result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                // debugPrint("$didPop");
              },
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                contentPadding: EdgeInsets.zero,
                title: const Text('Dialog Title', textAlign: TextAlign.center),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'Are you sure, you want to logout? Are you sure, you want to logout? Are you sure, you want to logout? Are you sure, you want to logout?',
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    height: 2,
                    color: Colors.amber,
                  ),
                  IntrinsicHeight(
                      child: Row(children: [
                    Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.pop(context, 'YES');
                            },
                            child: const Text('YES'))),
                    Container(
                      color: Colors.amber,
                      width: 2,
                    ),
                    Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.pop(context, 'NO');
                            },
                            child: const Text('NO')))
                  ]))
                ]),
              ));
        });
    debugPrint("Result from Dialog:> $result");
    if (result == 'YES') {}
  }

  void showBottomSheetDialog() async {
    final result = await showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: PopScope(
                canPop: false,
                child: DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  minChildSize: 0.2,
                  maxChildSize: 0.9,
                  expand: false,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                        controller: scrollController,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Dialog Title',
                                textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text('Enter Name', textAlign: TextAlign.center),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: [
                              Expanded(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          backgroundColor: Colors.green,
                                          padding: EdgeInsets.zero),
                                      onPressed: () {
                                        Navigator.pop(context, 'YES');
                                      },
                                      child: const Text('YES'))),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          padding: EdgeInsets.zero),
                                      onPressed: () {
                                        Navigator.pop(context, 'NO');
                                      },
                                      child: const Text('NO')))
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]));
                  },
                )));
      },
    );

    debugPrint("Result from Dialog:> $result");
    if (result == 'YES') {}
  }
}
