package com.edu.safefood.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.edu.safefood.dto.Blog;

public class BlogSearch {

	public List<Blog> search(String query) throws MalformedURLException, IOException {
		Document doc = Jsoup
				.connect("http://search.zum.com/search.zum?method=egloos.post&query=" + query + "&qm=f_typing.egloos")
				.get();
		Element resc = doc.select("#blogItemUl").get(0);
		Elements blogs = resc.select("li");

		List<Blog> result = new ArrayList<Blog>();

		for (Element blog : blogs) {
			String href = blog.select(".thumb_photo").attr("href");
			String src = "";
			String title = "";

			try {
				src = "http://"
						+ blog.getElementsByTag("img").first().getElementsByAttribute("src").attr("src").substring(2);
				title = blog.getElementsByTag("img").first().getElementsByAttribute("alt").attr("alt");
			} catch (NullPointerException e) {
				href = "http://" + blog.getElementsByTag("a").get(2).text();
				src = "http://alfrescos.com.vn/skin/frontend/default/Jaspas/images/foods/Grilled-Halloumi-Salad.png";
				title = blog.getElementsByTag("a").first().text();
			}

			String regDate = blog.select(".txt_inline").text().replaceAll("신고", "");
			String txt = blog.select(".txt").text();
			String blogName = blog.getElementsByTag("a").last().getElementsByAttribute("title").attr("title");

			result.add(new Blog(href, src, title, regDate, txt, blogName));
		}

		return result;
	}
}
