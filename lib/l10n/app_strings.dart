import 'package:flutter/material.dart';

class AppStrings {
  AppStrings({required this.locale});
  final Locale locale;

  bool get isRu => locale.languageCode.toLowerCase().startsWith('ru');
  bool get isZhHans {
    final String languageCode = locale.languageCode.toLowerCase();
    if (languageCode != 'zh') return false;
    final String scriptCode = locale.scriptCode?.toLowerCase() ?? '';
    final String countryCode = locale.countryCode?.toLowerCase() ?? '';
    return scriptCode == 'hans' || countryCode == 'cn' || countryCode == 'sg';
  }

  bool get isZhHant {
    final String languageCode = locale.languageCode.toLowerCase();
    if (languageCode != 'zh') return false;
    final String scriptCode = locale.scriptCode?.toLowerCase() ?? '';
    final String countryCode = locale.countryCode?.toLowerCase() ?? '';
    return scriptCode == 'hant' ||
        countryCode == 'tw' ||
        countryCode == 'hk' ||
        countryCode == 'mo';
  }

  String tr({
    required String en,
    required String ru,
    String? zhHans,
    String? zhHant,
  }) {
    if (isRu) return ru;
    if (isZhHant) return zhHant ?? zhHans ?? en;
    if (isZhHans) return zhHans ?? zhHant ?? en;
    return en;
  }

  static AppStrings of(BuildContext context) {
    return AppStrings(locale: Localizations.localeOf(context));
  }

  String get refresh =>
      tr(en: 'Refresh', ru: 'Обновить', zhHans: '刷新', zhHant: '重新整理');

  String get permissionGranted => tr(
    en: 'Notification permission granted.',
    ru: 'Разрешение на уведомления выдано.',
    zhHans: '通知权限已授予。',
    zhHant: '通知權限已授予。',
  );

  String get permissionDenied => tr(
    en: 'Notification permission was not granted.',
    ru: 'Разрешение на уведомления не выдано.',
    zhHans: '未授予通知权限。',
    zhHant: '未授予通知權限。',
  );

  String get listenerUnavailable => tr(
    en: 'Unable to open Listener settings on this device.',
    ru: 'Не удалось открыть настройки Listener.',
    zhHans: '此设备无法打开监听器设置。',
    zhHant: '此裝置無法開啟監聽器設定。',
  );

  String get notificationsUnavailable => tr(
    en: 'Unable to open app notification settings.',
    ru: 'Не удалось открыть настройки уведомлений.',
    zhHans: '无法打开应用通知设置。',
    zhHant: '無法開啟應用通知設定。',
  );

  String get liveUpdatesUnavailable => tr(
    en: 'Unable to open Live Updates settings on this device.',
    ru: 'Не удалось открыть настройки Live Updates.',
    zhHans: '此设备无法打开 Live Updates 设置。',
    zhHant: '此裝置無法開啟 Live Updates 設定。',
  );

  String get githubOpenFailed => tr(
    en: 'Unable to open GitHub link.',
    ru: 'Не удалось открыть ссылку GitHub.',
    zhHans: '无法打开 GitHub 链接。',
    zhHant: '無法開啟 GitHub 連結。',
  );

  String get linkOpenFailed => tr(
    en: 'Unable to open link.',
    ru: 'Не удалось открыть ссылку.',
    zhHans: '无法打开链接。',
    zhHant: '無法開啟連結。',
  );

  String get updateCheckFailed => tr(
    en: 'Unable to check updates. Try disabling VPN.',
    ru: 'Не удалось проверить обновления. Попробуйте отключить VPN.',
    zhHans: '无法检查更新。请尝试关闭 VPN。',
    zhHant: '無法檢查更新。請嘗試關閉 VPN。',
  );

  String get dictionaryEmpty => tr(
    en: 'Dictionary is empty or invalid.',
    ru: 'Словарь пустой или поврежден.',
    zhHans: '词典为空或无效。',
    zhHant: '字典為空或無效。',
  );

  String get dictionaryUpdateDone => tr(
    en: 'Dictionary updated from GitHub.',
    ru: 'Словарь обновлен из GitHub.',
    zhHans: '词典已从 GitHub 更新。',
    zhHant: '字典已從 GitHub 更新。',
  );

