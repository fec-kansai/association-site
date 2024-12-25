import 'package:associate_site/models/info_model.dart';

const title = '一般社団法人関西開発者会議';
const enTitle = 'Kwansei Kaihatusya Kaigi Association';

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

final links = [
  ['github', 'https://github.com/fec-kansai'],
  ['twitter', 'https://x.com/fec_kansai'],
  ['bluesky', 'https://bsky.app/profile/fec-kansai.bsky.social'],
];
