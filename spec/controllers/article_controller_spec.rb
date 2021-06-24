require 'rails_helper'

describe ArticlesController do
  describe "POST mps/:id/articles | #create" do
    it "adds an article to the database" do
      Mp.create(id: 999, name: "Bob", mp_serial: "999")

      Article.create(headline: "MP saves dog", datetime:"10:54", url:"www.melstridemp.com", tag:"Local News", article_text:"Ipsum Lorem mp dog saver!", mp_id:'999')

      expect(Article.find_by(headline: "MP saves dog")).to be
    end

    it "does not add an article, if it has the wrong serial" do
      Mp.create(id: 999, name: "Bob", mp_serial: "999")

      post :create, params: { headline: "MP saves dog", datetime:"10:54", url:"www.melstridemp.com", tag:"Local News", article_text:"Ipsum Lorem mp dog saver!", mp_id:'999', mp_serial:'0' }

      expect(Article.find_by(headline: "MP saves dog")).not_to be
    end
  end

  describe "#search" do
    it "Redirects to '/about' if blank" do
      post :search, params: { search: "" }
      expect(response).to redirect_to("/about")      
    end
  end

end
