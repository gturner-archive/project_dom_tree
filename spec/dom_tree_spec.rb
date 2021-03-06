
require 'node'
require 'dom_tree'

describe DomTree do
 
 let(:dom_tree) { DomTree.new }
 let(:dom_tree_error) { DomTree.new("arguments")}
 let (:test_html) { "<div>
                          div text before
                            <p>
                              p text
                            </p>
                            <div>
                              more div text
                            </div>
                          div text after
                        </div>" 
                      }
 
  describe '#initialize' do
    it 'returns an instance of DomTree' do
      expect(dom_tree).to be_an_instance_of(DomTree)
    end

    it 'will return an error if initalized with an argument' do
      expect {dom_tree_error}.to raise_error(ArgumentError)
    end

    it 'creates a document node with the type set to document head' do
      expect(dom_tree.document.type).to eq("document head")
    end
  end


  describe '#parse_string' do
   

    it 'takes a string as an argument' do
      expect { dom_tree.parse_string("test") }.to_not raise_error
    end

    it 'removes html formatting and retuns an array of strings for each element' do
        expect(dom_tree.parse_string(test_html)).to eq(["<div>", "div text before", "<p>", "p text", "</p>", "<div>", "more div text", "</div>", "div text after", "</div>"])
        end

    end

  describe '#build_tree' do
    it 'takes a string as an argument' do
      expect { dom_tree.build_tree("test") }.to_not raise_error
    end

    it 'after building a tree the head node has correct number of children' do
      dom_tree.build_tree(test_html)
      expect(dom_tree.document.children.length).to eq(1)
    end 
  end

end