  String get dictionaryInvalid => tr(
    en: 'Invalid dictionary JSON.',
    ru: 'Невалидный JSON словаря.',
    zhHans: '词典 JSON 无效。',
    zhHant: '字典 JSON 無效。',
  );

  String get dictionaryUpdateFailed => tr(
    en: 'Failed to update dictionary from GitHub.',
    ru: 'Не удалось обновить словарь из GitHub.',
    zhHans: '从 GitHub 更新词典失败。',
    zhHant: '從 GitHub 更新字典失敗。',
  );

  String get dictionaryTitle =>
      tr(en: 'Dictionary', ru: 'Словарь', zhHans: '词典', zhHant: '字典');

  String get dictionaryManageSubtitle => tr(
    en: 'tap to manage',
    ru: 'нажмите для управления',
    zhHans: '点按以管理',
    zhHant: '點按以管理',
  );

  String get dictionaryLanguagesTitle => tr(
    en: 'Dictionary languages',
    ru: 'Языки словаря',
    zhHans: '词典语言',
    zhHant: '字典語言',
  );

  String get dictionaryLanguagesSubtitle => tr(
    en: 'tap to choose',
    ru: 'нажмите для выбора',
    zhHans: '点按以选择',
    zhHant: '點按以選擇',
  );

  String get dictionaryLanguagesPickerTitle => tr(
    en: 'Select languages for conversion',
    ru: 'Выберите языки для конвертации',
    zhHans: '选择用于转换的语言',
    zhHant: '選擇用於轉換的語言',
  );

  String get dictionaryUpdateAction => tr(
    en: 'Update dictionaries',
    ru: 'Обновить словари',
    zhHans: '更新词典',
    zhHant: '更新字典',
  );

  String get dictionaryEditorTitle => tr(
    en: 'Dictionary editor',
    ru: 'Редактор словаря',
    zhHans: '词典编辑器',
    zhHant: '字典編輯器',
  );

  String get dictionaryComingSoon => tr(
    en: '(coming soon)',
    ru: '(скоро)',
    zhHans: '（即将推出）',
    zhHant: '（即將推出）',
  );

  String get navHome => tr(en: 'Home', ru: 'Домой', zhHans: '主页', zhHant: '首頁');

  String get navRules =>
      tr(en: 'Rules', ru: 'Правила', zhHans: '规则', zhHant: '規則');

  String get navSettings =>
      tr(en: 'Settings', ru: 'Настройки', zhHans: '设置', zhHant: '設定');

  String get redesignRulesTitle =>
      tr(en: 'Rules', ru: 'Правила', zhHans: '规则', zhHant: '規則');

  String get appConfigTitle => tr(
    en: 'App config',
    ru: 'Настройки приложения',
    zhHans: '应用配置',
    zhHant: '應用配置',
  );

  String get brandSpecificTitle => tr(
    en: 'Brand-specific',
    ru: 'Особенности бренда',
    zhHans: '品牌特定',
    zhHant: '品牌特定',
  );

  String get appUpdatesTitle => tr(
    en: 'App updates',
    ru: 'Обновления приложения',
    zhHans: '应用更新',
    zhHant: '應用更新',
  );

  String get statusRunning => tr(
    en: 'LiveBridge is running',
    ru: 'LiveBridge запущен',
    zhHans: 'LiveBridge 正在运行',
    zhHant: 'LiveBridge 正在執行',
  );

  String get statusDisabled => tr(
    en: 'LiveBridge is disabled',
    ru: 'LiveBridge выключен',
    zhHans: 'LiveBridge 已关闭',
    zhHant: 'LiveBridge 已關閉',
  );

  String get statusByPrefix =>
      tr(en: 'by ', ru: 'by ', zhHans: 'by ', zhHant: 'by ');

  String rulesCount(int count) => tr(
    en: '$count Rules',
    ru: '$count правил',
    zhHans: '$count 条规则',
    zhHant: '$count 條規則',
  );

  String get discussTitle =>
      tr(en: 'Discuss', ru: 'Discuss', zhHans: '讨论', zhHant: '討論');

  String get discussSubtitle => tr(
    en: 'telegram topics',
    ru: 'telegram topics',
    zhHans: 'telegram 话题',
    zhHant: 'telegram 話題',
  );

  String get rulesModeAllApps => tr(
    en: 'all apps',
    ru: 'все приложения',
    zhHans: '所有应用',
    zhHant: '所有應用程式',
  );

