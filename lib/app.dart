import 'dart:io';

import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:markdown/markdown.dart' as md;

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-container', [
      Router(
        routes: [
          Route(
            path: '/',
            builder: (context, state) => const CorporateInfoPage(),
          ),
          Route(
            path: '/code-of-conduct',
            builder: (context, state) => const DocumentInfoPage(
              title: '行動規範',
              filePath: 'assets/docs/code-of-conduct.md',
            ),
          ),
          Route(
            path: '/en/code-of-conduct',
            builder: (context, state) => const DocumentInfoPage(
              title: 'Code of Conduct',
              filePath: 'assets/docs/code-of-conduct.en.md',
            ),
          ),
          Route(
            path: '/privacy-policy',
            builder: (context, state) => const DocumentInfoPage(
              title: 'プライバシーポリシー',
              filePath: 'assets/docs/privacy-policy.md',
            ),
          ),
          Route(
            path: '/en/privacy-policy',
            builder: (context, state) => const DocumentInfoPage(
              title: 'Privacy Policy',
              filePath: 'assets/docs/privacy-policy.en.md',
            ),
          ),
          Route(
            path: '/antisocial-policy',
            builder: (context, state) => const DocumentInfoPage(
              title: '反社会的勢力排除ポリシー',
              filePath: 'assets/docs/antisocial-policy.md',
            ),
          ),
          Route(
            path: '/en/antisocial-policy',
            builder: (context, state) => const DocumentInfoPage(
              title: 'Anti-Social Policy',
              filePath: 'assets/docs/antisocial-policy.en.md',
            ),
          ),
          Route(
            path: '/event-guideline',
            builder: (context, state) => const DocumentInfoPage(
              title: '関連イベントのガイドライン',
              filePath: 'assets/docs/event-guideline.md',
            ),
          ),
          Route(
            path: '/en/event-guideline',
            builder: (context, state) => const DocumentInfoPage(
              title: 'Event Guideline',
              filePath: 'assets/docs/event-guideline.en.md',
            ),
          ),
          Route(
            path: '/tokusho',
            builder: (context, state) => const DocumentInfoPage(
              title: '特定商取引法に基づく表記',
              filePath: 'assets/docs/tokusho.md',
            ),
          ),
        ],
      ),
      footer([
        p([text('© 2025-2026 一般社団法人関西開発者会議')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('html, body').styles(
      margin: Margin.zero,
      padding: Padding.zero,
      backgroundColor: DesignTokens.background,
      color: DesignTokens.text,
      fontFamily: FontFamily('sans-serif'),
    ),
    css('.content-wrapper').styles(
      maxWidth: DesignTokens.containerWidth.px,
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(vertical: DesignTokens.sectionPadding.px, horizontal: 24.px),
    ),
    css('.info-section').styles(margin: Margin.only(bottom: 48.px)),
    css('h3').styles(
      fontSize: 1.15.rem,
      fontWeight: FontWeight.w700,
      margin: Margin.only(bottom: 12.px),
    ),
    css('.sub-label').styles(
      display: Display.block,
      margin: Margin.only(top: 24.px),
      fontWeight: FontWeight.bold,
      color: DesignTokens.primary,
    ),
    css('.announcement-row').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      margin: Margin.only(top: 20.px),
    ),
    css('.pdf-button').styles(
      backgroundColor: Color('#FF5242'),
      color: Colors.white,
      padding: Padding.symmetric(vertical: 10.px, horizontal: 28.px),
      textDecoration: TextDecoration.none,
      radius: BorderRadius.circular(2.px),
      fontWeight: FontWeight.bold,
    ),
    css('.cards-grid').styles(
      display: Display.grid,
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(400px, 1fr))'},
      gap: Gap.all(24.px),
      margin: Margin.only(top: 40.px),
    ),
    css('.card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      backgroundColor: Color('rgba(255, 255, 255, 0.6)'),
      padding: Padding.all(32.px),
      radius: BorderRadius.circular(24.px),
      border: Border.all(color: Color.rgba(0, 0, 0, 0.05), width: 1.px),
      gap: Gap.all(16.px),
    ),
    css('.doc-link').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      padding: Padding.symmetric(vertical: 8.px),
      color: Color('#007AFF'),
      textDecoration: TextDecoration.none,
    ),
    css('.doc-row').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      padding: Padding.symmetric(vertical: 8.px),
    ),
    css('.doc-row-title').styles(
      fontWeight: FontWeight.bold,
    ),
    css('.doc-row-langs').styles(
      display: Display.flex,
      gap: Gap.all(12.px),
    ),
    css('.doc-row-langs a').styles(
      color: Color('#007AFF'),
      textDecoration: TextDecoration.none,
    ),
    css('.social-tile').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      padding: Padding.all(16.px),
      backgroundColor: Color('#E3F2FD'),
      radius: BorderRadius.circular(16.px),
      textDecoration: TextDecoration.none,
      color: DesignTokens.text,
    ),
    css('.tile-icon').styles(
      width: 40.px,
      height: 40.px,
      margin: Margin.only(right: 16.px),
      backgroundColor: Color('#BBDEFB'),
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      justifyContent: JustifyContent.center,
      alignItems: AlignItems.center,
    ),
    css('.tile-title').styles(display: Display.block, fontWeight: FontWeight.bold),
    css('.tile-sub').styles(fontSize: 0.85.rem, color: DesignTokens.muted),
    css('.doc-container').styles(
      maxWidth: 800.px,
      raw: {'line-height': '1.7'},
    ),
    css('.doc-container h1').styles(
      fontSize: 2.rem,
      margin: Margin.only(bottom: 24.px),
      border: Border.only(
        bottom: BorderSide(color: Color('#eaecef'), width: 1.px),
      ),
      padding: Padding.only(bottom: 8.px),
    ),
    css('.doc-container h2').styles(
      fontSize: 1.5.rem,
      margin: Margin.only(top: 32.px, bottom: 16.px),
      border: Border.only(
        bottom: BorderSide(color: Color('#eaecef'), width: 1.px),
      ),
      padding: Padding.only(bottom: 6.px),
    ),
    css('.doc-container p').styles(
      margin: Margin.only(bottom: 16.px),
    ),
    css('.doc-container ul, .doc-container ol').styles(
      padding: Padding.only(left: 24.px),
      margin: Margin.only(bottom: 16.px),
    ),
  ];
}

