import 'package:associate_site/models/info_model.dart';

const title = '一般社団法人関西開発者会議';
const enTitle = 'Kwansei Kaihatusha Kaigi Association';

const leader = '北村勇磨';
const enLeader = 'Yuma Kitamura';

final List<Info> info = [
  Info(label: '名称', text: '$title / $enTitle'),
  Info(label: '主たる事務所', text: '大阪府大阪市北区梅田1丁目2番2号大阪駅前第2ビル12-12'),
  Info(label: '法人の公告方法', text: '当法人の公告は、電子公告により行う'),
  Info(
    label: '目的等',
    text:
        '目的 当法人は、関西におけるエンジニアの技術共有およびコミュニケーションを支援、充実することを目的とし、その目的に資するため、次の事業を行う',
  ),
  Info(label: '特定商取引法に基づく表記', text: ''),
];

final notices = [
  [
    '2025年度(令和7年度)貸借対照表',
    'https://drive.google.com/file/d/1bdQkiS53fz4yTlYBBGcSsolhvPfLrMX4/view?usp=sharing',
  ],
];

final purposes = [
  'エンジニアを対象とした催しの開催、また運営',
  'エンジニアの育成の推進を図る活動',
  '技術共有、コミュニケーションを目的とした催しの支援および人材育成',
  '前各号に附帯又は関連する事業',
];

final List<Info> tokusho = [
  Info(label: '事業者', text: '$title / $enTitle'),
  Info(label: '代表者', text: '$leader / $enLeader'),
  Info(label: '所在地', text: '大阪府大阪市北区梅田1丁目2番2号大阪駅前第2ビル12-12'),
  Info(
    label: '電話番号',
    text:
        '※当社ではお電話によるお問い合わせは承っておりません。フロントエンドカンファレンス関西 お問い合わせフォーム までご連絡くださいますようお願いいたします。',
  ),
  Info(label: '販売価格', text: '各商品に表記された価格に準じます。'),
  Info(label: 'サービス代金以外の料金', text: '注文手数料（コンビニ、ATM 決済の場合）'),
  Info(
    label: '代金の支払い時期および決済方法',
    text: 'クレジットカード（即時）、コンビニ決済（支払期限まで）、ATM 決済（支払期限まで） ※ 予定が変更される場合があります。',
  ),
  Info(label: 'サービスの提供時期', text: 'フロントエンドカンファレンス関西の開催日'),
  Info(
    label: '返品・返金',
    text:
        'チケット購入から 50 日未満、かつ決済方法がクレジットカードの場合のみ、チケットのキャンセル・返金が可能です。コンビニ、ATM 決済ではキャンセル・返金できませんので、あらかじめご了承ください。キャンセルをご希望の場合は、購入後に届く購入完了メールに記載されている購入者のお名前、注文番号を添えて、フロントエンドカンファレンス関西 お問い合わせフォームよりご連絡ください。',
  ),
];

final policies = [
  [
    '行動規範',
    'https://docs.google.com/document/d/1ehwr1skJ_HS0Ef2VL18Hoka1WSB_Qvi5WYOOrRP_zSA/edit?usp=sharing',
  ],
  [
    'プライバシーポリシー',
    'https://docs.google.com/document/d/1EZ-C2aJ_mzKHgZa3IYePkB5zC9TYBBTDJRiwA7KxotM/edit?usp=sharing',
  ],
  [
    '反社会的勢力排除ポリシー',
    'https://docs.google.com/document/d/187gfjUQYCNd0SI2h5VrQCPG6FyIvodq_foECA_9eCpw/edit?usp=sharing',
  ],
  [
    '関連イベントのガイドライン',
    'https://docs.google.com/document/d/107_5Vfr-dFtrKDtJWbHezFlomkG5chJez51tWMuGV98/edit?usp=sharing',
  ],
  [
    'イベント参加規約',
    '',
    // 'https://docs.google.com/document/d/1yFnBpDiANWWt8PQ69mISF7jd2gSZkPJsLNbqa133mA8/edit?usp=sharing',
  ],
  [
    'ロゴ使用ガイドライン',
    '',
    // 'https://docs.google.com/document/d/1wTOrXAN6pgCtEe7DGj5sfMccSk1AaJ1PTQZXuY6TVWU/edit?usp=sharing',
  ],
  [
    '特定商取引法に基づく表記',
    '',
    // 'https://docs.google.com/document/d/1NICCFP52Gny908ZSrwwW_r-mou9niUjmjiGie1HlbQM/edit?usp=sharing',
  ],
];

final links = [
  ['github', 'https://github.com/fec-kansai'],
  ['twitter', 'https://x.com/fec_kansai'],
  ['bluesky', 'https://bsky.app/profile/fec-kansai.bsky.social'],
  ['medium', 'https://medium.com/fec-kansai'],
];
