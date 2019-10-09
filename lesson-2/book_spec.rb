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
    context 'when file is *.epub' do
      subject { described_class.new(path: '/system/x/xfiles.epub') }

      it 'returns true' do
        expect(subject).to be_epub
      end
    end

    context 'wneh file is not *.epub' do
      subject { Book.new(path: '/system/x/xfiles.pdf') }

      it 'returns false' do
        expect(subject).not_to be_epub
      end
    end
  end

  describe '#download_url' do
    subject { described_class.new(path: 'xfiles.pdf').download_url }

    it 'returns download url of book grouped by first letter of books title' do
      expect(subject).to eq('/system/x/xfiles.pdf')
    end
  end
end
