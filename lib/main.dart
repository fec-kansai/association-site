import 'package:associate_site/components/footer_section.dart';
import 'package:associate_site/components/text_link_button.dart';
import 'package:associate_site/components/title_section.dart';
import 'package:associate_site/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/link.dart';

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
                      Text(i.text, style: TextStyle(color: Colors.grey[500])),
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
                          : i.label == '特定商取引法に基づく表記'
                          ? (tokusho
                              .map(
                                (t) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.label,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      t.text,
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    const Gap(24),
                                  ],
                                ),
                              )
                              .toList())
                          : [const SizedBox()],
                      ...i.label == '目的等'
                          ? purposes
                              .map(
                                (p) => Text(
                                  p,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                              )
                              .toList()
                          : [const SizedBox()],
                    ],
                  );
                }).toList(),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildDocumentsCard(context)),
                          const SizedBox(width: 24),
                          Expanded(child: _buildCommunityCard()),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _buildDocumentsCard(context),
                          const SizedBox(height: 24),
                          _buildCommunityCard(),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 60),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentsCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.description, color: Colors.blue.shade500),
                const SizedBox(width: 12),
                const Text(
                  'ドキュメント',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '日本語で書かれた以下のドキュメントをご覧いただけます。',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 2),
            ...policies.map((policy) {
              return _buildDocumentLink(context, policy[1], policy[0]);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentLink(BuildContext context, String url, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child:
          url != ''
              ? Link(
                uri: Uri.parse(url),
                target: LinkTarget.blank,
                builder:
                    (context, followLink) => IconButton(
                      tooltip: title,
                      onPressed: followLink,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Colors.blue.shade300,
                          ),
                        ],
                      ),
                    ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: Text(
                  '$title (WIP)',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
    );
  }

  Widget _buildCommunityCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.people, color: Colors.blue.shade500),
                const SizedBox(width: 12),
                const Text(
                  'コミュニティに参加する',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'フロントエンドカンファレンス関西のコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。なお、フロントエンドカンファレンス関西については、一般社団法人関西開発者会議の協力をもって開催されます。',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 18),
            _buildSocialLink(
              icon: Icons.flutter_dash,
              title: 'X',
              subtitle: '@fec_kansaiをフォロー',
              url: 'https://x.com/fec_kansai',
            ),
            const SizedBox(height: 18),
            _buildSocialLink(
              icon: Icons.code,
              title: 'GitHub',
              subtitle: 'fec-kansaiリポジトリに貢献する',
              url: 'https://github.com/fec-kansai',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLink({
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
  }) {
    return Link(
      uri: Uri.parse(url),
      target: LinkTarget.blank,
      builder:
          (context, followLink) => IconButton(
            tooltip: title,
            onPressed: followLink,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: Colors.blue.shade700),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
