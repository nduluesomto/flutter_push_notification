# flutter_push_notification

Задач для пуш уведомлений в Firebase

# Проблемы с реализацией Push-уведомлений на iOS Эмуляторе

Этот проект использует Firebase для отправки push-уведомлений. Однако, на данный момент push-уведомления могут быть реализованы только на Android-эмуляторе, а на iOS-эмуляторе возникают проблемы. В этом файле я объясняю причины, почему push-уведомления не работают на iOS-эмуляторе, и что нужно для их правильной настройки.

## Причины

### 1. Необходимость в платной учетной записи разработчика для iOS
Для настройки push-уведомлений на устройствах iOS вам нужно иметь платную учетную запись разработчика Apple. Бесплатные учетные записи разработчиков Apple не предоставляют доступ к необходимым возможностям для отправки push-уведомлений, таким как создание сертификатов и настройка сервисов Apple Push Notification Service (APNs).

### 2. Создание сертификатов с помощью "Keychain Access" на Mac
Для настройки push-уведомлений на iOS необходимо создать определенные сертификаты через утилиту "Keychain Access" на вашем Mac. Эти сертификаты необходимы для правильной интеграции с сервисами APNs. Без их создания push-уведомления не могут быть отправлены на устройства iOS.

### 3. Проблемы с командой `_firebaseMessaging.getToken()`
Команда `_firebaseMessaging.getToken()` может не работать должным образом на iOS-эмуляторе, что мешает получению токенов для push-уведомлений. На данный момент известна проблема с этой командой, и решение можно найти по следующей ссылке:  
[GitHub Issue: firebase/flutterfire#13558](https://github.com/firebase/flutterfire/issues/13558)

На Android-эмуляторе эта команда работает корректно, что позволяет получать токены и отправлять push-уведомления.

## Рекомендации

Для успешной реализации push-уведомлений на устройствах iOS:
- Получите платную учетную запись разработчика Apple.
- Создайте необходимые сертификаты через "Keychain Access" на вашем Mac.
- Используйте реальные устройства для тестирования push-уведомлений, так как iOS-эмулятор ограничен в возможностях для работы с APNs.

На Android-эмуляторе push-уведомления работают без подобных ограничений, и вы можете продолжать разработку и тестирование на нем.

## Заключение

Push-уведомления на iOS-эмуляторе не работают из-за ограничений Apple и проблем с интеграцией Firebase. Однако, после выполнения всех необходимых шагов, вы сможете успешно настроить push-уведомления на реальных устройствах iOS.

