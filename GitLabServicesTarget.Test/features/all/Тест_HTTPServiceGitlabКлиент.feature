# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: HTTPServiceGitlab
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabResponseVersion
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabResponseVersion(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabUpdateError423
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabUpdateError423(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabUpdateError403
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabUpdateError403(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabUpdateError401
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabUpdateError401(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabUpdateError400
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabUpdateError400(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabUpdate200
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabUpdate200(Контекст());' |