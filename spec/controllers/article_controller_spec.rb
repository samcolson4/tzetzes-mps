require 'rails_helper'

describe ArticlesController do
  describe "POST mps/:id/articles" do
    it "adds an article to the database" do
      Mp.create(id: 999, name: "Bob", mp_serial: "999")
      mp = Mp.find_by(id: 999)
      allow(Mp).to receive(:find_by).and_return(mp)

      Article.create(headline: "MP saves dog", datetime:"10:54", url:"www.melstridemp.com", tag:"Local News", article_text:"Ipsum Lorem mp dog saver!", mp_id:'999')

      expect(Article.find_by(headline: "MP saves dog")).to be
    end
  end
end

=begin 
user = User.find_by(name: "Bob")
     allow(User).to receive(:find_by).and_return(user)
     Post.create(message: "Hello, world!", user_id: user.id, posted_to_id: user.id)
     my_post = Post.find_by(message: "Hello, world!")

     post :create, params: { post_id: my_post.id, comment: { body: "This is our comment", user_id: user.id } }
     expect(response).to redirect_to(root_url)
=end 
