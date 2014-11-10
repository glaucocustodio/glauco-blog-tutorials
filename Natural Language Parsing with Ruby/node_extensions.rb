module MyGrammar
  class Value < Treetop::Runtime::SyntaxNode
  end

  class GreaterThanOperator < Treetop::Runtime::SyntaxNode
    def text_value
      '>'
    end
  end
end