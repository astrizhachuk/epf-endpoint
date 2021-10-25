# Описание проекта

См. [gitlab-services](https://github.com/astrizhachuk/gitlab-services)

Пример реализации http-сервиса по работе с внешними отчетами и обработками в информационной базе (справочник "Внешние обработки" взят из УТ 10.3).

Описание api [тут](./api/epf-endpoint.yaml) или [тут](https://app.swaggerhub.com/apis/astrizhachuk/epf-endpoint/2.3.0).

Имплементация api - в сервисах `Infobase` и `ExternalDataProcessors`. Общий модуль `ВнешниеОтчетыИОбработки` - адаптер между api сервисов и информационной базой. Справочник "ВнешниеОбработки" - конкретная реализация интерфейса.

Предполагается, что для успешного внедрения в некую конфигурацию потребуется модифицировать лишь нижний слой абстракции (модуль менеджера для справочника, регистров и т. д.). В противном случае, вероятнее всего - это повод для issue.

## Инструменты

* Разработка ведется в [EDT](https://releases.1c.ru/project/DevelopmentTools10). Проект создан по [bootstrap-1c](https://github.com/astrizhachuk/bootstrap-1c);
* Платформа 1С не ниже 8.3.10.2667.
* Модульные тесты EDT [1CUnits](https://github.com/DoublesunRUS/ru.capralow.dt.unit.launcher) - в расширении, см. [./Endpoint.Tests](./Endpoint.Tests)

## Внедрение

По подсистеме `ВнешниеОтчетыИОбработки`.

### Роли

Пользователям назначить необходимые роли. Каждой роли назначен соответствующий ей набор сервисов:

* ПросмотрСведенийОбИнформационнойБазе
* ПросмотрВнешнихОбработок
* ЗагрузкаВнешнихОбработок

## Примеры

### Информация о текущей базе и версии конфигурации

```bash
curl --location --request GET 'http://localhost/hs/infobase' \
--header 'Authorization: Basic RXh0ZXJuYWxEYXRhUHJvY2Vzc29yczpFeHRlcm5hbERhdGFQcm9jZXNzb3Jz'
```

```json
{
    "config_version": "10.3.85.1610",
    "connection_string": "Srvr=\"server.ru\";Ref=\"dev-ut\";"
}
```

### Поиск внешних обработок по имени файла

```bash
curl --location --request GET 'http://localhost/hs/epf/findByFilename?query=Выгрузка на сайт отчетов по баллам FTP.epf' \
--header 'Authorization: Basic RXh0ZXJuYWxEYXRhUHJvY2Vzc29yczpFeHRlcm5hbERhdGFQcm9jZXNzb3Jz'
```

```json
[
    {
        "guid": "7f12a5fd-87e7-11e5-84ad-002590c8c7ee",
        "filename": "Выгрузка на сайт отчетов по баллам FTP.epf",
        "comment": "Размер:13 711 байт; изменен:10.11.2015 20:16:01; сохранен в ИБ:10.11.2015 23:13:20 ,загрузил:  Иванов Иван Иванович ,изменение от 10.11.2015 23:13:20, компьютер: WORKBOOK, RDP: VTRM14"
    },
    {
        "guid": "08450f06-b667-11e4-9ab8-002590c8c7ee",
        "filename": "Выгрузка на сайт отчетов по баллам FTP.epf",
        "comment": "Размер:12 376 байт; изменен:28.09.2015 12:37:21; сохранен в ИБ:28.09.2015 11:37:41 ,загрузил:  Петров Петр Петрович ,изменение от 28.09.2015 11:37:41, компьютер: IT29, RDP: VTRM14"
    }
]
```

### Найти внешнюю обработку по GUID

```bash
curl --location --request GET 'http://localhost/hs/epf/7f12a5fd-87e7-11e5-84ad-002590c8c7ee' \
--header 'Authorization: Basic RXh0ZXJuYWxEYXRhUHJvY2Vzc29yczpFeHRlcm5hbERhdGFQcm9jZXNzb3Jz'
```

```json
{
    "guid": "7f12a5fd-87e7-11e5-84ad-002590c8c7ee",
    "filename": "Выгрузка на сайт отчетов по баллам FTP.epf",
    "comment": "Размер:13 711 байт; изменен:10.11.2015 20:16:01; сохранен в ИБ:10.11.2015 23:13:20 ,загрузил:  Иванов Иван Иванович ,изменение от 10.11.2015 23:13:20, компьютер: WORKBOOK, RDP: VTRM14",
    "tables": []
}
```

### Обновление файла внешней обработки

```bash
curl -X 'POST' \
  'http://localhost/test/hs/epf/uploadFile' \
  -H 'accept: application/json' \
  -H 'name: %D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BB%D0%B8%D1%89%D0%B5%D0%9C%D0%B0%D0%BA%D0%B5%D1%82%D0%B0%D0%A2%D0%B5%D1%81%D1%82.epf' \
  -H 'Authorization: Basic RXh0ZXJuYWxEYXRhUHJvY2Vzc29yczpFeHRlcm5hbERhdGFQcm9jZXNzb3Jz' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d '--OMMIT--'
```

```json
{
    "uploaded": [
        {
            "guid": "e7eaa020-62a1-11e9-80c6-00259036a193",
            "filename": "ХранилищеМакета.epf",
            "comment": "Размер: 20 790 байт; изменен: 25.10.2021 11:54:40; загружен в ИБ: 25.10.2021 11:54:40; загружено из внешнего хранилища."
        }
    ],
    "errors": []
}
```

## Модульное тестирование в EDT

* Опубликуйте сервис с помощью встроенного в EDT сервера Apache2.4 (имя публикации `test`). Сервис должен быть доступен по адресу `http://localhost/test/hs/epf/version`. При иных параметрах публикации необходимо изменить исходные данные в тестах.
* Запустите модульные тесты в EDT.
