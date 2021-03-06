package main_package;

import dao.CommentDao;
import dao.PostDao;
import dao.TagDao;
import dao.UserDao;
import entities.Post;

import java.io.*;
import java.util.*;

public class Helper {

    public static final String ROOT_OF_PROJECT = "/Users/Vladislav/IdeaProjects/foodForum";
    public static final String CURRENT_USER_KEY = "current_user";
    //public static final String ROOT_OF_SERVER = "C:/apache-tomcat-9.0.0.M26";
    public static final String STORAGE_ROOT = "/Users/Vladislav/IdeaProjects/foodForum/web/templates/pictures";

    public static Calendar toCalendar(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal;
    }

    public static Post getFullPost(int id) {
        Post post = PostDao.getPostById(id);
        if (post == null) return null;
        post.setComments(CommentDao.getCommentsByPost(post));
        post.setTags(TagDao.getPostTags(post));
        post.setAuthor(UserDao.getAuthor(post));
        post.setPhotos(PostDao.getPhotoByPost(post));
        return post;
    }


    public static void parseTags(String tags, List<String> tagList) {

        for (String tag : Arrays.asList(tags.split(" +"))){
            for (String s : (Arrays.asList(tag.split("#+")))) {
                if (!s.equals("") && !s.matches(" +"))
                    tagList.add(s);

            }
        }
    }
    public static java.sql.Date toDate(Calendar calendar) {
        return new java.sql.Date(calendar.getTime().getTime());
    }

    public static void loadPhoto(String filePath, InputStream in) {
        OutputStream out = null;
        try {
            out = new FileOutputStream(new File(STORAGE_ROOT + "/" + filePath));

            final byte[] bytes = new byte[1024];
            int read;
            while ((read = in.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch(FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        parseTags("#tag", list);
        for(String s : list){
            System.out.println(s);
        }
    }
}
