require "spec_helper"

class TodoPresenter
  attr_reader :todo

  def initialize(todo)
    @todo = todo
  end

  def as_json
    {
      reference_number: reference_number
      # и другие поля
    }
  end

  private

  def reference_number
    target.reference_number if target.respond_to?(:reference_number)
  end

  def target
    todo.target
  end
end

RSpec.describe TodoPresenter do
  # Не трогайте `#create` — это фейковая реализация аналогичного метода из FactoryGirl
  def create(*args)
    double(*args)
  end

  describe "#as_json" do
    context "todo's target is Post" do
      before do
        @post = create(:post, reference_number: "ia-42")
        @todo = described_class.new(create(:todo, target: @post))
      end

      it "should include reference number" do
        expect(@todo.as_json[:reference_number]).to eq @post.reference_number
      end
    end
  end
end
