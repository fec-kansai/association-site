import 'package:associate_site/components/footer_section.dart';
import 'package:associate_site/components/text_link_button.dart';
import 'package:associate_site/components/title_section.dart';
import 'package:associate_site/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(234, 228, 202, 1),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      // showSemanticsDebugger: true,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(234, 228, 202, 0.6),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Gap(32),
                const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/k3_icon.png'),
                ),
                ...info.map((i) {
                  return TitleSection(
                    name: i.label,
                    children: [
                      Text(
                        i.text,
                        semanticsLabel: i.text,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      (i.label == '法人の公告方法' ||
                              i.label == '目的等' ||
                              i.label == 'ポリシー類')
                          ? const Gap(32)
                          : const SizedBox(),
                      ...i.label == '法人の公告方法'
                          ? notices
                              .map(
                                (n) => Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          n[0],
                                          semanticsLabel: n[0],
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        TextLinkButton(
                                          name: 'PDF を開く',
                                          href: n[1],
                                        ),
                                      ],
                                    ),
                                    const Gap(8),
                                  ],
                                ),
                              )
                              .toList()
                          : [const SizedBox()],
                      ...i.label == '目的等'
                          ? purposes
                              .map(
                                (p) => Text(
                                  p,
                                  semanticsLabel: p,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                              )
                              .toList()
                          : [const SizedBox()],
                    ],
                  );
                }).toList(),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
