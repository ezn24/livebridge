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
    return scriptCode == 'hant' || countryCode == 'tw' || countryCode == 'hk' || countryCode == 'mo';
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

  String get refresh => tr(en: 'Refresh', ru: 'Обновить', zhHans: '刷新', zhHant: '重新整理');
  String get saved => tr(en: 'Settings saved.', ru: 'Настройки сохранены.', zhHans: '设置已保存。', zhHant: '設定已儲存。');
  String get saveFailed =>
      tr(en: 'Unable to save settings.', ru: 'Не удалось сохранить настройки.', zhHans: '无法保存设置。', zhHant: '無法儲存設定。');
  String get permissionGranted => isRu
      ? 'Разрешение на уведомления выдано.'
      : 'Notification permission granted.';
  String get permissionDenied => isRu
      ? 'Разрешение на уведомления не выдано.'
      : 'Notification permission was not granted.';
  String get listenerOpened => isRu
      ? 'Открыты настройки Notification Listener.'
      : 'Opened Notification Listener settings.';
  String get listenerUnavailable => isRu
      ? 'Не удалось открыть настройки Listener.'
      : 'Unable to open Listener settings on this device.';
  String get notificationsOpened => isRu
      ? 'Открыты настройки уведомлений приложения.'
      : 'Opened app notification settings.';
  String get notificationsUnavailable => isRu
      ? 'Не удалось открыть настройки уведомлений.'
      : 'Unable to open app notification settings.';
  String get liveUpdatesOpened => isRu
      ? 'Открыты настройки Live Updates.'
      : 'Opened Live Updates settings.';
  String get liveUpdatesUnavailable => isRu
      ? 'Не удалось открыть настройки Live Updates.'
      : 'Unable to open Live Updates settings on this device.';
  String get githubOpenFailed => isRu
      ? 'Не удалось открыть ссылку GitHub.'
      : 'Unable to open GitHub link.';
  String get dictionaryEmpty => isRu
      ? 'Словарь пустой или поврежден.'
      : 'Dictionary is empty or invalid.';
  String get dictionaryDownloadFailed =>
      tr(en: 'Failed to export dictionary.', ru: 'Не удалось выгрузить словарь.', zhHans: '导出词典失败。', zhHant: '匯出字典失敗。');
  String get dictionarySaved =>
      tr(en: 'Dictionary saved to Downloads.', ru: 'Словарь сохранен в Загрузки.', zhHans: '词典已保存到下载。', zhHant: '字典已儲存到下載資料夾。');
  String get dictionaryUploadDone => isRu
      ? 'Пользовательский словарь загружен.'
      : 'Custom dictionary uploaded.';
  String get dictionaryUpdateDone =>
      tr(en: 'Dictionary updated from GitHub.', ru: 'Словарь обновлен из GitHub.', zhHans: '词典已从 GitHub 更新。', zhHant: '字典已從 GitHub 更新。');
  String get dictionaryInvalid =>
      tr(en: 'Invalid dictionary JSON.', ru: 'Невалидный JSON словаря.', zhHans: '词典 JSON 无效。', zhHant: '字典 JSON 無效。');
  String get dictionaryUploadFailed =>
      tr(en: 'Failed to upload dictionary.', ru: 'Не удалось загрузить словарь.', zhHans: '上传词典失败。', zhHant: '上傳字典失敗。');
  String get dictionaryUpdateFailed => isRu
      ? 'Не удалось обновить словарь из GitHub.'
      : 'Failed to update dictionary from GitHub.';
  String get dictionaryResetDone => isRu
      ? 'Возвращен словарь из приложения.'
      : 'Bundled dictionary restored.';
  String get dictionaryResetFailed =>
      tr(en: 'Failed to reset dictionary.', ru: 'Не удалось сбросить словарь.', zhHans: '重置词典失败。', zhHant: '重設字典失敗。');

  String get heroTitle => 'LiveBridge';
  String get masterToggleLockedHint => isRu
      ? 'Сначала выдайте доступ к уведомлениям и разрешение на уведомления.'
      : 'Grant notification listener access and notifications permission first.';
  String get githubUrl => 'github.com/appsfolder/livebridge';
  String get githubReleasesUrl => 'github.com/appsfolder/livebridge/releases';
  String get downloadPageUrl => 'appsfolder.github.io/livebridge';
  String get reportBug => tr(en: 'Report a bug', ru: 'Сообщить о баге', zhHans: '报告问题', zhHant: '回報問題');
  String get bugReportCopied => isRu
      ? 'Диагностика скопирована в буфер. Вставьте в issue.'
      : 'Diagnostics copied to clipboard. Paste it into the issue.';
  String get bugReportCopyFailed => isRu
      ? 'Не удалось скопировать диагностику.'
      : 'Failed to copy diagnostics.';
  String get hideWarningBanner => tr(en: 'Hide', ru: 'Скрыть', zhHans: '隐藏', zhHant: '隱藏');
  String get backgroundWarningTitle =>
      tr(en: 'Background mode warning', ru: 'Важно для фоновой работы', zhHans: '后台模式提示', zhHant: '背景模式提醒');
  String backgroundWarningBody(String deviceLabel) => isRu
      ? 'Для $deviceLabel нужно вручную разрешить автозапуск и работу без ограничений в фоне, иначе Live Updates могут не появляться или зависать.'
      : 'On $deviceLabel, allow autostart and unrestricted background activity, otherwise Live Updates may stop appearing or freeze.';
  String get samsungWarningTitle => isRu
      ? 'Для Samsung есть версия лучше'
      : 'A better build is available for Samsung';
  String get samsungWarningBody => isRu
      ? 'Для Samsung доступна специальная сборка LiveBridge с улучшенной поддержкой Samsung-функций. Лучше установить ее вместо обычной версии.'
      : 'There is a dedicated LiveBridge build for Samsung devices with improved Samsung-specific support. It is recommended over the regular build.';
  String get samsungWarningAction =>
      tr(en: 'Get Samsung build', ru: 'Открыть загрузки');

  String get accessTitle => tr(en: 'Permissions', ru: 'Разрешения', zhHans: '权限', zhHant: '權限');
  String get accessSubtitle => isRu
      ? 'Без этих трёх разрешений конвертация будет работать нестабильно.'
      : 'Conversion reliability depends on these three permissions.';
  String get listenerAccess =>
      tr(en: 'Notification Listener access', ru: 'Доступ к уведомлениям');
  String get postNotifications =>
      tr(en: 'Post notifications permission', ru: 'Отправка уведомлений');
  String get liveUpdatesAccess =>
      tr(en: 'Live Updates promotion', ru: 'Продвижение Live Updates');
  String get open => tr(en: 'Open', ru: 'Открыть', zhHans: '打开', zhHant: '開啟');
  String get request => tr(en: 'Request', ru: 'Запросить', zhHans: '请求', zhHant: '請求');
  String get grant => tr(en: 'Grant', ru: 'Выдать', zhHans: '授予', zhHant: '授權');
  String get manage => tr(en: 'Manage', ru: 'Управлять', zhHans: '管理', zhHant: '管理');
  String get settingsTitle => tr(en: 'Settings', ru: 'Настройки', zhHans: '设置', zhHant: '設定');
  String get keepAliveForegroundTitle =>
      tr(en: 'Alt background mode', ru: 'Альтернативный фоновый режим');
  String get keepAliveForegroundSubtitle => isRu
      ? 'Держит foreground-сервис для более стабильной работы в фоне.'
      : 'Runs a persistent foreground service for better background stability.';
  String get keepAliveForegroundInactiveSubtitle => isRu
      ? 'Включите LiveBridge, чтобы режим начал работать.'
      : 'Enable the LiveBridge for this mode to take effect.';
  String get networkSpeedTitle => tr(en: 'Network speed', ru: 'Скорость сети', zhHans: '网速', zhHant: '網速');
  String get networkSpeedSubtitle => isRu
      ? 'Показывает загрузку и отдачу как отдельный Live Update в статус-баре.'
      : 'Shows current download and upload as a separate Live Update in the status bar.';
  String get networkSpeedInactiveSubtitle => isRu
      ? 'Включите LiveBridge, чтобы монитор скорости начал работать.'
      : 'Enable LiveBridge for the network speed monitor to start working.';
  String get networkSpeedThresholdTitle =>
      tr(en: 'Minimum speed to show', ru: 'Минимальная скорость для показа');
  String get networkSpeedThresholdSubtitle => isRu
      ? 'Лайв-элемент появится, когда суммарная скорость загрузки и отдачи достигнет этого порога.'
      : 'The live element appears when combined download and upload reach this threshold.';
  String get networkSpeedThresholdAlways =>
      tr(en: 'Always show', ru: 'Показывать всегда', zhHans: '始终显示', zhHant: '永遠顯示');
  String get smartExternalDevicesIgnoreDebuggingTitle =>
      tr(en: 'Ignore debugging', ru: 'Игнорировать отладку');
  String get smartExternalDevicesIgnoreDebuggingSubtitle => isRu
      ? 'Не показывать Live для USB debugging, wireless debugging, ADB и похожих системных уведомлений.'
      : 'Skip Live updates for USB debugging, wireless debugging, ADB, and similar system notifications.';
  String get syncDndTitle => tr(en: 'Sync DnD', ru: 'Синхронизировать DnD', zhHans: '同步勿扰', zhHant: '同步勿擾');
  String get syncDndSubtitle => isRu
      ? 'Если на смартфоне включен режим Не беспокоить, уведомления LiveBridge не показываются.'
      : 'When Do Not Disturb is enabled on the phone, LiveBridge notifications are hidden.';
  String get updateChecksTitle =>
      tr(en: 'Update checking', ru: 'Проверка обновлений', zhHans: '检查更新', zhHant: '檢查更新');
  String get updateChecksSubtitle => isRu
      ? 'Проверять обновления при входе и не чаще одного раза в 6 часов.'
      : 'Check updates on app start, and no more than once every 6 hours.';
  String updateAvailableBanner(String version) => isRu
      ? 'Доступно обновление${version.isNotEmpty ? ': $version' : ''}'
      : 'Update available${version.isNotEmpty ? ': $version' : ''}';
  String get experimentalTitle => tr(en: 'Experimental', ru: 'Экспериментальное', zhHans: '实验功能', zhHant: '實驗功能');
  String get notificationDedupTitle =>
      tr(en: 'Notification dedup', ru: 'Notification dedup');
  String get notificationDedupSubtitle => isRu
      ? 'Убирает оригинальные clearable-уведомления, если LiveBridge уже показал свой OTP или статус.'
      : 'Dismisses original clearable notifications after LiveBridge mirrors an OTP or status update.';
  String get notificationDedupModeLabel =>
      tr(en: 'Dedup mode', ru: 'Режим dedup');
  String get notificationDedupModeOtpStatus => isRu
      ? 'OTP и статусы'
      : 'OTP and statuses';
  String get notificationDedupModeOtpOnly =>
      tr(en: 'OTP only', ru: 'Только OTP');
  String get notificationDedupStatusesTitle => isRu
      ? 'Также статусы'
      : 'Also dedup statuses';
  String get notificationDedupStatusesSubtitle => isRu
      ? 'Если выключено, dedup применяется только к OTP-кодам.'
      : 'When disabled, dedup is applied only to OTP notifications.';
  String get animatedIslandTitle =>
      tr(en: 'Animated island', ru: 'Анимированный остров');
  String get animatedIslandSubtitle => isRu
      ? 'Меняет короткий текст острова каждые 2-3 секунды для smart-уведомлений (может работать нестабильно).'
      : 'Rotates compact island text every 2-3 seconds for smart notifications (may be unstable).';
  String get hyperBridgeTitle => 'Xiaomi Hyper Island';
  String get hyperBridgeSubtitle => isRu
      ? 'Для Xiaomi Hyper OS 3.1 Глобальной: добавляет HyperOS Focus-параметры для нативного острова.'
      : 'For Xiaomi Hyper OS 3.1 Global: injects HyperOS Focus parameters for native island behavior.';
  String get aospCuttingTitle => tr(en: 'AOSP cutting', ru: 'Обрезка AOSP');
  String get aospCuttingSubtitle => isRu
      ? 'Обрезать информацию в острове до 7 символов для красивого отображения в AOSP-прошивках.'
      : 'Trim island text to 7 characters for cleaner rendering on AOSP ROMs.';
  String get appPresentationSettings =>
      tr(en: 'Per-app behavior', ru: 'Поведение приложений', zhHans: '按应用行为', zhHant: '各應用行為');
  String get appPresentationSubtitle => isRu
      ? 'Настройте источник текста и иконки отдельно для разных приложений.'
      : 'Choose text and icon behavior separately for different applications.';
  String get appPresentationScreenTitle =>
      tr(en: 'Per-app behavior', ru: 'Поведение приложений');
  String get appPresentationLoadFailed => isRu
      ? 'Не удалось загрузить настройки приложений.'
      : 'Unable to load per-app settings.';
  String get appPresentationSaveFailed => isRu
      ? 'Не удалось сохранить настройки приложений.'
      : 'Unable to save per-app settings.';
  String get appPresentationDownloadFailed => isRu
      ? 'Не удалось сохранить JSON настроек.'
      : 'Failed to save settings JSON.';
  String get appPresentationSaved =>
      tr(en: 'Settings saved to Downloads.', ru: 'Настройки сохранены в Загрузки.');
  String get appPresentationUploadDone =>
      tr(en: 'Per-app settings imported.', ru: 'Настройки приложений загружены.');
  String get appPresentationUploadFailed => isRu
      ? 'Не удалось загрузить JSON настроек.'
      : 'Failed to import settings JSON.';
  String get appPresentationInvalidJson => isRu
      ? 'Невалидный JSON настроек приложений.'
      : 'Invalid per-app settings JSON.';
  String get appPresentationDefaultSummary =>
      tr(en: 'Default behavior', ru: 'Стандартное поведение');
  String get appPresentationTextSourceLabel =>
      tr(en: 'Island text source', ru: 'Источник текста для острова');
  String get appPresentationIconSourceLabel =>
      tr(en: 'Icon source', ru: 'Источник иконки');
  String get appPresentationTextTitle =>
      tr(en: 'Notification title', ru: 'Title уведомления');
  String get appPresentationTextNotification =>
      tr(en: 'Notification text', ru: 'Текст уведомления');
  String get appPresentationIconNotification =>
      tr(en: 'Notification icon', ru: 'Иконка уведомления');
  String get appPresentationIconApp =>
      tr(en: 'Application icon', ru: 'Иконка приложения');
  String get downloadSettings =>
      tr(en: 'Download settings', ru: 'Скачать настройки', zhHans: '下载设置', zhHant: '下載設定');
  String get uploadSettings => tr(en: 'Upload settings', ru: 'Загрузить настройки', zhHans: '上传设置', zhHant: '上傳設定');
  String get defaultLabel => tr(en: 'Default', ru: 'По умолчанию');
  String get resetToDefault =>
      tr(en: 'Reset to default', ru: 'Сбросить к стандарту');
  String get save => tr(en: 'Save', ru: 'Сохранить', zhHans: '保存', zhHant: '儲存');
  String get downloadDictionary =>
      tr(en: 'Download dictionary', ru: 'Скачать словарь');
  String get updateDictionary =>
      tr(en: 'Update dictionary', ru: 'Обновить словарь');
  String get uploadDictionary =>
      tr(en: 'Upload dictionary', ru: 'Загрузить словарь');
  String get resetDictionary => tr(en: 'Reset dictionary', ru: 'Сбросить словарь');
  String get pickApps => tr(en: 'Pick applications', ru: 'Выбрать приложения', zhHans: '选择应用', zhHant: '選擇應用程式');
  String get pickerTitle =>
      tr(en: 'Choose apps for conversion', ru: 'Приложения для конвертации');
  String get otpPickerTitle =>
      tr(en: 'Choose apps for code detection', ru: 'Приложения для кодов');
  String get bypassPickerTitle =>
      tr(en: 'Choose apps for bypass', ru: 'Приложения bypass');
  String get notificationDedupPickerTitle => isRu
      ? 'Приложения для dedup'
      : 'Choose apps for notification dedup';
  String get applySelection => tr(en: 'Apply selection', ru: 'Применить выбор', zhHans: '应用选择', zhHant: '套用選擇');
  String get searchAppHint =>
      tr(en: 'Search by app or package', ru: 'Поиск по названию или пакету');
  String get showSystemApps =>
      tr(en: 'Show system applications', ru: 'Показать системные приложения');
  String get hideSystemApps =>
      tr(en: 'Hide system applications', ru: 'Скрыть системные приложения');
  String get appsLoadFailed => isRu
      ? 'Не удалось загрузить список приложений.'
      : 'Unable to load installed apps list.';
  String get appsAccessTitle =>
      tr(en: 'App list access', ru: 'Доступ к списку приложений');
  String get appsAccessMessage => isRu
      ? 'Разрешить LiveBridge читать список установленных приложений для выбора правил?'
      : 'Allow LiveBridge to read installed apps so you can pick apps for rules?';
  String get appsAccessSaveFailed => isRu
      ? 'Не удалось сохранить выбор доступа.'
      : 'Unable to save access preference.';
  String get cancel => tr(en: 'Cancel', ru: 'Отмена', zhHans: '取消', zhHant: '取消');
  String get allow => tr(en: 'Allow', ru: 'Разрешить', zhHans: '允许', zhHant: '允許');
  String selectedAppsCount(int value) =>
      tr(en: 'Selected apps: $value', ru: 'Выбрано приложений: $value');
  String get noAppsSelected =>
      tr(en: 'No applications selected', ru: 'Приложения не выбраны');

  String get rulesTitle => tr(en: 'Conversion behavior', ru: 'Режим конвертации', zhHans: '转换行为', zhHant: '轉換行為');
  String get rulesSubtitle => isRu
      ? 'Настройте, что именно превращать в Live Updates.'
      : 'Define what should be converted into Live Updates.';
  String get modeLabel => tr(en: 'Application mode', ru: 'Режим работы');
  String get modeAll => tr(en: 'All applications', ru: 'Все приложения', zhHans: '所有应用', zhHant: '所有應用程式');
  String get modeInclude =>
      tr(en: 'Only listed applications', ru: 'Только указанные', zhHans: '仅指定应用', zhHant: '僅指定應用程式');
  String get modeExclude =>
      tr(en: 'Exclude listed applications', ru: 'Исключить указанные', zhHans: '排除指定应用', zhHant: '排除指定應用程式');
  String get pickAppsHint => isRu
      ? 'Список используется только в режимах "Только указанные" или "Исключить".'
      : 'Selected app list is used only for include/exclude modes.';
  String get bypassRulesTitle => tr(en: 'Bypass apps', ru: 'Bypass-приложения');
  String get bypassRulesSubtitle => isRu
      ? 'Приложения из списка всегда конвертируются в Live вне зависимости от настроек.'
      : 'Listed apps are always converted to Live independently of settings.';
  String get saveRules => tr(en: 'Save', ru: 'Сохранить', zhHans: '保存', zhHant: '儲存');

  String get smartDetectionTitle =>
      tr(en: 'Smart status detection', ru: 'Умное распознавание', zhHans: '智能状态识别', zhHant: '智慧狀態辨識');
  String get smartCardTitle =>
      tr(en: 'Smart conversion', ru: 'Умное преобразование');
  String get smartCardSubtitle => isRu
      ? 'Преобразование текстовых этапов в один Live-прогресс.'
      : 'Converts text-only stage updates into one Live progress flow.';
  String get smartDetectionSubtitle => isRu
      ? 'Преобразует текстовые статусы еды, такси и навигации в единый Live-прогресс.'
      : 'Converts text-only food/taxi/navigation status notifications into a single Live.';
  String get smartMediaPlaybackTitle =>
      tr(en: 'Media Playback', ru: 'Media Playback');
  String get smartMediaPlaybackSubtitle => isRu
      ? 'Преобразует уведомления медиаплеера в Live. На некоторых OEM может дублировать нативный плеер.'
      : 'Converts media playback notifications into Live. On some OEMs this may duplicate native media UI.';
  String get smartNavigationTitle =>
      tr(en: 'Navigation (maps)', ru: 'Навигация (карты)');
  String get smartNavigationSubtitle => isRu
      ? 'Распознавание уведомлений навигации.'
      : 'Navigation notification detection.';
  String get smartWeatherTitle => tr(en: 'Weather', ru: 'Погода');
  String get smartWeatherSubtitle => isRu
      ? 'Распознавание погодных уведомлений (температура в острове).'
      : 'Weather notification detection (temperature in island).';
  String get smartExternalDevicesTitle =>
      tr(en: 'External devices', ru: 'Внешние устройства');
  String get smartExternalDevicesSubtitle => isRu
      ? 'Показывает статус connected/connecting и имя устройства в острове.'
      : 'Shows connected/connecting status and device name in island.';
  String get smartVpnTitle => tr(en: 'VPN services', ru: 'VPN-сервисы');
  String get smartVpnSubtitle => isRu
      ? 'Показывает входящий/исходящий трафик в формате *b/s.'
      : 'Shows incoming/outgoing traffic speed in *b/s format.';
  String get smartNavigationDisabledSubtitle => isRu
      ? 'Сначала включите умное распознавание.'
      : 'Enable smart status detection first.';
  String get smartDetectionDisabledSubtitle => isRu
      ? 'Отключено в режиме "Прогресс".'
      : 'Disabled while "Progress" mode is enabled.';
  String get conflictingModesHint => isRu
      ? 'Чтобы работали текстовые статусы, отключите режим "Прогресс".'
      : 'Turn off "Progress" mode to enable food/taxi/navigation text status recognition.';
  String get onlyProgressTitle => tr(en: 'Progress', ru: 'Прогресс', zhHans: '进度', zhHant: '進度');
  String get onlyProgressSubtitle => isRu
      ? 'Если включено, конвертируются только уведомления с системным прогрессбаром.'
      : 'When enabled, only notifications with a system progress bar are converted.';
  String get textProgressTitle =>
      tr(en: 'Text progress', ru: 'Текстовые прогрессы');
  String get textProgressSubtitle => isRu
      ? 'Если в тексте есть %, и это не скидка/акция, считать как прогресс и обновлять остров.'
      : 'If text contains % and it is not discount-related, treat it as progress and update island.';

  String get blockedTitle =>
      tr(en: 'AOSP is partially supported', ru: 'AOSP поддерживается частично', zhHans: 'AOSP 仅部分支持', zhHant: 'AOSP 僅部分支援');
  String get blockedSubtitle => isRu
      ? 'LiveBridge плохо работает на устройствах с AOSP. Можете продолжить, но за последствия я не отвечаю.'
      : 'LiveBridge is not designed for AOSP. You can continue, but i am not responsible for any bugs.';
  String get blockedBypassAction =>
      tr(en: 'Continue anyway', ru: 'Все равно родолжить', zhHans: '仍然继续', zhHant: '仍要繼續');
  String get blockedBypassSaveFailed =>
      tr(en: 'Unable to save your choice.', ru: 'Не удалось сохранить выбор.');

  String get otpTitle => tr(en: 'Verification codes', ru: 'Коды подтверждения', zhHans: '验证码', zhHant: '驗證碼');
  String get otpSubtitle => isRu
      ? 'Показывает код компактно в острове.'
      : 'Shows the code in compact island.';
  String get otpEnabledTitle =>
      tr(en: 'Detect verification codes', ru: 'Распознавать 2FA коды');
  String get otpEnabledSubtitle => isRu
      ? 'В свернутом Live-острове показывается сам код.'
      : 'Shows the numeric code in the compact island.';
  String get otpAutoCopyTitle =>
      tr(en: 'Auto-copy code', ru: 'Автокопирование кода', zhHans: '自动复制验证码', zhHant: '自動複製驗證碼');
  String get otpAutoCopySubtitle => isRu
      ? 'Код сразу копируется в буфер обмена.'
      : 'Code is copied to clipboard automatically.';
  String get otpAutoCopyDisabledSubtitle => isRu
      ? 'Сначала включите распознавание кодов.'
      : 'Enable code detection first.';
  String get otpModeLabel => tr(en: 'Code apps mode', ru: 'Режим для кодов');
  String get saveOtpRules => tr(en: 'Save', ru: 'Сохранить', zhHans: '保存', zhHant: '儲存');
}