class CorporateInfoPage extends StatelessComponent {
  const CorporateInfoPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      div(classes: 'content-wrapper', [
        _section('名称', [
          p([text('一般社団法人関西開発者会議 / Kwansei Kaihatusha Kaigi Association')]),
        ]),
        _section('主たる事務所', [
          p([text('大阪府大阪市北区梅田1丁目2番2号大阪駅前第2ビル12-12')]),
        ]),
        _section('法人の公告方法', [
          p([text('当法人の公告は、電子公告により行う')]),
          div(classes: 'announcement-row', [
            span([text('2024年度(令和6年度)貸借対照表')]),
            a(
              href: 'https://drive.google.com/file/d/1bdQkiS53fz4yTlYBBGcSsolhvPfLrMX4/view?usp=share_link',
              classes: 'pdf-button',
              [text('PDF を開く')],
            ),
          ]),
          div(classes: 'announcement-row', [
            span([text('2025年度(令和7年度)貸借対照表')]),
            a(
              href: 'https://drive.google.com/file/d/1qJ88Va-GO_1ZWxOwfe1tGntkTt7iIi85/view?usp=share_link',
              classes: 'pdf-button',
              [text('PDF を開く')],
            ),
          ]),
        ]),

        div(classes: 'cards-grid', [
          _buildCard('📄 ドキュメント', [
            p([text('日本語で書かれた以下のドキュメントをご覧いただけます。')]),
            _docBilingualLink('行動規範', '/code-of-conduct', '/en/code-of-conduct'),
            _docBilingualLink('プライバシーポリシー', '/privacy-policy', '/en/privacy-policy'),
            _docBilingualLink('反社会的勢力排除ポリシー', '/antisocial-policy', '/en/antisocial-policy'),
            _docBilingualLink('関連イベントのガイドライン', '/event-guideline', '/en/event-guideline'),
            _docLink('特定商取引法に基づく表記', '/tokusho'),
            // _docLink('イベント参加規約 (WIP)', '#'),
            _docLink(
              'ロゴ使用ガイドライン (WIP)',
              'https://docs.google.com/document/d/1wTOrXAN6pgCtEe7DGj5sfMccSk1AaJ1PTQZXuY6TVWU/edit?usp=sharing',
            ),
          ]),
          _buildCard('👥 コミュニティに参加する', [
            p([
              text(
                'フロントエンドカンファレンス関西のコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。なお、フロントエンドカンファレンス関西については、一般社団法人関西開発者会議の協力をもって開催されます。',
              ),
            ]),
            _socialTile('X', '@fec_kansaiをフォロー', 'https://x.com/fec_kansai', '🐦'),
            _socialTile('GitHub', 'fec-kansaiリポジトリに貢献する', 'https://github.com/fec-kansai', '📂'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'info-section', [
    h3([text(title)]),
    ...children,
  ]);

  Component _buildCard(String title, List<Component> children) => div(classes: 'card', [
    h3([text(title)]),
    ...children,
  ]);

  Component _docLink(String label, String href) => a(href: href, classes: 'doc-link', [
    text(label),
    span([text('→')]),
  ]);

  Component _docBilingualLink(String title, String jaHref, String enHref) => div(classes: 'doc-row', [
    span(classes: 'doc-row-title', [text(title)]),
    div(classes: 'doc-row-langs', [
      a(href: jaHref, [text('日本語')]),
      text('/'),
      a(href: enHref, [text('English')]),
    ]),
  ]);

  Component _socialTile(String title, String sub, String href, String icon) => a(href: href, classes: 'social-tile', [
    div(classes: 'tile-icon', [text(icon)]),
    div([
      strong(classes: 'tile-title', [text(title)]),
      span(classes: 'tile-sub', [text(sub)]),
    ]),
  ]);
}

class DocumentInfoPage extends StatelessComponent {
  const DocumentInfoPage({
    required this.title,
    required this.filePath,
    super.key,
  });

  final String title;
  final String filePath;

  @override
  Component build(BuildContext context) {
    String markdownContent = '';
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        markdownContent = file.readAsStringSync();
      } else {
        markdownContent = 'ドキュメントが見つかりませんでした。';
      }
    } catch (e) {
      markdownContent = 'ドキュメントの読み込みに失敗しました: $e';
    }

    final htmlContent = md.markdownToHtml(
      markdownContent,
      extensionSet: md.ExtensionSet.gitHubFlavored,
    );

    return main_([
      div(classes: 'content-wrapper doc-container', [
        h1([text('一般社団法人関西開発者会議 $title')]),
        raw(htmlContent),
      ]),
    ]);
  }
}
