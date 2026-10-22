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
              inquiryForm: true,
            ),
          ),
          Route(
            path: '/en/code-of-conduct',
            builder: (context, state) => const DocumentInfoPage(
              title: 'Code of Conduct',
              filePath: 'assets/docs/code-of-conduct.en.md',
              inquiryForm: true,
              lang: 'en',
            ),
          ),
          Route(
            path: '/privacy-policy',
            builder: (context, state) => const DocumentInfoPage(
              title: 'プライバシーポリシー',
              filePath: 'assets/docs/privacy-policy.md',
              inquiryForm: true,
            ),
          ),
          Route(
            path: '/en/privacy-policy',
            builder: (context, state) => const DocumentInfoPage(
              title: 'Privacy Policy',
              filePath: 'assets/docs/privacy-policy.en.md',
              inquiryForm: true,
              lang: 'en',
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
              lang: 'en',
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
              lang: 'en',
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
    css('a:focus-visible, button:focus-visible').styles(
      raw: {'outline': '3px solid #0056B3', 'outline-offset': '2px'},
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
      backgroundColor: Color('#D32F2F'),
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
      color: Color('#0056B3'),
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
      color: Color('#0056B3'),
      raw: {'text-decoration': 'underline'},
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
    css('.history-section').styles(margin: Margin.only(top: 48.px)),
    css('.history-year').styles(margin: Margin.only(top: 24.px)),
    css('.history-header').styles(
      display: Display.flex,
      alignItems: AlignItems.baseline,
      gap: Gap.all(12.px),
      margin: Margin.only(top: 24.px),
    ),
    css('.history-header .sub-label').styles(
      margin: Margin.zero,
    ),
    css('.event-site-link').styles(
      color: Color('#0056B3'),
      fontSize: 0.9.rem,
      fontWeight: FontWeight.bold,
      textDecoration: TextDecoration.none,
    ),
    css('.history-date').styles(
      display: Display.block,
      margin: Margin.only(top: 4.px),
      fontSize: 0.9.rem,
      color: DesignTokens.muted,
    ),
    css('.album-list').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(8.px),
      margin: Margin.only(top: 12.px),
    ),
    css('.album-link').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      padding: Padding.symmetric(vertical: 12.px, horizontal: 16.px),
      backgroundColor: Color('#E3F2FD'),
      radius: BorderRadius.circular(12.px),
      color: Color('#0056B3'),
      textDecoration: TextDecoration.none,
    ),
    css('.album-label').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      raw: {'flex-wrap': 'wrap'},
    ),
    css('.album-badge').styles(
      padding: Padding.symmetric(vertical: 2.px, horizontal: 10.px),
      backgroundColor: Color('#FFF3E0'),
      color: Color('#BF360C'),
      fontSize: 0.75.rem,
      fontWeight: FontWeight.bold,
      radius: BorderRadius.circular(999.px),
      raw: {'white-space': 'nowrap'},
    ),
    css('.album-link-session').styles(
      backgroundColor: Color('#BBDEFB'),
      fontWeight: FontWeight.bold,
      raw: {'border-left': '4px solid #0056B3'},
    ),
    css('.album-badge-session').styles(
      padding: Padding.symmetric(vertical: 2.px, horizontal: 10.px),
      backgroundColor: Color('#0056B3'),
      color: Colors.white,
      fontSize: 0.75.rem,
      fontWeight: FontWeight.bold,
      radius: BorderRadius.circular(999.px),
      raw: {'white-space': 'nowrap'},
    ),
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
    css('.doc-container .rf-btn-trig').styles(
      padding: Padding.zero,
      color: Color('#0056B3'),
      raw: {
        'background': 'none',
        'border': '0',
        'font': 'inherit',
        'cursor': 'pointer',
        'text-decoration': 'underline',
      },
    ),
  ];
}

class _Album {
  const _Album(this.label, this.url, {this.badge, this.isSession = false});

  final String label;
  final String url;
  final String? badge;
  final bool isSession;
}

class _EventYear {
  const _EventYear(this.year, this.month, this.day, {required this.albums, this.siteUrl});

  final int year;
  final int month;
  final int day;
  final List<_Album> albums;
  final String? siteUrl;
}

