package main_package;

import dao.CommentDao;
import dao.PostDao;
import entities.Comment;
import entities.Post;
import entities.Tag;
import entities.User;
import freemarker.template.TemplateException;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import static main_package.Helper.CURRENT_USER_KEY;

@WebServlet("/search_ajax")
public class SearchAjaxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String pattern = req.getParameter("pattern");
        String tags = req.getParameter("tags");
        List<String> tagList = new ArrayList<>();
        boolean check = true;
        if(pattern == null){
            pattern = "";
        }
        for(int i = 0; i < pattern.length(); i++){
            if(pattern.charAt(i) == ' '){
            }else if (pattern.charAt(i) == '#'){
                check = false;
                break;
            }else{
                break;
            }

        }
        if(!check) {
            Helper.parseTags(pattern, tagList);
            pattern = "";
        }
        System.out.println("pattern = " + pattern);
        String res = "";



        System.out.println("TAGS : ");
        for (String s : tagList) {
            System.out.println(s);
        }
        HashMap<String, Object> map = new HashMap<>();
        List<Post> posts = PostDao.search(pattern, tagList);
        for (Post post : posts) {
            post.setComments(CommentDao.getCommentsByPost(post));

            System.out.println("post = " + post);
        }
        map.put("posts", posts);
        try {
            res = Render.render(map, "post_body2.ftl");
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("posts", res);
        } catch (JSONException e) {
            e.printStackTrace();
        }
//        System.out.println("res = " + res);
//        System.out.println("jsonObject = " + jsonObject);
        resp.setContentType("text/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().close();

    }

    }
