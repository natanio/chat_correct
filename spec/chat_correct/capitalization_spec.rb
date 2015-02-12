require 'spec_helper'

RSpec.describe ChatCorrect::Capitalization do
  it 'returns true if a capitalization error is found' do
    token_a = 'Hello'
    token_b = 'hello'
    cc = ChatCorrect::Capitalization.new(token_a: token_a, token_b: token_b)
    expect(cc.capitalization_error?).to eq(true)
  end

  it 'returns false if a capitalization error is not found' do
    token_a = 'Hello'
    token_b = 'Hello'
    cc = ChatCorrect::Capitalization.new(token_a: token_a, token_b: token_b)
    expect(cc.capitalization_error?).to eq(false)
  end

  it 'should return false if token_a and token_b are not equal because this is a word choice error, not capitalization' do
    token_a = 'Usa'
    token_b = 'USA'
    cc = ChatCorrect::Capitalization.new(token_a: token_a, token_b: token_b)
    expect(cc.capitalization_error?).to eq(true)
  end

  it 'should return false if token_a and token_b are not equal because this is a word choice error, not capitalization' do
    token_a = 'hEllo'
    token_b = 'Hello'
    cc = ChatCorrect::Capitalization.new(token_a: token_a, token_b: token_b)
    expect(cc.capitalization_error?).to eq(true)
  end

  it 'should return false if missing text is added before the token' do
    token_a = 'They'
    token_b = 'they'
    cc = ChatCorrect::Capitalization.new(token_a: token_a, token_b: token_b)
    expect(cc.capitalization_error?).to eq(true)
  end
end
end