  String get rulesModeOnlySelected => tr(
    en: 'only selected',
    ru: 'только выбранные',
    zhHans: '仅已选择',
    zhHant: '僅已選取',
  );

  String get rulesModeExcludeSelected => tr(
    en: 'exclude selected',
    ru: 'исключая выбранные',
    zhHans: '排除已选择',
    zhHant: '排除已選取',
  );

  String get permissionCheckRequired => tr(
    en: 'check required',
    ru: 'нужно проверить',
    zhHans: '需要检查',
    zhHant: '需要檢查',
  );

  String get permissionsAllSet =>
      tr(en: 'all set', ru: 'всё готово', zhHans: '已就绪', zhHant: '已就緒');

  String get versionTapToUpdate => tr(
    en: 'tap to update',
    ru: 'нажмите для обновления',
    zhHans: '点按更新',
    zhHant: '點按更新',
  );

  String get versionLatestVersion => tr(
    en: 'latest version',
    ru: 'последняя версия',
    zhHans: '最新版本',
    zhHant: '最新版本',
  );

  String get recentConversions => tr(
    en: 'Recent conversions',
    ru: 'Последние конвертации',
    zhHans: '最近转换',
    zhHant: '最近轉換',
  );

  String get noConversionsYet => tr(
    en: 'no conversions yet',
    ru: 'конвертаций пока нет',
    zhHans: '暂无转换',
    zhHant: '暫無轉換',
  );

  String get conversionLogDisabled => tr(
    en: 'conversion log is disabled',
    ru: 'лог конвертаций выключен',
    zhHans: '转换日志已关闭',
    zhHant: '轉換記錄已關閉',
  );

  String get enable =>
      tr(en: 'enable', ru: 'включить', zhHans: '启用', zhHant: '啟用');

  String get payloadCopied => tr(
    en: 'Payload copied',
    ru: 'Payload скопирован',
    zhHans: 'Payload 已复制',
    zhHant: 'Payload 已複製',
  );

  String get progressTitle =>
      tr(en: 'Progress', ru: 'Прогресс', zhHans: '进度', zhHant: '進度');

  String get nativeProgressTitle => tr(
    en: 'Native progress',
    ru: 'Нативный прогресс',
    zhHans: '原生进度',
    zhHant: '原生進度',
  );

  String get otpCodesTitle =>
      tr(en: 'OTP codes', ru: 'OTP-коды', zhHans: 'OTP 验证码', zhHant: 'OTP 驗證碼');

  String get autoCopyCodeTitle => tr(
    en: 'Auto-copy code',
    ru: 'Автокопирование кода',
    zhHans: '自动复制验证码',
    zhHant: '自動複製驗證碼',
  );

  String get smartConversionTitle => tr(
    en: 'Smart conversion',
    ru: 'Умная конвертация',
    zhHans: '智能转换',
    zhHant: '智慧轉換',
  );

  String get taxiTitle =>
      tr(en: 'Taxi', ru: 'Такси', zhHans: '打车', zhHant: '叫車');

  String get deliveriesTitle =>
      tr(en: 'Deliveries', ru: 'Доставки', zhHans: '外卖', zhHant: '外送');

  String get removeOriginalMessageTitle => tr(
    en: 'Remove original message',
    ru: 'Удалять исходное уведомление',
    zhHans: '移除原始通知',
    zhHant: '移除原始通知',
  );

  String get experimentalSuffix =>
      tr(en: '(exp)', ru: '(exp)', zhHans: '（实验）', zhHant: '（實驗）');

  String get allAppsTitle => tr(
    en: 'All apps',
    ru: 'Все приложения',
    zhHans: '所有应用',
    zhHant: '所有應用程式',
  );

  String get onlySelectedTitle => tr(
    en: 'Only selected',
    ru: 'Только выбранные',
    zhHans: '仅已选择',
    zhHant: '僅已選取',
  );

  String get excludeSelectedTitle => tr(
    en: 'Exclude selected',
    ru: 'Исключить выбранные',
    zhHans: '排除已选择',
    zhHant: '排除已選取',
  );

  String get conversionModeTitle => tr(
    en: 'Conversion mode',
    ru: 'Режим конвертации',
    zhHans: '转换模式',
    zhHant: '轉換模式',
  );

