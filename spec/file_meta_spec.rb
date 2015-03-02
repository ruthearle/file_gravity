require 'spec_helper'
require 'file_meta'

describe 'FileMeta' do

  let(:files_list)  { [{"id"=>14913224,
                        "name"=>"music",
                        "extension"=>"mp3",
                        "version"=>1,
                        "size"=>16377897,
                        "created_at"=>"2015-02-26T09:57:42Z",
                        "updated_at"=>"2015-02-26T09:58:08Z",
                        "creator"=>
                         {"name"=>"Ruth Earle",
                          "email"=>"me@ruthearle.com",
                          "uuid"=>"71f72a76-1c9c-4961-ba3c-2c59a43142b1"
                         },
                        "url"=>"https://my.workshare.com/decks/14913224",
                        "access_token"=>"Q1_lGRAy0bx90M6v",
                        "first_page_url"=>"https://my.workshare.com/images/icons/medium/mp3.png",
                        "folder_id"=>1209741
                        },
                        {"id"=>14913212,
                            "name"=>"binary",
                            "extension"=>"bin",
                            "version"=>1,
                            "size"=>1003,
                            "created_at"=>"2015-02-26T09:57:26Z",
                            "updated_at"=>"2015-02-26T09:57:28Z",
                            "creator"=>
                             {"name"=>"Ruth Earle",
                              "email"=>"me@ruthearle.com",
                              "uuid"=>"71f72a76-1c9c-4961-ba3c-2c59a43142b1"},
                            "url"=>"https://my.workshare.com/decks/14913212",
                            "access_token"=>"jDHB9OiKpjCEX25Z",
                            "first_page_url"=>"https://my.workshare.com/images/icons/medium/unknown.png",
                            "folder_id"=>1168672}
                      ]}
  let(:files) { FileMeta.new(files_list) }

  describe "#initialize" do
    it "will not raise an error when initialised" do
      expect{files}.not_to raise_error
    end
  end

  describe "#files" do
    it "lists all files" do
      expect(FileMeta.new(files_list).files).to eq files_list
    end
  end

  describe "#count" do
    it "calculates the number of files within a category" do
      category = 'song'
      expect(files.count(category)).to eq 1
    end
  end

  describe "#basic_weight" do
    describe "multiply" do
      it "calculates the basic weight for each category" do
        category = 'song'
        expect(files.basic_weight(category)).to eq 19.65
      end
    end
  end
end
