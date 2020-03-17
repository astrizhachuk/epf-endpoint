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

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabError423
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabError423(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabError403
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabError403(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabError401
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabError401(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlabError400
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlabError400(Контекст());' |

Сценарий: Тест_HTTPServiceGitlabКлиент (клиент): Тест_HTTPServiceGitlab200
	И я выполняю код встроенного языка
	| 'Тест_HTTPServiceGitlabКлиент.Тест_HTTPServiceGitlab200(Контекст());' |