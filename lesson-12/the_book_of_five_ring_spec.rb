require "capybara/rspec"
require "selenium-webdriver"

Capybara.javascript_driver = :selenium_chrome_headless

# Попробуйте Капибару как инструмент автоматизации ручных проверок.
#
# По адресу https://vasily.polovnyov.ru/5rings/ находится
# мини-книжка, которая умеет:
# * запоминать и восстанавливать текущую позицию в книге;
# * добавлять параграфы в закладки;
# * менять заголовок страницы на заголовок у текущей главы.
#
# Протестируйте эти сценарии.

feature "The Book of Five Rings", js: true do
  let(:book_url) { "https://vasily.polovnyov.ru/5rings/" }

  scenario "Remember current reading position" do
    visit book_url
  end

  scenario "Change page title to the current chapter" do
    visit book_url
  end

  scenario "Bookmark paragraphs" do
    visit book_url
  end
end
