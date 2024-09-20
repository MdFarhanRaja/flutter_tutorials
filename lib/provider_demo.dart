import 'dart:developer';
import 'package:basic_widgets/base_class.dart';
import 'package:basic_widgets/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({super.key});

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends BaseClass<ProviderDemo> {
  late CounterProvider counterProvider;

  @override
  void initState() {
    counterProvider = Provider.of<CounterProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Build UI.....');
    return Scaffold(
        appBar: getAppBar(title: 'Provider Demo'),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.small(
                onPressed: () {
                  //context.read<CounterProvider>().add();
                  counterProvider.add();
                },
                child: const Icon(Icons.add)),
            getVerticalGap(),
            FloatingActionButton.small(
                onPressed: () {
                  counterProvider.subtract();
                  //  context.read<CounterProvider>().subtract();
                },
                child: const Icon(Icons.remove)),
            getVerticalGap(),
            FloatingActionButton.small(
                backgroundColor: Colors.amber,
                onPressed: () {
                  counterProvider.addCount2();
                },
                child: const Icon(Icons.add))
          ],
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Count',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            //CountText()
            /* Consumer<CounterProvider>(builder: (context, value, child) {
              log('Count 1 Builder.... Value ${value.count}');
              return Text(value.count.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold));
            }) */

            Selector<CounterProvider, int>(builder: (context, value, child) {
              log('Count 1 Builder.... Value ${value}');
              return Text('$value');
            }, selector: (context, cp) {
              return cp.count;
            }),
            Selector<CounterProvider, int>(
                builder: (context, value, child) => Text(value.toString()),
                selector: (p0, p1) => p1.count2)
          ],
        )));
  }
}

class CountText extends StatelessWidget {
  const CountText({super.key});

  @override
  Widget build(BuildContext context) {
    log('Count Text Build UI.....');
    return Text(
      '${context.watch<CounterProvider>().count}',
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
