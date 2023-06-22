import 'package:flutter/material.dart';
import 'dart:async';

import '../components/fading_text.dart';
import '../services/function_status.dart';
import '../utils/chrome_api_handler.dart';
import '../widgets/app_bar.dart';
import '../models/function_status.dart';

class MiniWindow extends StatefulWidget {
  const MiniWindow({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MiniWindow> createState() => _MiniWindowState();
}

class _MiniWindowState extends State<MiniWindow> {
  bool isEnableExtensionStatus = false;
  late FunctionStatus functionStatus;
  late StreamSubscription<bool> clockIsValidSubscription;
  late StreamSubscription<bool> informationIsValidSubscription;

  @override
  Future<void> initState() async {
    super.initState();
    functionStatus = FunctionStatus();
    functionStatus.isEnableExtension = await fetchIsEnableExtension();

    if (functionStatus.isEnableExtension) {
      functionStatus.clockIsValid = await fetchSavedData('clock');
      functionStatus.informationIsValid = await fetchSavedData('information');

      clockIsValidSubscription =
          functionStatus.clockIsValidStream.listen((value) async {
        await registerData('clock', functionStatus.clockIsValid.toString());
      });

      informationIsValidSubscription =
          functionStatus.informationIsValidStream.listen((value) async {
        await registerData(
            'information', functionStatus.informationIsValid.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(widget.title),
      body: Center(
        child: StreamBuilder<bool>(
          stream: functionStatus.isEnableExtensionStream,
          initialData: functionStatus.isEnableExtension,
          builder: (context, snapshot) {
            if (snapshot.data ?? false) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<bool>(
                    stream: functionStatus.clockIsValidStream,
                    initialData: functionStatus.clockIsValid,
                    builder: (context, snapshot) {
                      return SwitchListTile(
                        title: const Text('Clock'),
                        secondary: const Icon(Icons.access_time_outlined),
                        onChanged: (bool value) {
                          functionStatus.clockIsValid = value;
                        },
                        value: snapshot.data ?? false,
                      );
                    },
                  ),
                  StreamBuilder<bool>(
                    stream: functionStatus.informationIsValidStream,
                    initialData: functionStatus.informationIsValid,
                    builder: (context, snapshot) {
                      return SwitchListTile(
                        title: const Text('Information'),
                        secondary: const Icon(Icons.info_outline),
                        onChanged: (bool value) {
                          functionStatus.informationIsValid = value;
                        },
                        value: snapshot.data ?? false,
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: FloatingActionButton.extended(
                      onPressed: () => {
                        reloadTab(),
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reload'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      showLicensePage(context: context),
                    },
                    child: const Text('License'),
                  ),
                ],
              );
            }
            return const FadingText('This extension works only on YouTube');
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    clockIsValidSubscription.cancel();
    informationIsValidSubscription.cancel();
    functionStatus.dispose();
    super.dispose();
  }
}
