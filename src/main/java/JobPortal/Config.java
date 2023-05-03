package JobPortal;

import io.github.cdimascio.dotenv.Dotenv;

public class Config {
    public static String SMTP_EMAIL;
    public static String SMTP_PASS;
    public static String DB_URL;
    public static String DB_USER;
    public static String DB_PASS;

    private Config() {
        final Dotenv dotenv = Dotenv.load();
        SMTP_EMAIL = dotenv.get("SMTP_EMAIL");
        SMTP_PASS = dotenv.get("SMTP_PASS");
        DB_URL = dotenv.get("DB_URL");
        DB_USER = dotenv.get("DB_USER");
        DB_PASS = dotenv.get("DB_PASS");
    }

    public static String getConfig(String key) {
        final Dotenv dotenv = Dotenv.load();
        return dotenv.get(key);
    }
}