  String get selectedAppsTitle => tr(
    en: 'Selected apps',
    ru: 'Приложения',
    zhHans: '已选择应用',
    zhHant: '已選取應用程式',
  );

  String get showSystem => tr(
    en: 'show system',
    ru: 'показать системные',
    zhHans: '显示系统',
    zhHant: '顯示系統',
  );

  String get hideSystem => tr(
    en: 'hide system',
    ru: 'скрыть системные',
    zhHans: '隐藏系统',
    zhHant: '隱藏系統',
  );

  String get networkConnectionsTitle => tr(
    en: 'Network & Connections',
    ru: 'Сеть и подключения',
    zhHans: '网络与连接',
    zhHant: '網路與連線',
  );

  String get vpnsTitle =>
      tr(en: 'VPNs', ru: 'VPN', zhHans: 'VPN', zhHant: 'VPN');

  String get externalDevicesTitle => tr(
    en: 'External devices',
    ru: 'Внешние устройства',
    zhHans: '外接设备',
    zhHant: '外接裝置',
  );

  String get ignoreDebuggingDevicesTitle => tr(
    en: 'Ignore debugging devices',
    ru: 'Игнорировать отладочные устройства',
    zhHans: '忽略调试设备',
    zhHant: '忽略偵錯裝置',
  );

  String get networkSpeedThresholdRedesignTitle => tr(
    en: 'Network speed threshold',
    ru: 'Порог скорости сети',
    zhHans: '网速阈值',
    zhHant: '網速門檻',
  );

  String get miscellaneousTitle =>
      tr(en: 'Miscellaneous', ru: 'Разное', zhHans: '其他', zhHant: '其他');

  String get navigationMapsTitle => tr(
    en: 'Navigation (maps)',
    ru: 'Навигация (карты)',
    zhHans: '导航（地图）',
    zhHant: '導航（地圖）',
  );

  String get mediaPlaybackRedesignTitle =>
      tr(en: 'Media playback', ru: 'Медиа', zhHans: '媒体播放', zhHant: '媒體播放');

  String get weatherBroadcastsTitle => tr(
    en: 'Weather broadcasts',
    ru: 'Погодные уведомления',
    zhHans: '天气播报',
    zhHant: '天氣播報',
  );

  String get bypassTitle =>
      tr(en: 'Bypass', ru: 'Bypass', zhHans: '绕过', zhHant: '繞過');

  String get perAppSettingsTitle => tr(
    en: 'Per-app settings',
    ru: 'Настройки приложений',
    zhHans: '按应用设置',
    zhHant: '各應用設定',
  );

  String get defaultsTitle =>
      tr(en: 'Defaults', ru: 'По умолчанию', zhHans: '默认值', zhHant: '預設值');

  String get defaultsSubtitle => tr(
    en: 'tap to change default behavior',
    ru: 'нажмите, чтобы изменить поведение',
    zhHans: '点按更改默认行为',
    zhHant: '點按變更預設行為',
  );

  String get appsListTitle => tr(
    en: 'Apps list',
    ru: 'Список приложений',
    zhHans: '应用列表',
    zhHant: '應用程式清單',
  );

  String get exportLabel =>
      tr(en: 'Export', ru: 'Экспорт', zhHans: '导出', zhHant: '匯出');

  String get importLabel =>
      tr(en: 'Import', ru: 'Импорт', zhHans: '导入', zhHant: '匯入');

  String get titleSourceTitle => tr(
    en: 'Title source',
    ru: 'Источник заголовка',
    zhHans: '标题来源',
    zhHant: '標題來源',
  );

  String get contentSourceTitle => tr(
    en: 'Content source',
    ru: 'Источник контента',
    zhHans: '内容来源',
    zhHant: '內容來源',
  );

  String get notificationTitleOption => tr(
    en: 'Notification title',
    ru: 'Заголовок уведомления',
    zhHans: '通知标题',
    zhHant: '通知標題',
  );

  String get appTitleOption => tr(
    en: 'App title',
    ru: 'Название приложения',
    zhHans: '应用标题',
    zhHant: '應用標題',
  );

  String get notificationTextOption => tr(
    en: 'Notification text',
    ru: 'Текст уведомления',
    zhHans: '通知文本',
    zhHant: '通知文字',
  );

  String get appUpdateNewVersionTitle => tr(
    en: 'New version available',
    ru: 'Доступна новая версия',
    zhHans: '有新版本可用',
    zhHant: '有新版本可用',
  );

