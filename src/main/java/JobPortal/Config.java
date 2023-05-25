package JobPortal;

public class Config {
    public static String getConfig(String key) {
        return System.getenv(key);
    }

    public static void main(String[] args) {
        System.out.println(Config.getConfig("PATH") + Config.getConfig("DB_USER") + Config.getConfig("DB_PASS"));
    }
}