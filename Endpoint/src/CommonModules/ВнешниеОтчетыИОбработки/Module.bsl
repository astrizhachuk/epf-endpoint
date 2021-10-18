#Область ПрограммныйИнтерфейс

// НайтиПоИдентификатору возвращает результат поиска внешней обработки по GUID
// с описанием мест хранения файлов внешних обработок.
// 
// Параметры:
// 	GUID - УникальныйИдентификатор - уникальный идентификатор ссылки на внешнюю обработку;
// 	
// Возвращаемое значение:
// 	Структура - описание мест хранения файлов внешних обработок:
// * guid - Строка - представление идентификатора ссылки на найденную внешнюю обработку;
// * filename - Строка - полное имя файла внешней обработки;
// * comment - Строка - комментарий к файлу внешней обработки; 
// * tables - Массив из Структура - описание табличных частей, где хранятся файлы внешних обработок:
// 		** guid - Строка - представление идентификатора ссылки внешней обработки (ссылка на родительских элемент);
// 		** filename - Строка - полное имя файла внешней обработки;
// 		** comment - Строка - комментарий к файлу внешней обработки;
// 		** table - Строка - (необязательно) имя табличной части, где хранятся файлы внешних обработок;
// 		** line - Число - (необязательно) номер строки табличной части, где хранится файл внешней обработки;
// 
Функция НайтиПоИдентификатору( Знач GUID ) Экспорт
	
	Перем ВнешняяОбработкаСсылка;
	Перем ВнешняяОбработка;
	Перем Идентификатор;
	Перем ИмяТабличнойЧасти;
	Перем ЗаписьТабличнойЧасти;
	Перем Результат;
	
	ВнешняяОбработкаСсылка = Справочники.ВнешниеОбработки.ПолучитьСсылку( GUID );
	
	Если ( ВнешняяОбработкаСсылка.Пустая() ) Тогда
		
		Возврат Новый Структура();
		
	КонецЕсли;
	
	ВнешняяОбработка = ВнешняяОбработкаСсылка.ПолучитьОбъект();
	
	Если ( ВнешняяОбработка = Неопределено ) Тогда
		
		Возврат Новый Структура();
		
	КонецЕсли;
	
	Идентификатор = Строка( GUID );
	
	Результат = ДетальноеОписание();
	Результат.guid = Идентификатор;
	Результат.filename = ВнешняяОбработка.ИмяФайла;
	Результат.comment = ВнешняяОбработка.КомментарийКФайлуИсточнику;
	
	ИмяТабличнойЧасти = ВнешняяОбработка.Метаданные().ТабличныеЧасти.Принадлежность.Имя;
	
	Для Каждого ТекущаяСтрока Из ВнешняяОбработка.Принадлежность Цикл
		
		ЗаписьТабличнойЧасти = ФайлВТабличнойЧасти();
		ЗаписьТабличнойЧасти.guid = Идентификатор;
		ЗаписьТабличнойЧасти.filename = ТекущаяСтрока.ИмяФайлаПечатнойФормы;	
		ЗаписьТабличнойЧасти.comment = ТекущаяСтрока.КомментарийКФайлуИсточнику;
		ЗаписьТабличнойЧасти.table = ИмяТабличнойЧасти;
		ЗаписьТабличнойЧасти.line = ТекущаяСтрока.НомерСтроки;
		
		Результат.tables.Добавить( ЗаписьТабличнойЧасти );
		
	КонецЦикла;	
	
	Возврат Результат;
	
КонецФункции