class CorporateInfoPage extends StatelessComponent {
  const CorporateInfoPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      Document.head(
        title: '一般社団法人関西開発者会議',
        children: [
          script(src: 'https://rocket-form.nekohack.me/loader.js?id=frontend-conf-kwansei-interview', async: true),
        ],
      ),
      div(classes: 'content-wrapper', [
        h2([text('一般社団法人関西開発者会議')]),
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
              attributes: {'aria-label': '2024年度(令和6年度)貸借対照表 PDF を開く'},
              [text('PDF を開く')],
            ),
          ]),
          div(classes: 'announcement-row', [
            span([text('2025年度(令和7年度)貸借対照表')]),
            a(
              href: 'https://drive.google.com/file/d/1qJ88Va-GO_1ZWxOwfe1tGntkTt7iIi85/view?usp=share_link',
              classes: 'pdf-button',
              attributes: {'aria-label': '2025年度(令和7年度)貸借対照表 PDF を開く'},
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

        div(classes: 'history-section', [
          h3([text('📸 開催履歴')]),
          p([text('過去のフロントエンドカンファレンス関西の写真は、Google フォトでご覧いただけます。')]),
          for (final event in ([..._eventHistory]..sort(_compareEventsDesc))) _historyYear(event),
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
      a(href: jaHref, attributes: {'aria-label': '$title (日本語)'}, [text('日本語')]),
      span(attributes: {'aria-hidden': 'true'}, [text('/')]),
      a(
        href: enHref,
        attributes: {'lang': 'en', 'hreflang': 'en', 'aria-label': '$title (English)'},
        [text('English')],
      ),
    ]),
  ]);

  Component _socialTile(String title, String sub, String href, String icon) => a(href: href, classes: 'social-tile', [
    div(classes: 'tile-icon', [text(icon)]),
    div([
      strong(classes: 'tile-title', [text(title)]),
      span(classes: 'tile-sub', [text(sub)]),
    ]),
  ]);

  static const List<_EventYear> _eventHistory = [
    _EventYear(
      2026,
      10,
      12,
      siteUrl: 'https://frontend-conf.osaka.jp/',
      albums: [
        _Album(
          'まいどルーム（グランホール 1）',
          'https://photos.app.goo.gl/L5zN11R59RfTEuNQ6',
          isSession: true,
        ),
        _Album(
          'おおきにルーム（グランホール 2）',
          'https://photos.app.goo.gl/EjukXq8mWsNB3SF18',
          isSession: true,
        ),
        _Album(
          '受付・スタンプラリー',
          'https://photos.app.goo.gl/4fegNtHp5nhu8U497',
        ),
        _Album(
          'ランチ（ランチセッション）',
          'https://photos.app.goo.gl/WuaC2VGLEViA961S8',
        ),
        _Album(
          'ASK THE SPEAKER',
          'https://photos.app.goo.gl/yxQNnuggjJ2MJnjF8',
        ),
        _Album(
          'アフターパーティー',
          'https://photos.app.goo.gl/eQ5USqhhCsERGvvi7',
        ),
        _Album(
          'コミュニティセッション',
          'https://photos.app.goo.gl/CrRZhqU12zLjM9XZA',
        ),
        _Album(
          'スピーカーパーティー',
          'https://photos.app.goo.gl/kQYuk9PN6m4cLS5NA',
          badge: '登壇者限定',
        ),
      ],
    ),
    _EventYear(
      2025,
      11,
      30,
      siteUrl: 'https://2025.frontend-conf.osaka.jp/',
      albums: [
        _Album(
          'ナレッジワークルーム（ルーム 1 + ルーム 2）',
          'https://photos.app.goo.gl/mPBVstBVfzv3K9uY6',
          isSession: true,
        ),
        _Album(
          'IGNITE KANSAI ルーム（ルーム 6）',
          'https://photos.app.goo.gl/cMpRP3HQpX4K3nAx6',
          isSession: true,
        ),
        _Album(
          '学生支援 スカラシップ',
          'https://photos.app.goo.gl/Ze7XCyh7EkuPatqY7',
          badge: '学生限定',
        ),
        _Album(
          'スピーカーパーティー',
          'https://photos.app.goo.gl/tCYFcBz2tR2F3TPF9',
          badge: '登壇者限定',
        ),
      ],
    ),
  ];

  static int _compareEventsDesc(_EventYear a, _EventYear b) =>
      DateTime(b.year, b.month, b.day).compareTo(DateTime(a.year, a.month, a.day));

  static const _weekdays = ['月', '火', '水', '木', '金', '土', '日'];

  Component _historyYear(_EventYear event) {
    final weekday = _weekdays[DateTime(event.year, event.month, event.day).weekday - 1];
    return div(classes: 'history-year', [
      div(classes: 'history-header', [
        strong(classes: 'sub-label', [text('フロントエンドカンファレンス関西 ${event.year}')]),
        if (event.siteUrl != null)
          a(
            href: event.siteUrl!,
            target: Target.blank,
            attributes: {
              'rel': 'noopener noreferrer',
              'aria-label': 'フロントエンドカンファレンス関西 ${event.year} 公式サイト 🔗',
            },
            classes: 'event-site-link',
            [text('公式サイト 🔗')],
          ),
      ]),
      span(classes: 'history-date', [text('開催日: ${event.month}/${event.day} ${weekday}曜日')]),
      div(classes: 'album-list', [
        for (final album in event.albums)
          a(
            href: album.url,
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: album.isSession ? 'album-link album-link-session' : 'album-link',
            [
              span(classes: 'album-label', [
                text(album.label),
                if (album.isSession) span(classes: 'album-badge-session', [text('セッション')]),
                if (album.badge != null) span(classes: 'album-badge', [text(album.badge!)]),
              ]),
              span([text('→')]),
            ],
          ),
      ]),
    ]);
  }
}

class DocumentInfoPage extends StatelessComponent {
  const DocumentInfoPage({
    required this.title,
    required this.filePath,
    this.inquiryForm = false,
    this.lang = 'ja',
    super.key,
  });

  final String title;
  final String filePath;
  final bool inquiryForm;
  final String lang;

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
      Document.head(
        title: '$title | 一般社団法人関西開発者会議',
        children: [
          if (inquiryForm)
            script(src: 'https://rocket-form.nekohack.me/loader.js?id=frontend-conf-kwansei-interview', async: true),
        ],
      ),
      div(
        classes: 'content-wrapper doc-container',
        attributes: {'lang': lang},
        [
          h1([
            span(attributes: {'lang': 'ja'}, [text('一般社団法人関西開発者会議')]),
            text(' $title'),
          ]),
          raw(htmlContent),
        ],
      ),
    ]);
  }
}