  String get appUpdateCheckingTitle => tr(
    en: 'Checking for updates',
    ru: 'Проверяем обновления',
    zhHans: '正在检查更新',
    zhHant: '正在檢查更新',
  );

  String get appUpdateAllSetTitle => tr(
    en: 'You’re all set',
    ru: 'Всё готово',
    zhHans: '已是最新',
    zhHant: '已是最新',
  );

  String get appUpdateDownloadsSubtitle => tr(
    en: 'tap to go to downloads',
    ru: 'перейти к загрузке',
    zhHans: '点按前往下载',
    zhHant: '點按前往下載',
  );

  String get appUpdatePleaseWaitSubtitle => tr(
    en: 'please wait a moment',
    ru: 'подождите немного',
    zhHans: '请稍等',
    zhHant: '請稍候',
  );

  String get appUpdateLatestSubtitle => tr(
    en: 'latest version already',
    ru: 'установлена последняя версия',
    zhHans: '已经是最新版本',
    zhHant: '已是最新版本',
  );

  String get visitProjectPageTitle => tr(
    en: 'Visit project page',
    ru: 'Открыть страницу проекта',
    zhHans: '访问项目页面',
    zhHant: '前往專案頁面',
  );

  String get visitGithubTitle => tr(
    en: 'Visit GitHub',
    ru: 'Открыть GitHub',
    zhHans: '访问 GitHub',
    zhHant: '前往 GitHub',
  );

  String get updateProfileNewVersionTitle => tr(
    en: 'New version available',
    ru: 'Доступна новая версия',
    zhHans: '有新版本可用',
    zhHant: '有新版本可用',
  );

  String updateProfileVersionSubtitle(String current, String latest) => tr(
    en: '$current -> $latest | tap to see',
    ru: '$current -> $latest | посмотреть',
    zhHans: '$current -> $latest | 点按查看',
    zhHant: '$current -> $latest | 點按查看',
  );

  String get updateProfileAvailableSubtitle => tr(
    en: 'update available | tap to see',
    ru: 'доступно обновление | посмотреть',
    zhHans: '有可用更新 | 点按查看',
    zhHant: '有可用更新 | 點按查看',
  );

  String get updateProfileOpenSubtitle => tr(
    en: 'tap to open update settings',
    ru: 'нажмите для настройки',
    zhHans: '点按打开更新设置',
    zhHant: '點按開啟更新設定',
  );

  String get conversionLogTitle => tr(
    en: 'Conversion log',
    ru: 'Лог конвертаций',
    zhHans: '转换日志',
    zhHant: '轉換記錄',
  );

  String get logLengthTitle =>
      tr(en: 'Log length', ru: 'Размер лога', zhHans: '日志大小', zhHant: '記錄大小');

  String get xiaomiHyperIslandTitle => tr(
    en: 'Xiaomi HyperIsland',
    ru: 'Xiaomi HyperIsland',
    zhHans: '小米 HyperIsland',
    zhHant: '小米 HyperIsland',
  );

  String get lengthTitle =>
      tr(en: 'Length', ru: 'Длина', zhHans: '长度', zhHant: '長度');

  String get otpDedupTitle =>
      tr(en: 'OTP dedup', ru: 'OTP dedup', zhHans: 'OTP 去重', zhHant: 'OTP 去重');

  String get smartConversionDedupTitle => tr(
    en: 'Smart conversion dedup',
    ru: 'Smart conversion dedup',
    zhHans: '智能转换去重',
    zhHant: '智慧轉換去重',
  );

  String get animatedIslandRedesignTitle => tr(
    en: 'Animated Island',
    ru: 'Анимированный остров',
    zhHans: '动态岛动画',
    zhHant: '動態島動畫',
  );

  String get updateFrequencyTitle => tr(
    en: 'Update frequency',
    ru: 'Частота обновления',
    zhHans: '更新频率',
    zhHant: '更新頻率',
  );

  String get copyDebugJsonTitle => tr(
    en: 'Copy debug JSON',
    ru: 'Скопировать debug JSON',
    zhHans: '复制调试 JSON',
    zhHant: '複製偵錯 JSON',
  );

