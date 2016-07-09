require "capybara/rspec"
require "capybara/webkit"

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end

# Попробуйте Капибару как инструмент автоматизации ручных проверок.
#
# По адресу http://vasily.polovnyov.ru/5rings/ находится
# мини-книжка, которая умеет:
# * запоминать и восстанавливать текущую позицию в книге;
# * добавлять параграфы в закладки;
# * менять заголовок страницы на заголовок у текущей главы.
#
# Протестируйте эти сценарии, используя execute_script/evaluate_script.

feature "The Book of Five Rings", js: true do
  let(:book_url) { "http://vasily.polovnyov.ru/5rings/" }

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
