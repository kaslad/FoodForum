package main_package;

import dao.CommentDao;
import dao.PostDao;
import dao.TagDao;
import entities.Comment;
import entities.Post;
import entities.Tag;
import entities.User;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/main")
public class MainPageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.sendRedirect("/search");
        req.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HashMap<String, Object> map = new HashMap<>();
        map.put("user", req.getSession().getAttribute(Helper.CURRENT_USER_KEY));
        try {
            Render.render(resp, map, "main2.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        /*HashMap<String, Object> map = new HashMap<>();
        Tag active = new Tag(-1, "kejfasdasfdasdfadfasdfasdfasdfafasd");
        List<String> tagsSearch = new ArrayList<>();
        if (req.getParameterMap().containsKey("tag")) {
            active = TagDao.getTagByName(req.getParameter("tag"));
            tagsSearch.add(active.getTag());
        }

        //without tags
        List<Post> postList = PostDao.search("", tagsSearch);

        if (postList != null) {
            for(Post e: postList){
                e.setComments(CommentDao.getCommentsByPost(e));
                System.out.println(e.getComments().size());
            }
        }

        map.put("posts", postList);
        map.put("user", (User)req.getSession().getAttribute(Helper.CURRENT_USER_KEY));
        map.put("active_tag", active);
        List<Tag> tags = TagDao.getPopularTags();
        map.put("pop_tags", tags);

        try {
            Render.render(resp, map, "main.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        */
    }
}
