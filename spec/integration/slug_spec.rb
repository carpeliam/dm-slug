require 'pathname'
require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

class NameExample
  include DataMapper::Resource
  has_slug
  property :id, Serial
  property :name, String
end

class TitleExample
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :length => 75, :unique_index => true
  has_slug :on => :title
end

class AlternateFieldExample
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  has_slug :on => :title, :called => :permalink
end

if HAS_SQLITE3 || HAS_MYSQL || HAS_POSTGRES
  
  describe 'DataMapper::Has::Slug' do
    before do
      DataMapper.auto_migrate!
    end
    it "should create a slug field" do
      ne = NameExample.create :name => 'foo bar'
      ne.respond_to? :slug
    end
    
    it "should have a slug field that matches the given name" do
      ne = NameExample.create :name => 'foo bar'
      NameExample.first.slug.should == 'foo-bar'
    end
    
    it "should accept an :on option" do
      te = TitleExample.create :title => 'foo bar'
      TitleExample.first.slug.should == 'foo-bar'
    end
    
    it "should respect the length of the :on field if known" do
      TitleExample.properties[:slug].length.should == 75 # TitleExample.properties[:title].length
      TitleExample.properties[:slug].unique_index.should == true # TitleExample.properties[:title].unique_index
    end
    
    it "should accept a :named option" do
      afe = AlternateFieldExample.create :title => 'foo bar'
      AlternateFieldExample.first.permalink.should == 'foo-bar'
    end
  end
end
