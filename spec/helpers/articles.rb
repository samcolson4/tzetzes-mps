def create_article
  Mp.create(id: 999, name: "Bob", mp_serial: "999", slug: "test-constituency")
  mp = Mp.find_by(id: 999)
  allow(Mp).to receive(:find_by).and_return(mp)

  Article.create(headline: "MP saves dog", datetime:"10:54", url:"http://www.melstridemp.com", tag:"Local News", article_text:"Ipsum Lorem mp dog saver!", mp_id:'999')
end
