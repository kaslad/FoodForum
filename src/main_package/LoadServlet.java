package main_package;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Base64;

@WebServlet("/load/*")
public class LoadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = Helper.STORAGE_ROOT + request.getPathInfo();

        System.out.println("filename = " + filename);
        ServletContext sc = getServletContext();


        // Get the MIME type of the image
        String mimeType = sc.getMimeType(filename);
        if (mimeType == null) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }
        System.out.println(mimeType + " mimeType");
        System.out.println(filename);

        // Set content type
        response.setContentType(mimeType);

        // Set content size
        File file = new File(filename);
        System.out.println(file);
        response.setContentLength((int)file.length());





        // Open the file and output streams
        //FileInputStream in = new FileInputStream(file);
        //BufferedInputStream bs = new BufferedInputStream(encodeFileToBase64Binary(file));

        PrintWriter out =  new PrintWriter(response.getOutputStream());
        out.println(encodeFileToBase64Binary(file));
        System.out.println(encodeFileToBase64Binary(file));
       /* BufferedOutputStream bos = new BufferedOutputStream(out);


        // Copy the contents of the file to the output stream

        int ch =0; ;
        while((ch=bs.read())!=-1) {
            bos.write(ch);
            System.out.println(ch);
        }
        bos.flush();
        bos.close();
        bs.close();
        in.close();
        out.close();
        */
    }

    private static String encodeFileToBase64Binary(File file) {
        String encodedfile = null;
        try {
            FileInputStream fileInputStreamReader = new FileInputStream(file);
            byte[] bytes = new byte[(int) file.length()];
            fileInputStreamReader.read(bytes);
            encodedfile = new String(Base64.getEncoder().encode(bytes), "UTF-8");

        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return encodedfile;
    }
}