  String get openGithubPageTitle => tr(
    en: 'Open GitHub page',
    ru: 'Открыть GitHub',
    zhHans: '打开 GitHub 页面',
    zhHant: '開啟 GitHub 頁面',
  );

  String get autoCopyDebugJsonTitle => tr(
    en: 'Auto-copy debug JSON',
    ru: 'Автокопирование debug JSON',
    zhHans: '自动复制调试 JSON',
    zhHant: '自動複製偵錯 JSON',
  );

  String conversionLogFrom(String appLabel) => tr(
    en: 'from $appLabel',
    ru: 'от $appLabel',
    zhHans: '来自 $appLabel',
    zhHant: '來自 $appLabel',
  );

  String conversionLogAt(String time) =>
      tr(en: 'at $time', ru: 'в $time', zhHans: time, zhHant: time);

  String get conversionLogEntryTitleLabel =>
      tr(en: 'Title', ru: 'Заголовок', zhHans: '标题', zhHant: '標題');

  String get payloadJsonTitle => tr(
    en: 'Payload JSON',
    ru: 'Payload JSON',
    zhHans: 'Payload JSON',
    zhHant: 'Payload JSON',
  );

  String get loadingApps => tr(
    en: 'loading apps...',
    ru: 'загрузка приложений...',
    zhHans: '正在加载应用...',
    zhHant: '正在載入應用程式...',
  );

  String get searchForApps => tr(
    en: 'Search for apps...',
    ru: 'Поиск приложений...',
    zhHans: '搜索应用...',
    zhHant: '搜尋應用程式...',
  );

  String get heroTitle => 'LiveBridge';

  String get reportBug => tr(
    en: 'Report a bug',
    ru: 'Сообщить о баге',
    zhHans: '报告问题',
    zhHant: '回報問題',
  );

  String get bugReportCopied => tr(
    en: 'Diagnostics copied to clipboard. Paste it into the issue.',
    ru: 'Диагностика скопирована в буфер. Вставьте в issue.',
    zhHans: '诊断信息已复制到剪贴板，请粘贴到 issue 中。',
    zhHant: '診斷資訊已複製到剪貼簿，請貼到 issue。',
  );

  String get bugReportCopyFailed => tr(
    en: 'Failed to copy diagnostics.',
    ru: 'Не удалось скопировать диагностику.',
    zhHans: '复制诊断信息失败。',
    zhHant: '複製診斷資訊失敗。',
  );

  String get accessTitle =>
      tr(en: 'Permissions', ru: 'Разрешения', zhHans: '权限', zhHant: '權限');

  String get listenerAccess => tr(
    en: 'Notification Listener access',
    ru: 'Доступ к уведомлениям',
    zhHans: '通知监听访问',
    zhHant: '通知監聽存取',
  );

  String get postNotifications => tr(
    en: 'Post notifications permission',
    ru: 'Отправка уведомлений',
    zhHans: '发送通知权限',
    zhHant: '發送通知權限',
  );

  String get liveUpdatesAccess => tr(
    en: 'Live Updates promotion',
    ru: 'Продвижение Live Updates',
    zhHans: 'Live Updates 推送权限',
    zhHant: 'Live Updates 推送權限',
  );

  String get settingsTitle =>
      tr(en: 'Settings', ru: 'Настройки', zhHans: '设置', zhHant: '設定');

  String get keepAliveForegroundTitle => tr(
    en: 'Alt background mode',
    ru: 'Альтернативный фоновый режим',
    zhHans: '替代后台模式',
    zhHant: '替代背景模式',
  );

  String get networkSpeedTitle =>
      tr(en: 'Network speed', ru: 'Скорость сети', zhHans: '网速', zhHant: '網速');

  String get networkSpeedThresholdAlways => tr(
    en: 'Always show',
    ru: 'Показывать всегда',
    zhHans: '始终显示',
    zhHant: '永遠顯示',
  );

  String get syncDndTitle => tr(
    en: 'Sync DnD',
    ru: 'Синхронизировать DnD',
    zhHans: '同步勿扰',
    zhHant: '同步勿擾',
  );

  String get updateChecksTitle => tr(
    en: 'Update checking',
    ru: 'Проверка обновлений',
    zhHans: '检查更新',
    zhHant: '檢查更新',
  );

  String get experimentalTitle => tr(
    en: 'Experimental',
    ru: 'Экспериментальное',
    zhHans: '实验功能',
    zhHant: '實驗功能',
  );

