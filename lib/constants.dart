import 'package:associate_site/models/info_model.dart';

const title = '一般社団法人関西開発者会議';
const enTitle = 'Kwansei Kaihatusha Kaigi Association';

final List<Info> info = [
  Info(label: '名称', text: '$title / $enTitle'),
  Info(label: '主たる事務所', text: '大阪府大阪市北区梅田1丁目2番2号大阪駅前第2ビル12-12'),
  Info(label: '法人の公告方法', text: '当法人の公告は、電子公告により行う'),
  Info(
    label: '目的等',
    text:
        '目的 当法人は、関西におけるエンジニアの技術共有およびコミュニケーションを支援、充実することを目的とし、その目的に資するため、次の事業を行う',
  ),
];

final notices = [
  //
];

final purposes = [
  'エンジニアを対象とした催しの開催、また運営',
  'エンジニアの育成の推進を図る活動',
  '技術共有、コミュニケーションを目的とした催しの支援および人材育成',
  '前各号に附帯又は関連する事業',
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
];
