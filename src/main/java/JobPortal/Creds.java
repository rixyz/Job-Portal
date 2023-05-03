package JobPortal;

import io.github.cdimascio.dotenv.Dotenv;

public class Creds {
    private static final Dotenv dotenv = Dotenv.load();
    protected static String SMTP_EMAIL = dotenv.get("SMTP_EMAIL");
    protected static String SMTP_PASS = dotenv.get("SMTP_PASS");
    protected static String DB_URL = dotenv.get("DB_URL");
    protected static String DB_USER = dotenv.get("DB_USER");
    protected static String DB_PASS = dotenv.get("DB_PASS");
}