  String get aospCuttingTitle => tr(
    en: 'AOSP cutting',
    ru: 'Обрезка AOSP',
    zhHans: 'AOSP 裁剪',
    zhHant: 'AOSP 裁切',
  );

  String get appPresentationSettings => tr(
    en: 'Per-app behavior',
    ru: 'Поведение приложений',
    zhHans: '按应用行为',
    zhHant: '各應用行為',
  );

  String get appPresentationLoadFailed => tr(
    en: 'Unable to load per-app settings.',
    ru: 'Не удалось загрузить настройки приложений.',
    zhHans: '无法加载按应用设置。',
    zhHant: '無法載入各應用設定。',
  );

  String get appPresentationSaveFailed => tr(
    en: 'Unable to save per-app settings.',
    ru: 'Не удалось сохранить настройки приложений.',
    zhHans: '无法保存按应用设置。',
    zhHant: '無法儲存各應用設定。',
  );

  String get appPresentationDownloadFailed => tr(
    en: 'Failed to save settings JSON.',
    ru: 'Не удалось сохранить JSON настроек.',
    zhHans: '保存设置 JSON 失败。',
    zhHant: '儲存設定 JSON 失敗。',
  );

  String get appPresentationSaved => tr(
    en: 'Settings saved to Downloads.',
    ru: 'Настройки сохранены в Загрузки.',
    zhHans: '设置已保存到下载目录。',
    zhHant: '設定已儲存到下載資料夾。',
  );

  String get appPresentationUploadDone => tr(
    en: 'Per-app settings imported.',
    ru: 'Настройки приложений загружены.',
    zhHans: '已导入按应用设置。',
    zhHant: '已匯入各應用設定。',
  );

  String get appPresentationUploadFailed => tr(
    en: 'Failed to import settings JSON.',
    ru: 'Не удалось загрузить JSON настроек.',
    zhHans: '导入设置 JSON 失败。',
    zhHant: '匯入設定 JSON 失敗。',
  );

  String get appPresentationInvalidJson => tr(
    en: 'Invalid per-app settings JSON.',
    ru: 'Невалидный JSON настроек приложений.',
    zhHans: '按应用设置 JSON 无效。',
    zhHant: '各應用設定 JSON 無效。',
  );

  String get downloadSettings => tr(
    en: 'Download settings',
    ru: 'Скачать настройки',
    zhHans: '下载设置',
    zhHant: '下載設定',
  );

  String get uploadSettings => tr(
    en: 'Upload settings',
    ru: 'Загрузить настройки',
    zhHans: '上传设置',
    zhHant: '上傳設定',
  );

  String get save =>
      tr(en: 'Save', ru: 'Сохранить', zhHans: '保存', zhHant: '儲存');

  String get appsLoadFailed => tr(
    en: 'Unable to load installed apps list.',
    ru: 'Не удалось загрузить список приложений.',
    zhHans: '无法加载已安装应用列表。',
    zhHant: '無法載入已安裝應用清單。',
  );

  String get appsAccessTitle => tr(
    en: 'App list access',
    ru: 'Доступ к списку приложений',
    zhHans: '应用列表访问',
    zhHant: '應用清單存取',
  );

  String get appsAccessMessage => tr(
    en: 'Allow LiveBridge to read installed apps so you can pick apps for rules?',
    ru: 'Разрешить LiveBridge читать список установленных приложений для выбора правил?',
    zhHans: '允许 LiveBridge 读取已安装应用列表，以便为规则选择应用吗？',
    zhHant: '允許 LiveBridge 讀取已安裝應用清單，以便為規則選擇應用程式嗎？',
  );

  String get appsAccessSaveFailed => tr(
    en: 'Unable to save access preference.',
    ru: 'Не удалось сохранить выбор доступа.',
    zhHans: '无法保存访问偏好。',
    zhHant: '無法儲存存取偏好。',
  );

  String get cancel =>
      tr(en: 'Cancel', ru: 'Отмена', zhHans: '取消', zhHant: '取消');

  String get allow =>
      tr(en: 'Allow', ru: 'Разрешить', zhHans: '允许', zhHant: '允許');

  String get textProgressTitle => tr(
    en: 'Text progress',
    ru: 'Текстовые прогрессы',
    zhHans: '文本进度',
    zhHant: '文字進度',
  );
}
