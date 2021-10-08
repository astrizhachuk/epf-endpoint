# Описание проекта

См. [gitlab-services](https://github.com/astrizhachuk/gitlab-services)

Пример реализации http-сервиса обновления внешний отчетов и обработок в базе-получателе (глубоко модифицированная УТ 10.3).

Описание api [тут](./api/epf.yaml) или [тут](https://app.swaggerhub.com/apis-docs/astrizhachuk/gitlab-services-receiver/1.0.0)

## Инструменты

* Разработка ведется в [EDT](https://releases.1c.ru/project/DevelopmentTools10). Проект создан по [bootstrap-1c](https://github.com/astrizhachuk/bootstrap-1c);
* Платформа 1С не ниже 8.3.10.2667.
* Модульные тесты EDT [1CUnits](https://github.com/DoublesunRUS/ru.capralow.dt.unit.launcher) - в расширении, см. [./GitLabServicesReceiver.Test](./GitLabServicesReceiver.Test)

## Внедрение

По подсистеме `ВнешниеОтчетыИОбработки`.

## Модульное тестирование в EDT

* Опубликуйте сервис с помощью встроенного в EDT сервера Apache2.4 (имя публикации `test`). Сервис должен быть доступен по адресу `http://localhost/test/hs/epf/version`. При иных параметрах публикации необходимо изменить исходные данные в тестах.
* Запустите модульные тесты в EDT.
