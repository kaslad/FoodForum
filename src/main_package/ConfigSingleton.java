package main_package;

import freemarker.template.Configuration;
import freemarker.template.TemplateExceptionHandler;

import javax.servlet.ServletContext;

public class ConfigSingleton {
    public static final String ROOT_OF_PROJECT = "/Users/Vladislav/IdeaProjects/TourCompany";
    private static Configuration cfg = null;
    public static Configuration getConfig(ServletContext sc) {
        if (cfg == null){

            cfg = new Configuration();
            cfg.setServletContextForTemplateLoading(
                    sc,
                    "/templates"
            );
            cfg.setTemplateExceptionHandler(
                    TemplateExceptionHandler.HTML_DEBUG_HANDLER
            );
            cfg.setDefaultEncoding("UTF-8");
        }
        return cfg;
    }


}