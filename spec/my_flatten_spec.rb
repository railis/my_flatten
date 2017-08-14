require_relative '../lib/my_flatten'

RSpec.describe Array, "#my_flatten" do

  context "mutability" do

    it "does not change original array" do
      source_arr = [1, [2, 3], []]
      source_arr.my_flatten
      expect(source_arr).to eq [1, [2, 3], []]
    end

  end

  context "return value" do

    context "when source array is empty" do

      it "returns an empty array" do
        expect([].my_flatten).to eq []
      end

    end

    context "when source array is a single level array" do

      subject { [1, "a", 23] }

      it "returns array with the same set of values" do
        expect(subject.my_flatten).to eq [1, "a", 23]
      end

    end

    context "when source array is a multiple level array" do

      let(:examples) do
        {
          [1, 2, [3]] => [1, 2, 3],
          [1, "a", ["bs", 3], "as"] => [1, "a", "bs", 3, "as"],
          [1, [2, "sa"], 4, [["a", 3], 1], [2], [1, [2, 3]]] => [1, 2, "sa", 4, "a", 3, 1, 2, 1, 2, 3]
        }
      end

      it "returns flattened array" do
        examples.each do |source_array, expected|
          expect(source_array.my_flatten).to eq expected
        end
      end

    end

    context "when source array contains empty child arrays" do

      it "returns flattened array without empty arrays" do
        source_arr = [1, [2, [], 3], 4, [], 5, []]
        expect(source_arr.my_flatten).to eq [1, 2, 3, 4, 5]
      end

    end

  end

end

RSpec.describe Array, "#my_flatten!" do

  context "mutability" do

    it "overwrites the original array" do
      arr = [1, [2, 3], 4]
      arr.my_flatten!
      expect(arr).to eq [1, 2, 3, 4]
    end

  end

end