// НайтиПоИмениФайла возвращает результат поиска внешних обработок по полному имени файла внешней обработки
// в виде описания всех мест хранения этого файла. 
// 
// Параметры:
// 	ИмяФайла - Строка - полное имя файла (с расширением);
// 	
// Возвращаемое значение:
// 	Массив из Структура - список всех мест хранения файла:
//		* guid - Строка - представление идентификатора ссылки на найденную внешнюю обработку;
// 		* filename - Строка - полное имя файла внешней обработки;
// 		* comment - Строка - комментарий к файлу внешней обработки;
// 		* table - Строка - (необязательно) имя табличной части, где хранится файл найденной внешней обработки;
// 		* line - Число - (необязательно) номер строки табличной части, где хранится файл найденной внешней обработки;
//
Функция НайтиПоИмениФайла( Знач ИмяФайла ) Экспорт
	
	Перем НайденныеОбработки;
	Перем ИмяТабличнойЧасти;
	Перем Идентификатор;
	Перем МетаданныеФайла;
	Перем Результат;

	НайденныеОбработки = Справочники.ВнешниеОбработки.НайтиПоИмениФайла( ИмяФайла );
	
	Результат = Новый Массив();
	
	Если ( НЕ ЗначениеЗаполнено(НайденныеОбработки) ) Тогда
		
		Возврат Результат;
		
	КонецЕсли;
	
	ИмяТабличнойЧасти = Метаданные.Справочники.ВнешниеОбработки.ТабличныеЧасти.Принадлежность.Имя;
	
	Для Каждого ВнешняяОбработка Из НайденныеОбработки Цикл
		
		Идентификатор = Строка( ВнешняяОбработка.Ссылка.УникальныйИдентификатор() );
		
		Если ( ВнешняяОбработка.НомерСтроки = 0 ) Тогда
			
			МетаданныеФайла = ФайлВРеквизитеЭлемента();
			МетаданныеФайла.guid = Идентификатор;
			МетаданныеФайла.filename = ИмяФайла;
			МетаданныеФайла.comment = ВнешняяОбработка.Комментарий;
			
		Иначе
			
			МетаданныеФайла = ФайлВТабличнойЧасти();
			МетаданныеФайла.guid = Идентификатор;
			МетаданныеФайла.filename = ИмяФайла;
			МетаданныеФайла.comment = ВнешняяОбработка.Комментарий;	
			МетаданныеФайла.table = ИмяТабличнойЧасти;
			МетаданныеФайла.line = ВнешняяОбработка.НомерСтроки;

		КонецЕсли;
		
		Результат.Добавить( МетаданныеФайла );
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// ОбновитьФайлВИнформационнойБазе обновляет места хранения файла внешней обработки новыми данными
// с возвратом результата этого обновления. 
//
// Параметры:
// 	ОбновляемыеОбработки - Массив из Структура - список обновляемых внешних обработок:
// 	* guid - Строка - представление идентификатора ссылки на внешнюю обработку;
// 	* filename - Строка - полное имя заменяемого файла;
// 	* table - Строка - (необязательно) имя табличной части, где хранится файл;
// 	* line - Число - (необязательно) номер строки табличной части, где хранится файл;
// 	Данные - ДвоичныеДанные - содержимое (тело) файла;
//
// Возвращаемое значение:
// 	- Структура - описание:
// 	* uploaded - Массив из Структура - описание успешно обновленных внешних обработок:
// 		* guid - Строка - представление идентификатора ссылки обновляемой внешней обработки;
// 		* filename - Строка - полное имя заменяемого файла;
// 		* comment - Строка - комментарий к заменяемому файлу;
// 		* table - Строка - (необязательно) имя табличной части, где производится замена файла;
// 		* line - Число - (необязательно) номер строки табличной части, где производится замена файла;
// 	* errors - Массив из Структура - описание ошибок при обновлении внешних обработок:
// 		* message - Строка - текст ошибки;
// 		* error - Массив из Структура - описание ошибок при обновлении внешних обработок:
// 			** guid - Строка - представление идентификатора ссылки обновляемой внешней обработки;
// 			** filename - Строка - полное имя заменяемого файла;
// 			** comment - Строка - комментарий к заменяемому файлу;
// 			** table - Строка - (необязательно) имя табличной части, где производится замена файла;
// 			** line - Число - (необязательно) номер строки табличной части, где производится замена файла;
//
Функция ОбновитьФайлВИнформационнойБазе( ОбновляемыеОбработки, Знач Данные ) Экспорт
	
	Перем ИмяВременногоФайла;
	Перем Файл;
	Перем МетаданныеФайла;
	Перем ОбновляемаяОбработка;
	Перем ОшибкаЗагрузкиФайла;
	Перем Результат;

	Результат = СхемаЗагрузкиФайла();
	
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла( "epf" );
	Файл = ЗаписатьДанныеВоВременныйФайл( ИмяВременногоФайла, Данные );
	
	Для Каждого КудаЗагружатьФайл Из ОбновляемыеОбработки Цикл
		
		ОбновляемаяОбработка = Новый Структура();
		
		Для Каждого КлючИЗначение Из КудаЗагружатьФайл Цикл
			
			ОбновляемаяОбработка.Вставить( КлючИЗначение.Ключ, КлючИЗначение.Значение );
			
		КонецЦикла;
		
		Попытка
			
			МетаданныеФайла = ПолучитьМетаданныеФайла( ОбновляемаяОбработка, Файл );
			ОбновляемаяОбработка.comment = Справочники
												.ВнешниеОбработки
												.СохранитьВнешнююОбработку( МетаданныеФайла, Данные );
			Результат.uploaded.Добавить( ОбновляемаяОбработка );
			
		Исключение
	
			ОшибкаЗагрузкиФайла = Новый Структура();
			УстановитьСообщение( ОшибкаЗагрузкиФайла, ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()) );
			ОшибкаЗагрузкиФайла.Вставить( "error", ОбновляемаяОбработка );
			Результат.errors.Добавить( ОшибкаЗагрузкиФайла );
			
		КонецПопытки;
	
	КонецЦикла;

	УдалитьФайлы( ИмяВременногоФайла );		
	
	Возврат Результат;

