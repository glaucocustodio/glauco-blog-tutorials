require "treetop"
#require 'pry'
#require 'pry-nav'

BASE_PATH = File.expand_path(File.dirname(__FILE__))
require File.join(BASE_PATH, "node_extensions.rb")

class Parser
  Treetop.load(File.join(BASE_PATH, "my_grammar.treetop"))

  def self.go statement, number_of_orders
    parser = MyGrammarParser.new
    
    tree = parser.parse(statement) 
    if !tree.nil?
      tree = clean_tree(tree)
    end
    rule = tree.inject(number_of_orders.to_s) do |final, current|
      final += current.text_value
    end
    puts rule
    eval rule
  end

  def self.clean_tree(root_node)
    return if(root_node.elements.nil?)
    root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each {|node| self.clean_tree(node) }
  end
end

assertion = Parser.go "if number of orders is greater than 20", 50
puts assertion