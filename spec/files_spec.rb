require 'spec_helper'
require 'files'

describe 'Files' do

  it "#initialize" do
    files_list = [{'id'=>'1'}]
    expect{Files.new(files_list)}.not_to raise_error
  end
end