КонецФункции

// УстановитьЗагружатьФайлыИзВнешнегоХранилища включает/отключает функционал загрузки файлов
// из внешнего хранилища и возвращает описание результата выполнения данной операции.
// 
// Параметры:
// 	Значение - Булево - Истина - включить, Ложь - отключить;
// 	
// Возвращаемое значение:
// 	- Структура - описание:
// 		* message - Строка - результат операции;
//
Функция УстановитьЗагружатьФайлыИзВнешнегоХранилища( Знач Значение ) Экспорт
	
	Перем Результат;

	СООБЩЕНИЕ_ВКЛЮЧЕНО = НСтр( "ru = 'загрузка файлов включена';en = 'file uploads enabled '" );
	СООБЩЕНИЕ_ОТКЛЮЧЕНО = НСтр( "ru = 'загрузка файлов отключена';en = 'file uploads disabled'" );
	
	Константы.ЗагружатьФайлыИзВнешнегоХранилища.Установить( Значение );
	
	Результат = Новый Структура();
	
	Если ( Константы.ЗагружатьФайлыИзВнешнегоХранилища.Получить() ) Тогда
		
		УстановитьСообщение( Результат, СООБЩЕНИЕ_ВКЛЮЧЕНО );
		
	Иначе
		
		УстановитьСообщение( Результат, СООБЩЕНИЕ_ОТКЛЮЧЕНО );
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СхемаЗагрузкиФайла()
	
	Перем Результат;
	
	Результат = Новый Структура();
	Результат.Вставить( "uploaded", Новый Массив() );
	Результат.Вставить( "errors", Новый Массив() );

	Возврат Результат;	
	
КонецФункции

Функция ФайлВРеквизитеЭлемента()
	
	Перем Результат;
	
	Результат = Новый Структура();
	Результат.Вставить( "guid" );
	Результат.Вставить( "filename" );
	Результат.Вставить( "comment" );

	Возврат Результат;	
	
КонецФункции

Функция ДетальноеОписание()
	
	Перем Результат;
	
	Результат = ФайлВРеквизитеЭлемента();
	Результат.Вставить( "tables", Новый Массив() );

	Возврат Результат;	
	
КонецФункции

Функция ФайлВТабличнойЧасти()
	
	Перем Результат;
	
	Результат = Новый Структура();
	Результат.Вставить( "guid" );
	Результат.Вставить( "table" );
	Результат.Вставить( "line" );
	Результат.Вставить( "filename" );	
	Результат.Вставить( "comment" );

	Возврат Результат;	
	
КонецФункции

Процедура УстановитьСообщение( Результат, Знач Сообщение )
	
	Результат.Вставить( "message", Сообщение );
	
КонецПроцедуры

Функция ЗаписатьДанныеВоВременныйФайл( Знач ИмяВременногоФайла, Данные )
	
	Перем Файл;
	
	Файл = Новый Файл( ИмяВременногоФайла );
	
	Попытка
		
		Данные.Записать( Файл.ПолноеИмя );	
	
	Исключение
		
		УдалитьФайлы( ИмяВременногоФайла );
		
		ВызватьИсключение;
		
	КонецПопытки;
	
	Возврат Файл;
	
КонецФункции

Функция ПолучитьМетаданныеФайла( Знач Куда, Знач Файл )
	
	Перем Ссылка;
	Перем НомерСтроки;
	Перем Результат;

	Ссылка = Справочники.ВнешниеОбработки.ПолучитьСсылку( Новый УникальныйИдентификатор(Куда.guid) );
	НомерСтроки = Неопределено;
	Куда.Свойство( "line", НомерСтроки );
	НомерСтроки = ?( НомерСтроки = Неопределено, 0, НомерСтроки );	

	Результат = Новый Структура();			
	Результат.Вставить( "Ссылка", Ссылка );
	Результат.Вставить( "НомерСтроки", НомерСтроки );
	Результат.Вставить( "ИмяФайла", Куда.filename );
	Результат.Вставить( "Файл", Файл );
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти
