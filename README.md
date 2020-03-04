# Описание проекта

См. [gitlab-services](https://github.com/astrizhachuk/gitlab-services)

Пример реализации HTTP-сервиса обновления внешний отчетов и обработок на конечной базе-получателе (глубоко модифицированная УТ 10.3).

[Описание API](https://app.swaggerhub.com/apis-docs/astrizhachuk/epf/1.0.0)

## Инструменты

* Разработка ведется в [EDT](https://releases.1c.ru/project/DevelopmentTools10).
* Платформа 1С не ниже v.8.3.10.2667.
* Модульные тесты EDT [1CUnits](https://github.com/DoublesunRUS/ru.capralow.dt.unit.launcher) - в расширении, см. [./GitLabServicesTarget.Test](./GitLabServicesTarget.Test)

## Внедрение

По подсистеме `ВнешниеОтчетыИОбработки`

Точка интеграции:

``` bsl
ОбщийМодуль.ВнешниеОтчетыИОбработкиСервер.ОбновитьДанныеВХранилищеЗначенийПоИмениФайла()
```
