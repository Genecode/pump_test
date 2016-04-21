# Домашние задания к «[Тестовой рассылке](http://vasily.polovnyov.ru/tests/)»

## Установка

```shell
git clone git@github.com:vast/oh-my-tests.git
cd oh-my-tests
script/bootstrap
```

## Выполнение домашки

Одна домашка — один бранч. Создайте бранч, в котором будете делать домашку:

```shell
git checkout master
git checkout -b username-lesson-1
```

Как напишете тесты, проверьте их:

```shell
bin/rspec lesson-1
```

Если все в порядке, комитьте, заливайте на сервер и открывайте пуллреквест:

```shell
git commit -a -m "add tests for lesson 1"
git push origin -u username-lesson-1
```

Чтобы узнать больше о пуллреквестах и бранчах, прочтите:

* <https://git-scm.com/book/ru/v1/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8-%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F>
* <https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/>
* <https://help.github.com/articles/creating-a-pull-request/>
