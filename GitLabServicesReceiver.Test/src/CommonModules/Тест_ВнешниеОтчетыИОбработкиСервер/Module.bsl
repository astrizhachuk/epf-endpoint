#Область СлужебныйПрограммныйИнтерфейс

// @unit-test
Процедура Тест_Представление(Фреймворк) Экспорт

	Результат = ВнешниеОтчетыИОбработкиСервер.Представление();
	Фреймворк.ПроверитьРавенство(Результат, "Внешние отчеты и обработки (сервер)");
	
КонецПроцедуры

// @unit-test
Процедура Тест_JSONСхемаОтвета(Фреймворк) Экспорт

	Результат = ВнешниеОтчетыИОбработкиСервер.JSONСхемаОтвета( Неопределено );
	Фреймворк.ПроверитьРавенство(Результат, "{}");
	
	Данные = Новый Структура();
	Данные.Вставить( "type", "info" );
	Результат = ВнешниеОтчетыИОбработкиСервер.JSONСхемаОтвета( Данные );
	Фреймворк.ПроверитьРавенство(Результат, "{}");

	Данные = Новый Структура();
	Данные.Вставить( "Тип", "тест1" );
	Данные.Вставить( "Сообщение", "тест2" );
	Результат = ВнешниеОтчетыИОбработкиСервер.JSONСхемаОтвета( Данные );
	ЭталонJSON = "{
			|""type"": ""тест1"",
			|""message"": ""тест2""
			|}";
	
	Фреймворк.ПроверитьРавенство(Результат, ЭталонJSON);
	
КонецПроцедуры

// @unit-test
Процедура Тест_СтруктураОтвета(Фреймворк) Экспорт

	Результат = ВнешниеОтчетыИОбработкиСервер.СтруктураОтвета();
	Фреймворк.ПроверитьРавенство(Результат.Количество(), 2);
	Фреймворк.ПроверитьИстину(Результат.Свойство("Тип"));
	Фреймворк.ПроверитьИстину(Результат.Свойство("Сообщение"));
	
КонецПроцедуры

// @unit-test
Процедура Тест_ОбновитьДанныеВХранилищеЗначенийПоИмениФайла(Фреймворк) Экспорт

	// BSLLS-выкл.
	НачатьТранзакцию();
	// BSLLS-вкл. 
	
	Попытка
		ДвоичныеДанные = Новый ДвоичныеДанные(Фреймворк.КаталогПроекта + "\test\Файлы\Внешняя Обработка 1.epf");
		Адрес = ПоместитьВоВременноеХранилище(ДвоичныеДанные);
		ИмяВременногоФайла = ПолучитьИмяВременногоФайла("epf");
		ВременныйФайл = Новый Файл(ИмяВременногоФайла);
		ДвоичныеДанные.Записать(ВременныйФайл.ПолноеИмя);
		ОписаниеФайла = Справочники.ВнешниеОбработки.ОписаниеФайлаИсточникаДанных(ВременныйФайл);

		НовыйЭлемент = Справочники.ВнешниеОбработки.СоздатьЭлемент();
		НовыйЭлемент.ОбменДанными.Загрузка = Истина;
		НовыйЭлемент.Наименование = "Тест1";
		НовыйЭлемент.ВидОбработки = Перечисления.ВидыДополнительныхВнешнихОбработок.Обработка;
		НовыйЭлемент.Записать();
		Справочники.ВнешниеОбработки.УстановитьДанныеВХранилищеЗначений(НовыйЭлемент.Ссылка, ОписаниеФайла, Адрес, 0);
		
		ДвоичныеДанныеНовые = Новый ДвоичныеДанные(Фреймворк.КаталогПроекта + "\test\Файлы\Внешняя Обработка 2.epf");
		Результат = ВнешниеОтчетыИОбработкиСервер.РезультатОбновленияИнформационнойБазы(
																					ОписаниеФайла.Имя,
																					ДвоичныеДанныеНовые);
																					
		Фреймворк.ПроверитьРавенство(Результат.Тип, "info");
		Фреймворк.ПроверитьРавенство(Результат.Сообщение, "Файлы успешно заменены.");
		
		НовыйЭлемент.Прочитать();
		Фреймворк.ПроверитьРавенство(НовыйЭлемент.ХранилищеВнешнейОбработки.Получить().Размер(), 5920);
		
		Если ТранзакцияАктивна() Тогда
			УдалитьФайлы(ИмяВременногоФайла);
			УдалитьИзВременногоХранилища(Адрес);
			ОтменитьТранзакцию();
		КонецЕсли;
	
	Исключение
		
		Если ТранзакцияАктивна() Тогда
			УдалитьФайлы(ИмяВременногоФайла);
			УдалитьИзВременногоХранилища(Адрес);
			// BSLLS-выкл.
			ОтменитьТранзакцию();
			// BSLLS-вкл.
		КонецЕсли;
		
		ВызватьИсключение;
			
	КонецПопытки;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции



#КонецОбласти