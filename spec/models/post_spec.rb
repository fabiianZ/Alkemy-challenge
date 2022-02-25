require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'before publication' do
    it 'must have a title' do  
    post = Post.new
    expect { post.save! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
end
