require "spec_helper"

# Book — книга в библиотечном каталоге.
#
# `#epub?` возвращает true/false в зависимости от расширения книги (.epub или что-то другое).
# `#download_url` возвращает ссылку на скачивание книги. Книги сгруппированы по первой букве
# в названии книги:
#
# * /system/a/anatomy.pdf
# * /system/a/ants.epub
# * /system/x/xfiles.epub
class Book
  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def epub?
    path.end_with?(".epub")
  end

  def download_url
    "/system/#{path_prefix}/#{filename}"
  end

  private

  def filename
    File.basename(path)
  end

  def path_prefix
    filename[0].downcase
  end
end

RSpec.describe Book do
  describe '#epub?' do
    context 'when file *.epub' do
      let(:book) { Book.new(path: '/system/x/xfiles.epub') }

      it 'returns true' do
        expect(book.epub?).to be_truthy
      end
    end

    context 'wneh file not *.epub' do
      let(:book) { Book.new(path: '/system/x/xfiles.pdf') }

      it 'returns false' do
        expect(book.epub?).to be_falsey
      end
    end
  end

  describe '#download_url' do
    let(:book) { Book.new(path: 'xfiles.pdf') }

    it 'returns  /system/x/xfiles.pdf ' do
      expect(book.download_url).to  eq('/system/x/xfiles.pdf')
    end
  end
end
