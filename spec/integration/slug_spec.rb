require 'pathname'
require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

class NameExample
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  has_slug
end

class TitleExample
  include DataMapper::Resource
  property :id, Serial
  has_slug :on => :title
  property :title, String
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
    
    it "should accept a :named option" do
      afe = AlternateFieldExample.create :title => 'foo bar'
      AlternateFieldExample.first.permalink.should == 'foo-bar'
    end
  end
end
