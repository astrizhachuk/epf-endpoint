#Область ПрограммныйИнтерфейс

// НайтиПоИмениФайла возвращает результат поиска внешних обработок по имени файла.
// 
// Параметры:
// 	ИмяФайла - Строка - полное имя файла (с расширением);
// 
// Возвращаемое значение:
//   - Массив из Структура - описание:
//		* Ссылка - СправочникСсылка.ВнешниеОбработки - элемент справочника;
//		* НомерСтроки - Число - номер строки табличной части, если файл найден
//								в табличной части Принадлежность, иначе - 0;
//		* Комментарий - Строка - комментарий к файлу;
//
Функция НайтиПоИмениФайла( Знач ИмяФайла ) Экспорт
	
	Перем Запрос;
	Перем РезультатЗапроса;
	Перем Выборка;
	Перем МетаданныеФайла;
	Перем Результат;
	
	Результат = Новый Массив();
	
	Если ( ПустаяСтрока(ИмяФайла) ) Тогда
		
		Возврат Результат;
		
	КонецЕсли;
	
	Запрос = Новый Запрос();
	Запрос.УстановитьПараметр( "СтрокаПоиска", ИмяФайла );
	Запрос.Текст = 	"ВЫБРАТЬ РАЗЛИЧНЫЕ
					|	ВнешниеОбработки.Ссылка КАК Ссылка,
					|	0 КАК НомерСтроки,
					|	ВЫРАЗИТЬ(ВнешниеОбработки.КомментарийКФайлуИсточнику КАК СТРОКА(260)) КАК Комментарий
					|ИЗ
					|	Справочник.ВнешниеОбработки КАК ВнешниеОбработки
					|ГДЕ
					|	ВнешниеОбработки.ИмяФайла = &СтрокаПоиска
					|
					|ОБЪЕДИНИТЬ ВСЕ
					|
					|ВЫБРАТЬ РАЗЛИЧНЫЕ
					|	ВнешниеОбработкиПринадлежность.Ссылка,
					|	ВнешниеОбработкиПринадлежность.НомерСтроки,
					|	ВЫРАЗИТЬ(ВнешниеОбработкиПринадлежность.КомментарийКФайлуИсточнику КАК СТРОКА(260))
					|ИЗ
					|	Справочник.ВнешниеОбработки.Принадлежность КАК ВнешниеОбработкиПринадлежность
					|ГДЕ
					|	ВЫРАЗИТЬ(ВнешниеОбработкиПринадлежность.ИмяФайлаПечатнойФормы КАК СТРОКА(260)) = &СтрокаПоиска";

	РезультатЗапроса = Запрос.Выполнить();
	
	Если ( РезультатЗапроса.Пустой() ) Тогда
		
		Возврат Результат;
		
	КонецЕсли;
	
	Выборка = РезультатЗапроса.Выбрать(); 
	
	Пока Выборка.Следующий() Цикл
		
		МетаданныеФайла = МетаданныеФайла();
		ЗаполнитьЗначенияСвойств( МетаданныеФайла, Выборка );
		Результат.Добавить( МетаданныеФайла );
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// СохранитьВнешнююОбработку сохраняет в информационную базу файл внешней обработки с заполнением комментария к нему.
// 
// Параметры:
// 	МетаданныеФайла - Структура - описание:
//		* Ссылка - СправочникСсылка.ВнешниеОбработки - элемент справочника;
//		* НомерСтроки - Число - номер строки табличной части или 0,
//								если обработка сохраняется в самом элементе справочника;
// 		* ИмяФайла - Строка - имя файла внешней обработки;
//		* Файл - Файл - дескриптор загружаемого файла;
// 	Данные - ДвоичныеДанные - содержимое (тело) файла;
//
// Возвращаемое значение:
//   - Строка - текст нового комментария к файлу;
// 
Функция СохранитьВнешнююОбработку( МетаданныеФайла, Знач Данные ) Экспорт
	
	Перем ЭлементСправочника;
	Перем НовыйКомментарий;
	Перем НовоеХранилищеЗначения;
	
	ЭлементСправочника = МетаданныеФайла.Ссылка.ПолучитьОбъект();
	
	НовыйКомментарий = НСтр( "ru = ' загружено из внешнего хранилища.';
						|en = ' loaded from external storage.'" );
							
	НовыйКомментарий = ВнешниеОтчетыИОбработкиКлиентСервер.КомментарийКФайлу(
														МетаданныеФайла.Файл,
														ТекущаяДатаСеанса(),
														НовыйКомментарий );
	
	НовоеХранилищеЗначения = Новый ХранилищеЗначения( Данные );
	
	ЭлементСправочника.Заблокировать();
	
	Если ( ЗначениеЗаполнено(МетаданныеФайла.НомерСтроки) ) Тогда
		
		Индекс = МетаданныеФайла.НомерСтроки - 1;
		ЭлементСправочника.Принадлежность[Индекс].ИмяФайлаПечатнойФормы = МетаданныеФайла.ИмяФайла;
		ЭлементСправочника.Принадлежность[Индекс].КомментарийКФайлуИсточнику = НовыйКомментарий;
		ЭлементСправочника.Принадлежность[Индекс].ХранилищеВнешнейОбработки = НовоеХранилищеЗначения;
	
	Иначе
		
		ЭлементСправочника.ИмяФайла = МетаданныеФайла.ИмяФайла;
		ЭлементСправочника.КомментарийКФайлуИсточнику = НовыйКомментарий;
		ЭлементСправочника.ХранилищеВнешнейОбработки = НовоеХранилищеЗначения;
		
	КонецЕсли;

	ЭлементСправочника.Записать();
	
	Возврат НовыйКомментарий;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// МетаданныеФайла возвращает описание файла внешней обработки (место его хранения, комментарии и т. д.).
// 
// Возвращаемое значение:
// 	- Структура - описание:
//		* Ссылка - СправочникСсылка.ВнешниеОбработки - элемент справочника;
//		* НомерСтроки - Число - номер строки табличной части или 0,
//								если обработка хранится в самом элементе справочника);
//		* Комментарий - Строка - комментарий к файлу;
// 
Функция МетаданныеФайла()
	
	Перем Результат;
	
	Результат = Новый Структура();
	Результат.Вставить( "Ссылка" );
	Результат.Вставить( "НомерСтроки" );
	Результат.Вставить( "Комментарий" );
	
	Возврат Результат;
	   
КонецФункции

#КонецОбласти